import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:editable/editable.dart';
import 'package:file_saver/file_saver.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gppsupporters/DatabaseUtils/VitalsSheetKey.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart' as Excel;
import 'package:flutter/foundation.dart';
import '../DatabaseUtils/LabSheetKeys.dart';
import '../Model/Client.dart';

class VitalsScreen extends StatefulWidget {
  static String id="vitals";
  String code;
  String name;
   VitalsScreen({Key? key, required this.code,required this.name}) : super(key: key);

  @override
  State<VitalsScreen> createState() => _VitalsScreenState();
}

class _VitalsScreenState extends State<VitalsScreen> {


  final _editableKey = GlobalKey<EditableState>();
  final _editableKey2 = GlobalKey<EditableState>();
  final _editableKey3 = GlobalKey<EditableState>();

  List returnedRows=[];
  List returnedRowsABG=[];
  List returnedRowsCulture=[];

  Client client= Client();

  List rows = [

  ];
  List cols = [
    {"title": 'Date', 'widthFactor': 0.2, 'key': 'date', 'editable': true,},
    {"title": 'BP (60/90 -> 120/80 )', 'widthFactor': 0.4, 'key': 'bp'},
    {"title": 'HR (60 To 100)', 'widthFactor': 0.4,'key': 'hr'},
    {"title": 'Temperature (36.5°C to 37.3°C)' ,'widthFactor': 0.4, 'key': 'temp'},
    {"title": 'RR (12-18 b/min)','widthFactor': 0.4, 'key': 'rr'},
    {"title": 'BGL (Random <125 mg/dl-Fasting 70-100 mg/dl)','widthFactor': 0.4, 'key': 'bgl'},
    {"title": 'Urine Input','widthFactor': 0.4, 'key': 'urinei'},
    {"title": 'Urine Output','widthFactor': 0.4, 'key': 'urineo'},
    {"title": 'Urine Net','widthFactor': 0.4, 'key': 'urinen'},
    {"title": 'Drain Output','widthFactor': 0.4, 'key': 'draino'},


  ];

  List colsABG = [
    {"title": 'Date', 'widthFactor': 0.2, 'key': 'date', 'editable': true,},

    {"title": 'PH (7.35-7.45)', 'widthFactor': 0.4, 'key': 'ph', 'editable': true,},
    {"title": 'PO2 (75-100 mmHg)', 'widthFactor': 0.4, 'key': 'po2'},
    {"title": 'PCO2 (35-45 mmHG)', 'widthFactor': 0.4,'key': 'pco2'},
    {"title": 'HCO3 (18-22 mmol/L)' ,'widthFactor': 0.4, 'key': 'hco3'},
    {"title": 'Oxygen saturation (96%-100%)','widthFactor': 0.4, 'key': 'oxygenS'},



  ];

  List colsCulture = [
    {"title": 'Date', 'widthFactor': 0.2, 'key': 'date', 'editable': true,},
    {"title": 'Culture type', 'widthFactor': 0.4, 'key': 'culturet'},
    {"title": 'Organism', 'widthFactor': 0.4,'key': 'organsim'},
    {"title": 'Antibiogram' ,'widthFactor': 0.4, 'key': 'antibiogram'},



  ];


