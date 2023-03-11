import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:editable/editable.dart';
import 'package:flutter/material.dart';

import '../DatabaseUtils/LabSheetKeys.dart';
import '../DatabaseUtils/OncoSheetKeys.dart';
import '../Model/Client.dart';

class OncoTable extends StatefulWidget {
    String code;
    int tableIndex;
   OncoTable({Key? key,required this.code,required this.tableIndex}) : super(key: key);

  @override
  State<OncoTable> createState() => _OncoTableState();
}

class _OncoTableState extends State<OncoTable> {

  Client client= Client();

  List rows = List.generate(7, (index) => null);

  TextEditingController bsaController=TextEditingController();
  TextEditingController weightController=TextEditingController();
  TextEditingController heightController=TextEditingController();
  TextEditingController startDateController=TextEditingController();


  List cols = [
    {"title": 'Drug Name', 'widthFactor': 0.4, 'key': 'drugName', 'editable': true,},
    {"title": 'Dose/m^2', 'widthFactor': 0.4, 'key': 'dose'},
    {"title": 'Rate of Infusion', 'widthFactor': 0.4,'key': 'rateOfInfusion'},
    {"title": 'Total Dose' ,'widthFactor': 0.4, 'key': 'totalDose'},
    {"title": 'D1','widthFactor': 0.4, 'key': 'd1'},
    {"title": 'D2','widthFactor': 0.4, 'key': 'd2'},
    {"title": 'D3','widthFactor': 0.4, 'key': 'd3'},
    {"title": 'D4','widthFactor': 0.4, 'key': 'd4'},
    {"title": 'D5','widthFactor': 0.4, 'key': 'd5'},
    {"title": 'D6','widthFactor': 0.4, 'key': 'd6'},


  ];
  List returnedRows=[];

  final _editableKey = GlobalKey<EditableState>();

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

  Future<void> save(Map<String,dynamic> dataToBackend, AsyncSnapshot<QuerySnapshot> snapshot) async{

    if(snapshot.data!.docs.where((element) => element['row']==dataToBackend['row'] && element['hCode']==widget.code && element['tableIndex']==widget.tableIndex).isEmpty) {

      print("yooh b2a , ${dataToBackend['row']}");
      await FirebaseFirestore.instance
          .collection(OncoSheetKeys.table)
          .add(dataToBackend);
    }else{
      var checkedValue=snapshot.data?.docs.firstWhere((element) =>element['user']==client.token && element['row']==dataToBackend['row'] && element['hCode']==widget.code && element['tableIndex']==widget.tableIndex);
      await FirebaseFirestore.instance.collection(OncoSheetKeys.table).doc(checkedValue?.reference.id).update(dataToBackend);

    }
  }

  Future<void> cloneData(var value, AsyncSnapshot<QuerySnapshot> snapshot) async{


    int i=1;

    Map<String,dynamic> dataToBackend={};


    dataToBackend.putIfAbsent(LabSheetKeys.user, () => client.token);
    dataToBackend.putIfAbsent("hCode", () => widget.code);
    dataToBackend.putIfAbsent("tableIndex", () => widget.tableIndex);

    if(bsaController.text.isNotEmpty) {
      dataToBackend.putIfAbsent("bsa", () => bsaController.text.toString());
    }
    if(weightController.text.isNotEmpty) {
      dataToBackend.putIfAbsent("weight", () => weightController.text.toString());
    }
    if(heightController.text.isNotEmpty) {
      dataToBackend.putIfAbsent("height", () => heightController.text.toString());
    }
    if(startDateController.text.isNotEmpty) {
      dataToBackend.putIfAbsent("startDate", () => startDateController.text.toString());
    }


    value.keys.forEach((k) => dataToBackend.putIfAbsent(k, () => value[k]));

    // dataToBackend.addAll(value);

    await save(dataToBackend,snapshot);

    print("data to backend : : $dataToBackend");

  }


  @override
  Widget build(BuildContext context) {
    return  StreamBuilder(

        stream: FirebaseFirestore.instance.collection(OncoSheetKeys.table).snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          var rowsBackend= snapshot.data?.docs.where((element) => element['user']==client.token && element['hCode']==widget.code && element['tableIndex']==widget.tableIndex);
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
          int rowLength=returnedRows.length;
          for(int i=0; i<9-rowLength;i++) {
            Map<String,dynamic> newRow={};

            for(var singleCol in cols){
              if(!newRow.containsKey(singleCol['key'])){
                print("missing $singleCol");

                newRow.putIfAbsent(singleCol['key'], () => '-');
              }
            }

            returnedRows.add(newRow);
          }








          // var c= snapshot.data?.docs.where((element) => element['token']==client.token);

          return  SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                 Row(
                   mainAxisSize: MainAxisSize.max,
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   children: [
                     Flexible(
                       child: TextField(
                         controller: bsaController,
                        decoration: InputDecoration(
                          label: returnedRows.first['bsa']!=null?Text(returnedRows.first['bsa']):null,

                          hintText: "BSA",
                          border: OutlineInputBorder(
                            borderSide: BorderSide(width: 7, color: Colors.blue.shade900),
                          ),

                        ),
                ),
                     ),
                     SizedBox(width: 10,),
                     Flexible(
                       child: TextField(
                         controller: weightController,

                         decoration: InputDecoration(
                           label: returnedRows.first['weight']!=null?Text(returnedRows.first['weight']):null,

                           hintText: "Weight",
                           border: OutlineInputBorder(
                             borderSide: BorderSide(width: 7, color: Colors.blue.shade900),
                           ),

                         ),
                       ),
                     ),
                     SizedBox(width: 10,),

                     Flexible(

                       child: TextField(
                         controller: heightController,

                         decoration: InputDecoration(
                           label: returnedRows.first['height']!=null?Text(returnedRows.first['height']):null,

                           hintText: "Height",
                           border: OutlineInputBorder(
                             borderSide: BorderSide(width: 7, color: Colors.blue.shade900),
                           ),

                         ),
                       ),
                     ),
                     SizedBox(width: 10,),

                     Flexible(
                       child: TextField(
                         controller: startDateController,

                         decoration: InputDecoration(
                           label: returnedRows.first['startDate']!=null?Text(returnedRows.first['startDate']):null,

                           hintText: "St Date",
                           border: OutlineInputBorder(
                             borderSide: BorderSide(width: 7, color: Colors.blue.shade900),
                           ),

                         ),
                       ),
                     ),

                   ],
                 ),

                SizedBox(height: 10,),

                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      border: Border.all(color: Colors.blue.shade900, width: 1.2)
                  ),
                  // margin: EdgeInsets.only(bottom: 16),
                  height: MediaQuery.of(context).size.height*0.6,
                  child: Focus(
                    onFocusChange: (value){
                      if(value){
                        print("focus on table number: ${widget.tableIndex}");
                      }
                    },
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
                ),

              ],
            ),
          );

        });
  }
}
