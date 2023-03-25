import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gppsupporters/View/PatientsScreen.dart';
import 'package:gppsupporters/View/ProfileScreen.dart';

import '../DatabaseUtils/ADMSheetKeys.dart';
import '../Model/Client.dart';
import '../Model/Patient.dart';
import '../Model/PatientArguments.dart';
import '../Utils/Strings.dart';

class NewProfileScreen extends StatefulWidget {
  static String id="new profile";
  const NewProfileScreen({Key? key}) : super(key: key);

  @override
  State<NewProfileScreen> createState() => _NewProfileScreenState();
}

class _NewProfileScreenState extends State<NewProfileScreen> {
  TextEditingController _nameController=new TextEditingController();
  TextEditingController _patientNameController=new TextEditingController();
  TextEditingController _phoneController=new TextEditingController();
  TextEditingController _hCodeController=new TextEditingController();

  String _register_by="email";
  Patient patient = Patient();
  Client client= Client();






  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;


    return buildPage(height : height);
  }





  Widget buildPage({required double height}) {
    return Scaffold(
      // resizeToAvoidBottomInset: true,

      // appBar: AppBar(
      //   leading: Icon(
      //     Icons.arrow_back_ios,
      //     color: CustomColors.blueBg,
      //
      //   ),
      //   backgroundColor: Colors.white,
      //   toolbarHeight: 70,
      //   title: Center(
      //     child: Padding(
      //       padding: const EdgeInsets.only(right:50.0),
      //       child: Text(
      //         Strings.login,
      //         textAlign: TextAlign.right,
      //         style:TextStyle(
      //
      //           fontWeight: FontWeight.bold,
      //           fontSize: 20,
      //         ),
      //       ),
      //     ),
      //   ),
      //
      //
      // ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              color: Colors.white,
              // padding: EdgeInsets.all(16),
              height: height,

              child: SafeArea(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(
                        flex: 2,
                        child: Container(
                            margin: EdgeInsets.all(8),
                            child: Image.asset('assets/img/adddoctor.png', fit: BoxFit.contain,))),
                    Expanded(
                        flex:1,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:  [
                            const Center(
                              child: Text("Add New Patient", style: TextStyle(fontSize: 26),),
                            ),
                            Container(
                                height:20,
                                child: Image.asset('assets/img/logofinal.jpg', fit: BoxFit.contain,))
                          ],
                        )
                    ),
                    Expanded(
                      flex: 4,
                      child: Container(
                        margin: EdgeInsets.only(top: 0),

                        decoration: const BoxDecoration(
                          color: Colors.white,

                          // border: Border.all(color:Colors.black, width: 2),
                          // borderRadius: BorderRadius.all(Radius.circular(8)),


                        ),

                        child: Form(child:
                        Padding(
                          padding: const EdgeInsets.all(25.0),

                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                            children: [
                              TextFormField(
                                controller: _patientNameController,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.account_circle,
                                    color: Colors.black,
                                  ),
                                  contentPadding: EdgeInsets.all(16),
                                  filled: true,
                                  fillColor: Colors.grey.shade100,
                                  hintText: "Enter patient name",
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black)),
                                  floatingLabelBehavior:
                                  FloatingLabelBehavior.auto,
                                ),


                              ),

                              const SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                controller: _hCodeController,
                                keyboardType: TextInputType.number,
                                obscureText: false,
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(
                                    Icons.tag,
                                    color: Colors.black,
                                  ),
                                  contentPadding: EdgeInsets.all(16),
                                  filled: true,
                                  fillColor: Colors.grey.shade100,
                                  hintText: "Enter hospital code",
                                  enabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black)),
                                  focusedBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black)),
                                  floatingLabelBehavior:
                                  FloatingLabelBehavior.auto,
                                ),


                              ),

                              SizedBox(
                                height: 25,
                              ),


                              ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all<Color>(Colors.indigo.shade900),
                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(8.0),

                                        )
                                    )
                                ),
                                onPressed: ()async{
                                  await addPatient();
                                  Navigator.pushNamed(context, ProfileScreen.id, arguments: PatientArguments(patient.name!, patient.hCode!));
                                },
                                child: const Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Text(
                                    "Add Patient",
                                    textAlign: TextAlign.right,
                                    style:TextStyle(
                                      color: Colors.white,

                                      fontSize: 20,
                                    ),
                                  ),
                                ),),



                            ],

                          ),

                        ),



                        ),
                      ),
                    ),

                    Expanded(
                      flex: 1,
                      child: Container(
                        margin: EdgeInsets.only(top: 8),
                        child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,

                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(2.0),
                                  child: Text(
                                    "Looking for an existing patient?",
                                    style: TextStyle(
                                      fontSize: 16,


                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(0),
                                  child: TextButton(
                                    onPressed: () {

                                      Navigator.pushReplacementNamed(context, PatientsScreen.id);


                                    },
                                    child: const Text(
                                      "View profiles",
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 16,


                                      ),
                                    ),
                                  ),
                                )
                              ],

                            )),

                      ),
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


  addPatient()async {
    patient.name=_patientNameController.text.toString();
    patient.hCode=_hCodeController.text.toString();

    Map<String,dynamic> dataToBackend={

      ADMSheetKeys.user:client.token,

      ADMSheetKeys.hcode:patient.hCode,

      ADMSheetKeys.name:patient.name,

    };

    await FirebaseFirestore.instance
        .collection(ADMSheetKeys.table)
        .add(dataToBackend);
  }




}
