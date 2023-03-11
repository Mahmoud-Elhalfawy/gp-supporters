
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:editable/editable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gppsupporters/DatabaseUtils/LabSheetKeys.dart';

import '../DatabaseUtils/MedSheetKey.dart';
import '../Model/Client.dart';

class MedScreen extends StatefulWidget {

  String code;
   MedScreen({Key? key, required this.code}) : super(key: key);

  @override
  State<MedScreen> createState() => _MedScreenState();
}

class _MedScreenState extends State<MedScreen> {
  final _editableKey = GlobalKey<EditableState>();
  List returnedRows=[];
  Client client= Client();

  List rows = [

  ];
  List cols = [
    {"title": 'Drug', 'widthFactor': 0.4, 'key': 'drug', 'editable': true,},
    {"title": 'Frequency & Dose', 'widthFactor': 0.4, 'key': '1'},
    {"title": '1', 'key': '1'},
    {"title": '2', 'key': '2'},
    {"title": '3', 'key': '3'},
    {"title": '4', 'key': '4'},
    {"title": '5', 'key': '5'},
    {"title": '6', 'key': '6'},
    {"title": '7', 'key': '7'},
    {"title": '8', 'key': '8'},
    {"title": '9', 'key': '9'},
    {"title": '10', 'key': '10'},


  ];

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

  Future<void> save(Map<String,dynamic> dataToBackend, AsyncSnapshot<QuerySnapshot> snapshot) async{

    if(snapshot.data!.docs.where((element) => element['row']==dataToBackend['row'] && element['hCode']==widget.code).isEmpty) {

      print("yooh b2a , ${dataToBackend['row']}");
      await FirebaseFirestore.instance
          .collection(MedSheetKey.table)
          .add(dataToBackend);
    }else{
      var checkedValue=snapshot.data?.docs.firstWhere((element) =>element['user']==client.token && element['row']==dataToBackend['row'] && element['hCode']==widget.code );
      await FirebaseFirestore.instance.collection(MedSheetKey.table).doc(checkedValue?.reference.id).update(dataToBackend);

    }
  }

  Future<void> cloneData(var value, AsyncSnapshot<QuerySnapshot> snapshot) async{





    int i=1;

    Map<String,dynamic> dataToBackend=Map();


    dataToBackend.putIfAbsent(LabSheetKeys.user, () => client.token);
    dataToBackend.putIfAbsent("hCode", () => widget.code);
    // if(value['lab']!=null) {
    //   dataToBackend.putIfAbsent(MedSheetKey.labName, () => value['lab']);
    // }


    value.keys.forEach((k) => dataToBackend.putIfAbsent(k, () => value[k]));

    // dataToBackend.addAll(value);

    await save(dataToBackend,snapshot);

    print("data to backend : : $dataToBackend");

  }

  ///Print only edited rows.
  void _printEditedRows() {
    List editedRows = _editableKey.currentState!.editedRows;
    // print(editedRows);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(

        stream: FirebaseFirestore.instance.collection(MedSheetKey.table)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          var rowsBackend = snapshot.data?.docs.where((
              element) => element['user'] == client.token && element['hCode']==widget.code);
          returnedRows = [];
          if (rowsBackend != null) {
            for (var row in rowsBackend) {
              Map<String, dynamic> rowData = row.data() as Map<String, dynamic>;

              for (var singleCol in cols) {
                if (!rowData.containsKey(singleCol['key'])) {
                  print("missing $singleCol");

                  rowData.putIfAbsent(singleCol['key'], () => '-');
                }
              }

              returnedRows.add(rowData);
            }

            returnedRows.sort((a, b) {
              if (a['row'] > b['row']) {
                return 1;
              } else {
                return 0;
              }
            });
          }
          // var c= snapshot.data?.docs.where((element) => element['token']==client.token);

          return SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                  children: [

                    FloatingActionButton.extended(
                      label: const Text(
                        'Add row', style: TextStyle(color: Colors.white),),
                      // <-- Text
                      backgroundColor: Colors.blue.shade900,
                      icon: const Icon( // <-- Icon
                        Icons.add,
                        color: Colors.white,

                      ),
                      onPressed: () {
                        _addNewRow();
                      },
                    ),

                    FloatingActionButton.extended(
                      label: const Text(
                          'Add column', style: TextStyle(color: Colors.white)),
                      // <-- Text
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
                      border: Border.all(
                          color: Colors.blue.shade900, width: 1.2)
                  ),
                  // margin: EdgeInsets.only(bottom: 16),
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.6,
                  child: Editable(
                    key: _editableKey,
                    columns: cols,
                    rows: returnedRows,
                    zebraStripe: true,
                    stripeColor1: Colors.blue.shade50,
                    stripeColor2: Colors.grey.shade200,
                    onRowSaved: (value) async {
                      print(value);
                      await cloneData(value, snapshot);
                      // FirebaseFirestore.instance
                      //     .collection(MedSheetKey.table)
                      //     .add({MedSheetKey.user:});
                      // print(1+ value);
                    },
                    onSubmitted: (value) async {
                      await cloneData(value, snapshot);

                      // print(value);
                    },
                    borderColor: Colors.blueGrey,
                    tdStyle: TextStyle(fontWeight: FontWeight.bold),
                    trHeight: 80,
                    thStyle: TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold),
                    thAlignment: TextAlign.center,
                    thVertAlignment: CrossAxisAlignment.end,
                    thPaddingBottom: 3,
                    showSaveIcon: true,
                    saveIconColor: Colors.black,
                    // showCreateButton: true,
                    tdAlignment: TextAlign.center,
                    tdEditableMaxLines: 100,
                    // don't limit and allow data to wrap
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
        });
  }

}