import 'package:advance_text_field/advance_text_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gppsupporters/DatabaseUtils/ADMSheetKeys.dart';
import 'package:gppsupporters/Model/Patient.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../Model/Client.dart';

class ADMScreen extends StatefulWidget {
  const ADMScreen({Key? key}) : super(key: key);

  @override
  State<ADMScreen> createState() => _ADMScreenState();
}

class _ADMScreenState extends State<ADMScreen> {
  bool female = true;
  Patient patient = Patient();
  Client client= Client();



  void save(Map<String,dynamic> dataToBackend) {
    FirebaseFirestore.instance
        .collection(ADMSheetKeys.table)
        .add(dataToBackend);
  }

void clone(){
  Map<String,dynamic> dataToBackend={

    ADMSheetKeys.user:client.token,
    ADMSheetKeys.age:patient.age,
    ADMSheetKeys.allergy:patient.allergy,
    ADMSheetKeys.coa:patient.coa,
    ADMSheetKeys.drugHx:patient.drugHx,
    ADMSheetKeys.hcode:patient.hCode,
    ADMSheetKeys.height:patient.height,
    ADMSheetKeys.medHx:patient.medHx,
    ADMSheetKeys.name:patient.name,
    ADMSheetKeys.surgicalHx:patient.surgicalHx,
    ADMSheetKeys.weight:patient.weight,
    ADMSheetKeys.workingUpDiagnosis:patient.workingUpDiagnosis,
    ADMSheetKeys.physicalAssessment:patient.physicalAssesment,
  };


  save(dataToBackend);

}


  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection(ADMSheetKeys.table).snapshots(),
    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){

      if (!snapshot.hasData) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }


      Map<String,dynamic> dataBackEnd= snapshot.data?.docs.lastWhere((element) => element['user']==client.token).data() as Map<String,dynamic>;
      female=dataBackEnd['gender']=="female";
      patient.cloneData(dataBackEnd);
      return  SingleChildScrollView(
        child: Column(
          children: [
            FloatingActionButton.extended(
              label: const Text(
                'Save',
                style: TextStyle(color: Colors.white),
              ), // <-- Text
              backgroundColor: Colors.blue.shade900,
              icon: const Icon(
                // <-- Icon
                Icons.save,
                color: Colors.white,
              ),
              onPressed: () {
                clone();
              },
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                  border: Border.all(color: Colors.blue.shade900, width: 1.2)),
              height: MediaQuery.of(context).size.height * 0.6,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Column(
                        children: [
                          Text(
                            "Patient Name: ",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.blue.shade900,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          AdvanceTextField(
                            text: dataBackEnd['name'],
                            animationDuration: Duration(milliseconds: 200),
                            backgroundColor: Colors.blue.shade900,
                            type: AdvanceTextFieldType.EDIT,
                            editLabel: const Icon(
                              Icons.edit,
                              color: Colors.white,
                            ),
                            saveLabel: const Icon(
                              Icons.check,
                              color: Colors.white,
                            ),
                            textHint: 'enter patient name',
                            onEditTap: () {},
                            onSaveTap: (text) {
                              patient.name = text;
                              print('value is: $text');
                            },
                          )
                        ],
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Column(
                        children: [
                          Text(
                            "Hospital Code: ",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.blue.shade900,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          AdvanceTextField(
                            text: dataBackEnd['hCode'],

                            animationDuration: Duration(milliseconds: 200),
                            backgroundColor: Colors.blue.shade900,
                            type: AdvanceTextFieldType.EDIT,
                            editLabel: Icon(
                              Icons.edit,
                              color: Colors.white,
                            ),
                            saveLabel: Icon(
                              Icons.check,
                              color: Colors.white,
                            ),
                            textHint: 'enter hospital code',
                            onEditTap: () {},
                            onSaveTap: (text) {
                              patient.hCode = text;
                              print('value is: $text');
                            },
                          )
                        ],
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Column(
                        children: [
                          Text(
                            "Gender: ",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.blue.shade900,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          ToggleSwitch(
                            minWidth: 90.0,
                            initialLabelIndex: female?1:0,
                            cornerRadius: 20.0,
                            activeFgColor: Colors.white,
                            inactiveBgColor: Colors.grey.shade400,
                            inactiveFgColor: Colors.white,
                            totalSwitches: 2,
                            labels: ['Male', 'Female'],
                            icons: [
                              FontAwesomeIcons.mars,
                              FontAwesomeIcons.venus
                            ],
                            activeBgColors: [
                              [Colors.blue],
                              [Colors.pink]
                            ],
                            onToggle: (index) {
                              female = !female;
                              patient.gender = female ? "female" : "male";

                              print('switched to: $female');
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Column(
                        children: [
                          Text(
                            "Age: ",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.blue.shade900,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          AdvanceTextField(
                            text: dataBackEnd['age'],

                            animationDuration: Duration(milliseconds: 200),
                            backgroundColor: Colors.blue.shade900,
                            type: AdvanceTextFieldType.EDIT,
                            keyboardType: TextInputType.number,
                            editLabel: Icon(
                              Icons.edit,
                              color: Colors.white,
                            ),
                            saveLabel: Icon(
                              Icons.check,
                              color: Colors.white,
                            ),
                            textHint: 'enter age',
                            onEditTap: () {},
                            onSaveTap: (text) {
                              patient.age = text;
                            },
                          )
                        ],
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Column(
                        children: [
                          Text(
                            "Height: ",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.blue.shade900,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          AdvanceTextField(
                            text: dataBackEnd['height'],

                            animationDuration: Duration(milliseconds: 200),
                            backgroundColor: Colors.blue.shade900,
                            type: AdvanceTextFieldType.EDIT,
                            keyboardType: TextInputType.number,
                            editLabel: const Icon(
                              Icons.edit,
                              color: Colors.white,
                            ),
                            saveLabel: const Icon(
                              Icons.check,
                              color: Colors.white,
                            ),
                            textHint: 'enter height',
                            onEditTap: () {},
                            onSaveTap: (text) {
                              patient.height = text;

                              print('value is: $text');
                            },
                          )
                        ],
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Column(
                        children: [
                          Text(
                            "Weight: ",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.blue.shade900,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          AdvanceTextField(
                            text: dataBackEnd['weight'],

                            animationDuration: Duration(milliseconds: 200),
                            backgroundColor: Colors.blue.shade900,
                            type: AdvanceTextFieldType.EDIT,
                            keyboardType: TextInputType.number,
                            editLabel: Icon(
                              Icons.edit,
                              color: Colors.white,
                            ),
                            saveLabel: Icon(
                              Icons.check,
                              color: Colors.white,
                            ),
                            textHint: 'enter weight',
                            onEditTap: () {},
                            onSaveTap: (text) {
                              print('value is: $text');
                              patient.weight = text;
                            },
                          )
                        ],
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Column(
                        children: [
                          Text(
                            "COA: ",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.blue.shade900,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          AdvanceTextField(
                            text: dataBackEnd['coa'],

                            animationDuration: Duration(milliseconds: 200),
                            backgroundColor: Colors.blue.shade900,
                            type: AdvanceTextFieldType.EDIT,
                            editLabel: Icon(
                              Icons.edit,
                              color: Colors.white,
                            ),
                            saveLabel: Icon(
                              Icons.check,
                              color: Colors.white,
                            ),
                            textHint: 'enter COA',
                            onEditTap: () {},
                            onSaveTap: (text) {
                              print('value is: $text');
                              patient.coa = text;
                            },
                          )
                        ],
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Column(
                        children: [
                          Text(
                            "Surgical Hx: ",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.blue.shade900,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          AdvanceTextField(
                            text: dataBackEnd['surgicalHx'],

                            animationDuration: Duration(milliseconds: 200),
                            backgroundColor: Colors.blue.shade900,
                            type: AdvanceTextFieldType.EDIT,
                            editLabel: Icon(
                              Icons.edit,
                              color: Colors.white,
                            ),
                            saveLabel: Icon(
                              Icons.check,
                              color: Colors.white,
                            ),
                            textHint: 'enter Surgical Hx',
                            onEditTap: () {},
                            onSaveTap: (text) {
                              print('value is: $text');
                              patient.surgicalHx = text;
                            },
                          )
                        ],
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Column(
                        children: [
                          Text(
                            "Med Hx: ",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.blue.shade900,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          AdvanceTextField(
                            text: dataBackEnd['medHx'],

                            animationDuration: Duration(milliseconds: 200),
                            backgroundColor: Colors.blue.shade900,
                            type: AdvanceTextFieldType.EDIT,
                            editLabel: Icon(
                              Icons.edit,
                              color: Colors.white,
                            ),
                            saveLabel: Icon(
                              Icons.check,
                              color: Colors.white,
                            ),
                            textHint: 'enter Med Hx',
                            onEditTap: () {},
                            onSaveTap: (text) {
                              print('value is: $text');
                              patient.medHx = text;
                            },
                          )
                        ],
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Column(
                        children: [
                          Text(
                            "Drug Hx: ",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.blue.shade900,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          AdvanceTextField(
                            text: dataBackEnd['drugHx'],

                            animationDuration: Duration(milliseconds: 200),
                            backgroundColor: Colors.blue.shade900,
                            type: AdvanceTextFieldType.EDIT,
                            editLabel: Icon(
                              Icons.edit,
                              color: Colors.white,
                            ),
                            saveLabel: Icon(
                              Icons.check,
                              color: Colors.white,
                            ),
                            textHint: 'enter Drug Hx',
                            onEditTap: () {},
                            onSaveTap: (text) {
                              print('value is: $text');
                              patient.drugHx = text;
                            },
                          )
                        ],
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Column(
                        children: [
                          Text(
                            "Allergy: ",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.blue.shade900,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          AdvanceTextField(
                            text: dataBackEnd['allergy'],

                            animationDuration: Duration(milliseconds: 200),
                            backgroundColor: Colors.blue.shade900,
                            type: AdvanceTextFieldType.EDIT,
                            keyboardType: TextInputType.multiline,
                            editLabel: Icon(
                              Icons.edit,
                              color: Colors.white,
                            ),
                            saveLabel: Icon(
                              Icons.check,
                              color: Colors.white,
                            ),
                            textHint: 'enter allergy',
                            onEditTap: () {},
                            onSaveTap: (text) {
                              print('value is: $text');
                              patient.allergy = text;
                            },
                          )
                        ],
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Column(
                        children: [
                          Text(
                            "Working up Diagnosis: ",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.blue.shade900,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          AdvanceTextField(
                            text: dataBackEnd['workingUpDiagnosis'],

                            animationDuration: Duration(milliseconds: 200),
                            backgroundColor: Colors.blue.shade900,
                            type: AdvanceTextFieldType.EDIT,
                            keyboardType: TextInputType.multiline,
                            editLabel: const Icon(
                              Icons.edit,
                              color: Colors.white,
                            ),
                            saveLabel: const Icon(
                              Icons.check,
                              color: Colors.white,
                            ),
                            textHint: 'enter Working up diagnosis',
                            onEditTap: () {},
                            onSaveTap: (text) {
                              print('value is: $text');
                              patient.workingUpDiagnosis = text;
                            },
                          )
                        ],
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Column(
                        children: [
                          Text(
                            "Physical Assesment: ",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.blue.shade900,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          AdvanceTextField(
                            text: dataBackEnd['physicalAssessment'],

                            animationDuration: Duration(milliseconds: 200),
                            backgroundColor: Colors.blue.shade900,
                            type: AdvanceTextFieldType.EDIT,
                            keyboardType: TextInputType.multiline,
                            editLabel: Icon(
                              Icons.edit,
                              color: Colors.white,
                            ),
                            saveLabel: Icon(
                              Icons.check,
                              color: Colors.white,
                            ),
                            textHint: 'enter physical assesment',
                            onEditTap: () {},
                            onSaveTap: (text) {
                              print('value is: $text');
                              patient.physicalAssesment = text;
                            },
                          )
                        ],
                      ),
                      SizedBox(
                        height: 25,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );

    }

    );


  }
}
