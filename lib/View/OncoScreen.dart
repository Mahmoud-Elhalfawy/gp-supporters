
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:editable/editable.dart';
import 'package:flutter/material.dart';
import 'package:gppsupporters/View/OncoTable.dart';

import '../DatabaseUtils/LabSheetKeys.dart';
import '../DatabaseUtils/OncoSheetKeys.dart';
import '../DatabaseUtils/VitalsSheetKey.dart';
import '../Model/Client.dart';

class OncoScreen extends StatefulWidget {
  static String id = "onco";
  String code;

  OncoScreen({Key? key, required this.code}) : super(key: key);

  @override
  State<OncoScreen> createState() => _OncoScreenState();
}

class _OncoScreenState extends State<OncoScreen> {
  int tableIndex = 0;
  int maxIndex=0;
  bool firstFetch=true;
  final _editableKey = GlobalKey<EditableState>();
  final _editableKey2 = GlobalKey<EditableState>();
  final _editableKey3 = GlobalKey<EditableState>();
  List<Widget> cycles = List.empty(growable: true);
  List returnedRows = [];
  List returnedRowsABG = [];
  List returnedRowsCulture = [];

  Client client = Client();

  List rows = [];
  List cols = [
    {
      "title": 'Date',
      'widthFactor': 0.4,
      'key': 'date',
      'editable': true,
    },
    {"title": 'BP (60/90 -> 120/80 )', 'widthFactor': 0.4, 'key': 'bp'},
    {"title": 'HR (60 To 100)', 'widthFactor': 0.4, 'key': 'hr'},
    {
      "title": 'Temperature (36.5°C to 37.3°C)',
      'widthFactor': 0.4,
      'key': 'temp'
    },
    {"title": 'RR (12-18 b/min)', 'widthFactor': 0.4, 'key': 'rr'},
    {
      "title": 'BGL (Random <125 mg/dl-Fasting 70-100 mg/dl)',
      'widthFactor': 0.4,
      'key': 'bgl'
    },
    {"title": 'Urine Input', 'widthFactor': 0.4, 'key': 'urinei'},
    {"title": 'Urine Output', 'widthFactor': 0.4, 'key': 'urineo'},
    {"title": 'Urine Net', 'widthFactor': 0.4, 'key': 'urinen'},
    {"title": 'Drain Output', 'widthFactor': 0.4, 'key': 'draino'},
  ];

  List colsABG = [
    {
      "title": 'PH (7.35-7.45)',
      'widthFactor': 0.4,
      'key': 'ph',
      'editable': true,
    },
    {"title": 'PO2 (75-100 mmHg)', 'widthFactor': 0.4, 'key': 'po2'},
    {"title": 'PCO2 (35-45 mmHG)', 'widthFactor': 0.4, 'key': 'pco2'},
    {"title": 'HCO3 (18-22 mmol/L)', 'widthFactor': 0.4, 'key': 'hco3'},
    {
      "title": 'Oxygen saturation (96%-100%)',
      'widthFactor': 0.4,
      'key': 'oxygenS'
    },
  ];

  List colsCulture = [
    {
      "title": 'Date',
      'widthFactor': 0.4,
      'key': 'date',
      'editable': true,
    },
    {"title": 'Culture type', 'widthFactor': 0.4, 'key': 'culturet'},
    {"title": 'Organism', 'widthFactor': 0.4, 'key': 'organsim'},
    {"title": 'Antibiogram', 'widthFactor': 0.4, 'key': 'antibiogram'},
  ];

  ///Print only edited rows.
  void _printEditedRows() {
    List editedRows = _editableKey.currentState!.editedRows;
    // print(editedRows);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      child: SingleChildScrollView(
        child: Column(
          children: [
            FloatingActionButton.extended(
              label: const Text(
                'Add Cycle',
                style: TextStyle(color: Colors.white),
              ), // <-- Text
              backgroundColor: Colors.blue.shade900,
              icon: const Icon(
                // <-- Icon
                Icons.add,
                color: Colors.white,
              ),
              onPressed: () {

                setState(() {
                  addCycle(title: "Cycle ${tableIndex + 1}", index: tableIndex);
                  tableIndex++;
                });

                // _addNewRow();
              },
            ),
            const SizedBox(
              height: 20,
            ),
            StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection(OncoSheetKeys.table)
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  var rowsBackend = snapshot.data?.docs.where((element) =>
                      element['user'] == client.token &&
                      element['hCode'] == widget.code) ;



                if((rowsBackend!.isNotEmpty)) {

                  print("we are not empty");


                  rowsBackend.toList().sort((a, b){
                    Map<String,dynamic> rowData1=a.data() as Map<String, dynamic>;
                    Map<String,dynamic> rowData2=b.data() as Map<String, dynamic>;

                    if(rowData1['tableIndex']<rowData2['tableIndex']) {
                      return 1;
                    } else {
                      return 0;
                    }
                  });

                  Map<String,dynamic> biggestRow=rowsBackend.toList().first.data() as Map<String, dynamic>;
                  maxIndex=biggestRow['tableIndex'];

                  print("biggest Index $maxIndex");
                    if(firstFetch) {
                      fetchCycles();
                      firstFetch = false;
                    }
                }
                  return Column(
                    children: cycles,
                  );
                }),
          ],
        ),
      ),
    );
  }

  void addCycle({required String title, required int index}) {

    firstFetch=false;

      cycles.add(
        Text(
          title,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
      );

      cycles.add(const SizedBox(
        height: 15,
      ));

      cycles.add(OncoTable(code: widget.code, tableIndex: index));

      cycles.add(const SizedBox(
        height: 20,
      ));
      cycles.add(const Divider(
        thickness: 3,
      ));
      cycles.add(const SizedBox(
        height: 20,
      ));

  }

  void fetchCycles(){
    for(int i=0;i<=maxIndex;i++){
      addCycle(title: "Cycle ${i+1}", index: i);
    }

    tableIndex=maxIndex+1;
  }
}