  Future<void> generateExcel(AsyncSnapshot<QuerySnapshot> snapshot, String sheetType) async
  {
    // Map<String,dynamic> data=patient.originateData();
    int row=1;
    int col=1;
    //Create a Excel document.
    //Creating a workbook.
    final Excel.Workbook workbook = Excel.Workbook();
    //Accessing via index.
    final Excel.Worksheet sheet = workbook.worksheets[0];

    // Set the text value.
    for(var column in cols) {
      sheet.getRangeByIndex(row, col).setText(column['title']);
      col++;
    }
    sheet.getRangeByIndex(row, col).setText("patient name");

    sheet.getRangeByIndex(2, col).setText(widget.name);
    row=row+1;
    for(var rowV in returnedRows){
      col=1;
      for(var column in cols) {
        sheet.getRangeByIndex(row, col).setText(rowV[column['key'].toString()]??"-");
        col++;
      }
      row++;
    }


    if (!kIsWeb) {
      if (Platform.isIOS ||
          Platform.isAndroid ||
          Platform.isMacOS) {
        bool status = await Permission.storage.isGranted;

        if (!status) await Permission.storage.request();
      }
    }



    showToast("Vitals - $sheetType sheet saved succesfully");



    List<int> sheets = workbook.saveAsStream();

    workbook.dispose();
    Uint8List dataList = Uint8List.fromList(sheets);
    MimeType type = MimeType.MICROSOFTEXCEL;
    String path = await FileSaver.instance.saveAs(
        "Vitals -$sheetType - ${widget.code}",
        dataList,
        "xlsx",
        type);
    print(path);




  }



