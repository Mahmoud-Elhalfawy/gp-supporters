import 'package:advance_text_field/advance_text_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gppsupporters/DatabaseUtils/ADMSheetKeys.dart';
import 'package:gppsupporters/Model/Patient.dart';
import 'package:gppsupporters/View/ProfileScreen.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../Model/Client.dart';
import '../Model/PatientArguments.dart';

class ADMScreen extends StatefulWidget {
  String code;
  ADMScreen({Key? key, required this.code}) : super(key: key);

  @override
  State<ADMScreen> createState() => _ADMScreenState();
}

class _ADMScreenState extends State<ADMScreen> {
  bool female = true;
  Patient patient = Patient();
  Client client = Client();

  void save(Map<String, dynamic> dataToBackend,
      AsyncSnapshot<QuerySnapshot> snapshot) async {
    if (snapshot.data!.docs
        .where((element) =>
            element['user'] == client.token && element['hCode'] == widget.code)
        .isEmpty) {
      print("new time ${widget.code}");
      FirebaseFirestore.instance
          .collection(ADMSheetKeys.table)
          .add(dataToBackend);
    } else {
      var checkedValue = snapshot.data?.docs.firstWhere((element) =>
          element['user'] == client.token && element['hCode'] == widget.code);
      await FirebaseFirestore.instance
          .collection(ADMSheetKeys.table)
          .doc(checkedValue?.reference.id)
          .update(dataToBackend);
    }
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

  void clone(AsyncSnapshot<QuerySnapshot> snapshot) {
    print("patient hcode : ${patient.hCode}");
    if (patient.hCode!.isEmpty) {
      showToast("please enter hospital code");
      return;
    }
    Map<String, dynamic> dataToBackend = {
      ADMSheetKeys.hcode: patient.hCode,
      ADMSheetKeys.user: client.token,
      if (patient.age != null) ADMSheetKeys.age: patient.age,
      if (patient.allergy != null) ADMSheetKeys.allergy: patient.allergy,
      if (patient.coa != null) ADMSheetKeys.coa: patient.coa,
      if (patient.drugHx != null) ADMSheetKeys.drugHx: patient.drugHx,
      if (patient.height != null) ADMSheetKeys.height: patient.height,
      if (patient.medHx != null) ADMSheetKeys.medHx: patient.medHx,
      if (patient.name != null) ADMSheetKeys.name: patient.name,
      if (patient.surgicalHx != null)
        ADMSheetKeys.surgicalHx: patient.surgicalHx,
      if (patient.weight != null) ADMSheetKeys.weight: patient.weight,
      if (patient.workingUpDiagnosis != null)
        ADMSheetKeys.workingUpDiagnosis: patient.workingUpDiagnosis,
      if (patient.physicalAssesment != null)
        ADMSheetKeys.physicalAssessment: patient.physicalAssesment,
    };

    save(dataToBackend, snapshot);
  }

  @override
  Widget build(BuildContext context) {
    print(ProfileScreen.code);

    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection(ADMSheetKeys.table)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          var checkedValue = snapshot.data?.docs.where((element) =>
              element['user'] == client.token &&
              element['hCode'] == ProfileScreen.code);
          Map<String, dynamic> dataBackEnd = checkedValue!.isEmpty
              ? Map()
              : checkedValue.first.data() as Map<String, dynamic>;
          female = dataBackEnd['gender'] == "female";
          patient.cloneData(dataBackEnd);
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.9,
            child: SingleChildScrollView(
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
                      clone(snapshot);
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                        border: Border.all(
                            color: Colors.blue.shade900, width: 1.2)),
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
                                  animationDuration:
                                      Duration(milliseconds: 200),
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
                                  animationDuration:
                                      Duration(milliseconds: 200),
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
                                  initialLabelIndex: female ? 1 : 0,
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
                                  animationDuration:
                                      Duration(milliseconds: 200),
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
                                  animationDuration:
                                      Duration(milliseconds: 200),
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
                                  animationDuration:
                                      Duration(milliseconds: 200),
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
                                  animationDuration:
                                      Duration(milliseconds: 200),
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
                                  animationDuration:
                                  Duration(milliseconds: 200),
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
                                  textHint: 'enter surgical Hx',
                                  onEditTap: () {},
                                  onSaveTap: (text) {
                                    print('value is: $text');
                                    patient.surgicalHx = text;
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
                                  "Med Hx: ",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.blue.shade900,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                TextField(
                                  textAlign: TextAlign.center,

                                  onChanged: (query) {
                                    patient.medHx = query;
                                  },

                                  keyboardType: TextInputType.multiline,
                                  minLines: 1,//Normal textInputField will be displayed
                                  maxLines: 10,// when user presses enter it will adapt to it
                                  // controller: _controller,
                                  decoration: InputDecoration(

                                    label: dataBackEnd['medHx']!=null? Center(
                                      child: Text(dataBackEnd['medHx']),
                                    ):null,

                                    alignLabelWithHint: true,

                                    // suffixIconColor: Colors.white,
                                      hintText: 'enter Med Hx',
                                      hintStyle: TextStyle(color: Colors.grey),
                                      fillColor: Colors.white,
                                      contentPadding: const EdgeInsets.symmetric(
                                          vertical: 50.0, horizontal: 5),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(color: Colors.blue.shade900, width: 2),
                                      ),

                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(color: Colors.blue.shade900, width: 2),
                                      )),
                                ),
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

                                TextField(
                                  textAlign: TextAlign.center,

                                  onChanged: (query) {
                                    patient.drugHx = query;
                                  },

                                  keyboardType: TextInputType.multiline,
                                  minLines: 1,//Normal textInputField will be displayed
                                  maxLines: 10,// when user presses enter it will adapt to it
                                  // controller: _controller,
                                  decoration: InputDecoration(

                                      label: dataBackEnd['drugHx']!=null? Center(
                                        child: Text(dataBackEnd['drugHx']),
                                      ):null,

                                      alignLabelWithHint: true,

                                      // suffixIconColor: Colors.white,
                                      hintText: 'enter drug Hx',
                                      hintStyle: TextStyle(color: Colors.grey),
                                      fillColor: Colors.white,
                                      contentPadding: const EdgeInsets.symmetric(
                                          vertical: 50.0, horizontal: 5),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(color: Colors.blue.shade900, width: 2),
                                      ),

                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(color: Colors.blue.shade900, width: 2),
                                      )),
                                ),


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
                                  animationDuration:
                                      Duration(milliseconds: 200),
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
                                  animationDuration:
                                      Duration(milliseconds: 200),
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

                                TextField(
                                  textAlign: TextAlign.center,

                                  onChanged: (query) {
                                    patient.physicalAssesment = query;
                                  },

                                  keyboardType: TextInputType.multiline,
                                  minLines: 1,//Normal textInputField will be displayed
                                  maxLines: 10,// when user presses enter it will adapt to it
                                  // controller: _controller,
                                  decoration: InputDecoration(

                                      label: dataBackEnd['physicalAssessment']!=null? Center(
                                        child: Text(dataBackEnd['physicalAssessment']),
                                      ):null,

                                      alignLabelWithHint: true,

                                      // suffixIconColor: Colors.white,
                                      hintText: 'enter physical Assessment',
                                      hintStyle: TextStyle(color: Colors.grey),
                                      fillColor: Colors.white,
                                      contentPadding: const EdgeInsets.symmetric(
                                          vertical: 50.0, horizontal: 5),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(color: Colors.blue.shade900, width: 2),
                                      ),

                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(color: Colors.blue.shade900, width: 2),
                                      )),
                                ),



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
            ),
          );
        });
  }
}
