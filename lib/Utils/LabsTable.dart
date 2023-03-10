import 'package:editable/editable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'LabKeys.dart';

class LabsTableView extends StatefulWidget {
  final String title;

  const LabsTableView({Key? key, required this.title}) : super(key: key);

  @override
  State<LabsTableView> createState() => _LabsTableViewState();
}

class _LabsTableViewState extends State<LabsTableView> {
  /// Create a Key for EditableState
  final _editableKey = GlobalKey<EditableState>();

  List rows = [
    // {
    //   "lab": LabKeys.hb,
    //
    //
    // },
    // {
    //   "lab": LabKeys.plt,
    //
    // },
    // {
    //   "lab": LabKeys.wbc,
    //
    // },
    // {
    //   "lab": LabKeys.neutrophils,
    //
    // },
  ];
  List cols = [
    {"title": 'Lab', 'widthFactor': 0.2, 'key': 'lab', 'editable': true},
    {"title": '1/10', 'widthFactor': 0.2, 'key': '1'},
    {"title": '2', 'key': '2'},
    {"title": '3', 'key': '3'},
    {"title": '4', 'key': '4'},
    {"title": '5', 'key': '5'},
    {"title": '6', 'key': '6'},
    {"title": '7', 'key': '7'},
    {"title": '8', 'key': '8'},
    {"title": '9', 'key': '9'},
    {"title": '10', 'key': '10'},
    {"title": '11', 'key': '11'},
    {"title": '12', 'key': '12'},
    {"title": '13', 'key': '13'},
    {"title": '14', 'key': '14'},
    {"title": '15', 'key': '15'},
    {"title": '16', 'key': '16'},
    {"title": '17', 'key': '17'},
    {"title": '18', 'key': '18'},
    {"title": '19', 'key': '19'},
    {"title": '20', 'key': '20'},

  ];

  /// Function to add a new row
  /// Using the global key assigined to Editable widget
  /// Access the current state of Editable
  void _addNewRow() {

    setState(() {

      _editableKey.currentState?.createRow();
      // cols.add({"title": 'added', 'widthFactor': 0.2, 'key': 'added'});
      print("row added , ${rows.length}");

    });
  }

  void _addNewColumn(){

    setState(() {

      _editableKey.currentState?.columns?.add({"title": cols.length.toString(), 'widthFactor': 0.2, 'key': cols.length.toString()});
      print("col added , ${cols.length}");

    });

  }

  void save(){

  }

  ///Print only edited rows.
  void _printEditedRows() {
    List editedRows = _editableKey.currentState!.editedRows;
    print(editedRows);
  }

  @override
  Widget build(BuildContext context) {
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
              border: Border.all(color: Colors.blue.shade900, width: 1)
            ),
            // margin: EdgeInsets.only(bottom: 16),
            height: MediaQuery.of(context).size.height*0.6,
            child: Editable(
                key: _editableKey,
                columns: cols,
                rows: rows,
                zebraStripe: true,
                stripeColor1: Colors.blue.shade50,
                stripeColor2: Colors.grey.shade200,
                onRowSaved: (value) {
                  print(value);
                },
                onSubmitted: (value) {
                  print(value);
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

  }
}