  void showToast(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white);
  }


  /// Function to add a new row
  /// Using the global key assigined to Editable widget
  /// Access the current state of Editable
  void _addNewRow() {

    setState(() {


      _editableKey.currentState?.createRow();
      // cols.add({"title": 'added', 'widthFactor': 0.2, 'key': 'added'});
      print("row added , ${returnedRows.length}");

    });
  }

  void _addNewColumn(){

    setState(() {

      _editableKey.currentState?.columns?.add({"title": cols.length.toString(), 'widthFactor': 0.2, 'key': cols.length.toString()});
      print("col added , ${cols.length}");

    });

  }

  void _addNewRowABG() {

    setState(() {


      _editableKey2.currentState?.createRow();
      // cols.add({"title": 'added', 'widthFactor': 0.2, 'key': 'added'});
      print("row added , ${returnedRows.length}");

    });
  }

  void _addNewColumnABG(){

    setState(() {

      _editableKey2.currentState?.columns?.add({"title": colsABG.length.toString(), 'widthFactor': 0.2, 'key': colsABG.length.toString()});
      print("col added , ${colsABG.length}");

    });

  }

  void _addNewRowCulture() {

    setState(() {


      _editableKey3.currentState?.createRow();
      // cols.add({"title": 'added', 'widthFactor': 0.2, 'key': 'added'});
      print("row added , ${returnedRows.length}");

    });
  }

  void _addNewColumnCulture(){

    setState(() {

      _editableKey3.currentState?.columns?.add({"title": colsCulture.length.toString(), 'widthFactor': 0.2, 'key': colsCulture.length.toString()});
      print("col added , ${colsCulture.length}");

    });

  }

  Future<void> save(Map<String,dynamic> dataToBackend, AsyncSnapshot<QuerySnapshot> snapshot) async{

    if(snapshot.data!.docs.where((element) => element['row']==dataToBackend['row'] && element['hCode']==widget.code).isEmpty) {

      print("yooh b2a , ${dataToBackend['row']}");
      await FirebaseFirestore.instance
          .collection(VitalsSheetKey.table)
          .add(dataToBackend);
    }else{
      var checkedValue=snapshot.data?.docs.firstWhere((element) =>element['user']==client.token && element['row']==dataToBackend['row'] && element['hCode']==widget.code);
      await FirebaseFirestore.instance.collection(VitalsSheetKey.table).doc(checkedValue?.reference.id).update(dataToBackend);

    }
  }

  Future<void> cloneData(var value, AsyncSnapshot<QuerySnapshot> snapshot) async{





    int i=1;

    Map<String,dynamic> dataToBackend=Map();


    dataToBackend.putIfAbsent(LabSheetKeys.user, () => client.token);
    dataToBackend.putIfAbsent("hCode", () => widget.code);



    value.keys.forEach((k) => dataToBackend.putIfAbsent(k, () => value[k]));

    // dataToBackend.addAll(value);

    await save(dataToBackend,snapshot);

    print("data to backend : : $dataToBackend");

  }


  Future<void> saveABG(Map<String,dynamic> dataToBackend, AsyncSnapshot<QuerySnapshot> snapshot) async{

    if(snapshot.data!.docs.where((element) => element['row']==dataToBackend['row'] && element['hCode']==widget.code).isEmpty) {

      print("yooh b2a , ${dataToBackend['row']}");
      await FirebaseFirestore.instance
          .collection(VitalsSheetKey.tableABG)
          .add(dataToBackend);
    }else{
      var checkedValue=snapshot.data?.docs.firstWhere((element) =>element['user']==client.token && element['row']==dataToBackend['row'] && element['hCode']==widget.code);
      await FirebaseFirestore.instance.collection(VitalsSheetKey.tableABG).doc(checkedValue?.reference.id).update(dataToBackend);

    }
  }

  Future<void> cloneDataABG(var value, AsyncSnapshot<QuerySnapshot> snapshot) async{





    int i=1;

    Map<String,dynamic> dataToBackend=Map();


    dataToBackend.putIfAbsent(LabSheetKeys.user, () => client.token);
    dataToBackend.putIfAbsent("hCode", () => widget.code);

    // if(value['lab']!=null) {
    //   dataToBackend.putIfAbsent(LabSheetKeys.labName, () => value['lab']);
    // }


    value.keys.forEach((k) => dataToBackend.putIfAbsent(k, () => value[k]));

    // dataToBackend.addAll(value);

    await saveABG(dataToBackend,snapshot);

    print("data to backend : : $dataToBackend");

  }



  Future<void> saveCulture(Map<String,dynamic> dataToBackend, AsyncSnapshot<QuerySnapshot> snapshot) async{

    if(snapshot.data!.docs.where((element) => element['row']==dataToBackend['row'] && element['hCode']==widget.code).isEmpty) {

      print("yooh b2a , ${dataToBackend['row']}");
      await FirebaseFirestore.instance
          .collection(VitalsSheetKey.tableCulture)
          .add(dataToBackend);
    }else{
      var checkedValue=snapshot.data?.docs.firstWhere((element) =>element['user']==client.token && element['row']==dataToBackend['row'] && element['hCode']==widget.code);
      await FirebaseFirestore.instance.collection(VitalsSheetKey.tableCulture).doc(checkedValue?.reference.id).update(dataToBackend);

    }
  }

  Future<void> cloneDataCulture(var value, AsyncSnapshot<QuerySnapshot> snapshot) async{





    int i=1;

    Map<String,dynamic> dataToBackend=Map();


    dataToBackend.putIfAbsent(LabSheetKeys.user, () => client.token);
    dataToBackend.putIfAbsent("hCode", () => widget.code);

    // if(value['lab']!=null) {
    //   dataToBackend.putIfAbsent(LabSheetKeys.labName, () => value['lab']);
    // }


    value.keys.forEach((k) => dataToBackend.putIfAbsent(k, () => value[k]));

    // dataToBackend.addAll(value);

    await saveCulture(dataToBackend,snapshot);

    print("data to backend : : $dataToBackend");

  }





  ///Print only edited rows.
  void _printEditedRows() {
    List editedRows = _editableKey.currentState!.editedRows;
    // print(editedRows);
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      height: MediaQuery.of(context).size.height*0.8,
      child: SingleChildScrollView(
        child: Column(
          children: [
            StreamBuilder(

                stream: FirebaseFirestore.instance.collection(VitalsSheetKey.table).snapshots(),
                builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  var rowsBackend= snapshot.data?.docs.where((element) => element['user']==client.token && element['hCode']==widget.code);
                  returnedRows=[];
                  if(!(rowsBackend!.isEmpty)) {
                    for(var row in rowsBackend) {

                      Map<String,dynamic> rowData=row.data() as Map<String, dynamic>;

                      for(var singleCol in cols){
                        if(!rowData.containsKey(singleCol['key'])){
                          print("missing $singleCol");

                          rowData.putIfAbsent(singleCol['key'], () => '-');
                        }
                      }

                      returnedRows.add(rowData);
                    }

                    returnedRows.sort((a, b) {
                      if(a['row']>b['row']) {
                        return 1;
                      } else {
                        return 0;
                      }
                    });
                  }
                  // var c= snapshot.data?.docs.where((element) => element['token']==client.token);

                  return  SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                          children: [

                            FloatingActionButton.extended(
                              label: const Text('Add row', style: TextStyle(color: Colors.white),), // <-- Text
                              backgroundColor: Colors.blue.shade900,
                              icon: const Icon( // <-- Icon
                                Icons.add,
                                color: Colors.white,

                              ),
                              onPressed: () {

                                _addNewRow();
                              },
                            ),
                            FloatingActionButton(

                              backgroundColor: Colors.grey.shade600,
                              child: const Icon(
                                // <-- Icon
                                Icons.print,
                                color: Colors.white,
                              ),
                              onPressed: ()async {
                                final ConfirmAction action = (await _asyncConfirmDialog(context))!;

                                if(action==ConfirmAction.Accept){
                                  await generateExcel(snapshot,"1");
                                }
                              },
                            ),
                            FloatingActionButton.extended(
                              label: const Text('Add column', style: TextStyle(color: Colors.white)), // <-- Text
                              backgroundColor: Colors.blue.shade900,
                              icon: const Icon( // <-- Icon
                                Icons.add_box_outlined,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                _addNewColumn();
                              },
                            ),

                          ],
                        ),

                        SizedBox(height: 15,),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                              border: Border.all(color: Colors.blue.shade900, width: 1.2)
                          ),
                          // margin: EdgeInsets.only(bottom: 16),
                          height: MediaQuery.of(context).size.height*0.6,
                          child: Editable(
                            key: _editableKey,
                            columns: cols,
                            rows: returnedRows,
                            zebraStripe: true,
                            stripeColor1: Colors.blue.shade50,
                            stripeColor2: Colors.grey.shade200,
                            onRowSaved: (value) async {
                              print(value);
                              await cloneData(value,snapshot);
                              // FirebaseFirestore.instance
                              //     .collection(LabSheetKeys.table)
                              //     .add({LabSheetKeys.user:});
                              // print(1+ value);
                            },
                            onSubmitted: (value) async {
                              await cloneData(value,snapshot);

                              // print(value);
                            },
                            borderColor: Colors.blueGrey,
                            tdStyle: TextStyle(fontWeight: FontWeight.bold),
                            trHeight: 80,
                            thStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                            thAlignment: TextAlign.center,
                            thVertAlignment: CrossAxisAlignment.end,
                            thPaddingBottom: 3,
                            showSaveIcon: true,
                            saveIconColor: Colors.black,
                            // showCreateButton: true,
                            tdAlignment: TextAlign.center,
                            tdEditableMaxLines: 100, // don't limit and allow data to wrap
                            tdPaddingTop: 14,
                            tdPaddingBottom: 14,
                            tdPaddingLeft: 10,
                            tdPaddingRight: 8,
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                                borderRadius: BorderRadius.all(Radius.circular(0))),
                          ),
                        ),

                      ],
                    ),
                  );

                }),
            SizedBox(height: 20,),
            Divider(thickness: 3,),
            SizedBox(height: 20,),
            const Text("ABG",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            SizedBox(height: 15,),

            StreamBuilder(

                stream: FirebaseFirestore.instance.collection(VitalsSheetKey.tableABG).snapshots(),
                builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  var rowsBackend= snapshot.data?.docs.where((element) => element['user']==client.token && element['hCode']==widget.code );
                  returnedRowsABG=[];
                  if(!(rowsBackend!.isEmpty)) {
                    for(var row in rowsBackend) {

                      Map<String,dynamic> rowData=row.data() as Map<String, dynamic>;

                      for(var singleCol in colsABG){
                        if(!rowData.containsKey(singleCol['key'])){
                          print("missing $singleCol");

                          rowData.putIfAbsent(singleCol['key'], () => '-');
                        }
                      }

                      returnedRowsABG.add(rowData);
                    }

                    returnedRowsABG.sort((a, b) {
                      if(a['row']>b['row']) {
                        return 1;
                      } else {
                        return 0;
                      }
                    });
                  }
                  // var c= snapshot.data?.docs.where((element) => element['token']==client.token);

                  return  SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                          children: [

                            FloatingActionButton.extended(
                              label: const Text('Add row', style: TextStyle(color: Colors.white),), // <-- Text
                              backgroundColor: Colors.blue.shade900,
                              icon: const Icon( // <-- Icon
                                Icons.add,
                                color: Colors.white,

                              ),
                              onPressed: () {

                                _addNewRowABG();
                              },
                            ),
                            FloatingActionButton(

                              backgroundColor: Colors.grey.shade600,
                              child: const Icon(
                                // <-- Icon
                                Icons.print,
                                color: Colors.white,
                              ),
                              onPressed: ()async {
                                final ConfirmAction action = (await _asyncConfirmDialog(context))!;

                                if(action==ConfirmAction.Accept){
                                  await generateExcel(snapshot,"ABG");
                                }
                              },
                            ),
                            FloatingActionButton.extended(
                              label: const Text('Add column', style: TextStyle(color: Colors.white)), // <-- Text
                              backgroundColor: Colors.blue.shade900,
                              icon: const Icon( // <-- Icon
                                Icons.add_box_outlined,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                _addNewColumnABG();
                              },
                            ),

                          ],
                        ),

                        SizedBox(height: 15,),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                              border: Border.all(color: Colors.blue.shade900, width: 1.2)
                          ),
                          // margin: EdgeInsets.only(bottom: 16),
                          height: MediaQuery.of(context).size.height*0.6,
                          child: Editable(
                            key: _editableKey2,
                            columns: colsABG,
                            rows: returnedRowsABG,
                            zebraStripe: true,
                            stripeColor1: Colors.blue.shade50,
                            stripeColor2: Colors.grey.shade200,
                            onRowSaved: (value) async {
                              print(value);
                              await cloneDataABG(value,snapshot);
                              // FirebaseFirestore.instance
                              //     .collection(LabSheetKeys.table)
                              //     .add({LabSheetKeys.user:});
                              // print(1+ value);
                            },
                            onSubmitted: (value) async {
                              await cloneDataABG(value,snapshot);

                              // print(value);
                            },
                            borderColor: Colors.blueGrey,
                            tdStyle: TextStyle(fontWeight: FontWeight.bold),
                            trHeight: 80,
                            thStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                            thAlignment: TextAlign.center,
                            thVertAlignment: CrossAxisAlignment.end,
                            thPaddingBottom: 3,
                            showSaveIcon: true,
                            saveIconColor: Colors.black,
                            // showCreateButton: true,
                            tdAlignment: TextAlign.center,
                            tdEditableMaxLines: 100, // don't limit and allow data to wrap
                            tdPaddingTop: 14,
                            tdPaddingBottom: 14,
                            tdPaddingLeft: 10,
                            tdPaddingRight: 8,
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                                borderRadius: BorderRadius.all(Radius.circular(0))),
                          ),
                        ),

                      ],
                    ),
                  );

                }),
            SizedBox(height: 20,),
            Divider(thickness: 3,),
            SizedBox(height: 20,),
            const Text("Culture",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            SizedBox(height: 15,),
            StreamBuilder(

                stream: FirebaseFirestore.instance.collection(VitalsSheetKey.tableCulture).snapshots(),
                builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  var rowsBackend= snapshot.data?.docs.where((element) => element['user']==client.token && element['hCode']==widget.code);
                  returnedRowsCulture=[];
                  if(!(rowsBackend!.isEmpty)) {
                    for(var row in rowsBackend) {

                      Map<String,dynamic> rowData=row.data() as Map<String, dynamic>;

                      for(var singleCol in colsCulture){
                        if(!rowData.containsKey(singleCol['key'])){
                          print("missing $singleCol");

                          rowData.putIfAbsent(singleCol['key'], () => '-');
                        }
                      }

                      returnedRowsCulture.add(rowData);
                    }

                    returnedRowsCulture.sort((a, b) {
                      if(a['row']>b['row']) {
                        return 1;
                      } else {
                        return 0;
                      }
                    });
                  }
                  // var c= snapshot.data?.docs.where((element) => element['token']==client.token);

                  return  SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                          children: [

                            FloatingActionButton.extended(
                              label: const Text('Add row', style: TextStyle(color: Colors.white),), // <-- Text
                              backgroundColor: Colors.blue.shade900,
                              icon: const Icon( // <-- Icon
                                Icons.add,
                                color: Colors.white,

                              ),
                              onPressed: () {

                                _addNewRowCulture();
                              },
                            ),
                            FloatingActionButton(

                              backgroundColor: Colors.grey.shade600,
                              child: const Icon(
                                // <-- Icon
                                Icons.print,
                                color: Colors.white,
                              ),
                              onPressed: ()async {
                                final ConfirmAction action = (await _asyncConfirmDialog(context))!;

                                if(action==ConfirmAction.Accept){
                                  await generateExcel(snapshot,"Culture");
                                }
                              },
                            ),
                            FloatingActionButton.extended(
                              label: const Text('Add column', style: TextStyle(color: Colors.white)), // <-- Text
                              backgroundColor: Colors.blue.shade900,
                              icon: const Icon( // <-- Icon
                                Icons.add_box_outlined,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                _addNewColumnCulture();
                              },
                            ),

                          ],
                        ),

                        SizedBox(height: 15,),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                              border: Border.all(color: Colors.blue.shade900, width: 1.2)
                          ),
                          // margin: EdgeInsets.only(bottom: 16),
                          height: MediaQuery.of(context).size.height*0.6,
                          child: Editable(
                            key: _editableKey3,
                            columns: colsCulture,
                            rows: returnedRowsCulture,
                            zebraStripe: true,
                            stripeColor1: Colors.blue.shade50,
                            stripeColor2: Colors.grey.shade200,
                            onRowSaved: (value) async {
                              print(value);
                              await cloneDataCulture(value,snapshot);
                              // FirebaseFirestore.instance
                              //     .collection(LabSheetKeys.table)
                              //     .add({LabSheetKeys.user:});
                              // print(1+ value);
                            },
                            onSubmitted: (value) async {
                              await cloneDataCulture(value,snapshot);

                              // print(value);
                            },
                            borderColor: Colors.blueGrey,
                            tdStyle: TextStyle(fontWeight: FontWeight.bold),
                            trHeight: 80,
                            thStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                            thAlignment: TextAlign.center,
                            thVertAlignment: CrossAxisAlignment.end,
                            thPaddingBottom: 3,
                            showSaveIcon: true,
                            saveIconColor: Colors.black,
                            // showCreateButton: true,
                            tdAlignment: TextAlign.center,
                            tdEditableMaxLines: 100, // don't limit and allow data to wrap
                            tdPaddingTop: 14,
                            tdPaddingBottom: 14,
                            tdPaddingLeft: 10,
                            tdPaddingRight: 8,
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                                borderRadius: BorderRadius.all(Radius.circular(0))),
                          ),
                        ),

                      ],
                    ),
                  );

                }),


          ],
        ),
      ),
    );


  }
}

enum ConfirmAction { Cancel, Accept}
Future<ConfirmAction?> _asyncConfirmDialog(BuildContext context) async {
  return showDialog<ConfirmAction>(
    context: context,
    barrierDismissible: false, // user must tap button for close dialog!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Generating excel sheet'),
        content: const Text(
            'This will generate excel sheet for vitals sheet of patient'),
        actions: <Widget>[
          ElevatedButton(

            child: const Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop(ConfirmAction.Cancel);
            },
          ),
          ElevatedButton(
            child: const Text('Accept'),
            onPressed: () {
              Navigator.of(context).pop(ConfirmAction.Accept);
            },
          )
        ],
      );
    },
  );
}
