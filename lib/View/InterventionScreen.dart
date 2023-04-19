import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:editable/editable.dart';
import 'package:flutter/material.dart';
import 'package:gppsupporters/View/INTRVCard.dart';

import '../DatabaseUtils/InterventionSheetKeys.dart';
import '../DatabaseUtils/LabSheetKeys.dart';
import '../Model/Client.dart';
import '../Model/Patient.dart';
import 'NoteCard.dart';
import 'ProfileScreen.dart';

class InterventionScreen extends StatefulWidget {
  String code;
  String name;

  InterventionScreen({Key? key,required this.code,required this.name}) : super(key: key);

  @override
  State<InterventionScreen> createState() => _InterventionScreenState();
}

class _InterventionScreenState extends State<InterventionScreen> {
  bool female = true;
  Patient patient = Patient();
  Client client = Client();
  int intrvIndex=0;
  int maxIndex=0;
  bool firstFetch=true;
  List<Widget> cycles = List.empty(growable: true);


  @override
  Widget build(BuildContext context) {
    print(ProfileScreen.code);
    return Container(
        height: MediaQuery.of(context).size.height*0.9,
        child: SingleChildScrollView(
          child: Column(
            children: [
              FloatingActionButton.extended(
                label: const Text(
                  'Add INTRV',
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
                    addCycle(title: "INTRV ${intrvIndex+1}", index: intrvIndex);
                    intrvIndex++;
                  });

                },
              ),

              const SizedBox(height: 15,),
              StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection(InterventionSheetKeys.table)
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot){
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

                        if(rowData1['intrvIndex']<rowData2['intrvIndex']) {
                          return 1;
                        } else {
                          return 0;
                        }
                      });

                      Map<String,dynamic> biggestRow=rowsBackend.toList().first.data() as Map<String, dynamic>;
                      maxIndex=biggestRow['intrvIndex'];

                      print("biggest Index $maxIndex");
                      if(firstFetch) {
                        fetchCycles();
                        firstFetch = false;
                      }
                    }

                    return Column(
                      children: cycles,
                    );
                  }
              ),

            ],
          ),
        ));
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

    cycles.add(INTRVCard(code: widget.code, intrvIndex: index, name: widget.name));

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
      addCycle(title: "INTRV ${i+1}", index: i);
    }

    intrvIndex=maxIndex+1;
    print("current index $intrvIndex");
  }
}


