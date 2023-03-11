import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gppsupporters/Model/Patient.dart';
import 'package:gppsupporters/Model/PatientArguments.dart';
import 'package:gppsupporters/View/NewProfileScreen.dart';
import 'package:gppsupporters/View/ProfileScreen.dart';
import 'package:gppsupporters/View/ShareScreen.dart';

import '../DatabaseUtils/ADMSheetKeys.dart';
import '../Model/Client.dart';
import 'LoginScreen.dart';

class PatientsScreen extends StatefulWidget {

  static String id="patientsscren";
  const PatientsScreen({ Key? key }) : super(key: key);

  @override
  _PatientsScreenState createState() => _PatientsScreenState();
}

class _PatientsScreenState extends State<PatientsScreen> {

  late final ScrollController controller=ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller.addListener(() {
      if(controller.position.userScrollDirection==ScrollDirection.forward){
        if(!isVisible){
          setState(() {
            isVisible=true;
          });
        }
      }else if(controller.position.userScrollDirection==ScrollDirection.reverse){

        if(isVisible){
          setState(() {
            isVisible=false;
          });
        }
      }

    });


  }
  bool isVisible=true;
  Client client= Client();
  bool first=true;

  List<Patient> patientList=List.empty(growable: true);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection(ADMSheetKeys.table).snapshots(),

        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {

          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          print("object");

          var checkedValue= snapshot.data?.docs.where((element) => element['user']==client.token);

          if(checkedValue!=null) {
            patientList=[];
            for (var row in checkedValue) {
              Map<String, dynamic> rowData = row.data() as Map<String, dynamic>;
              Patient patient = Patient();
              patient.cloneData(rowData);
              patientList.add(patient);

            }
          }
          Map<String,dynamic> dataBackEnd=checkedValue!.isEmpty?Map():checkedValue.first.data() as Map<String,dynamic> ;
                return Scaffold(
                  backgroundColor: Colors.grey.shade200,

                  appBar: AppBar(

                    leading: Icon(Icons.menu, color: Colors.transparent,),
                    title: Text('Patient Profiles', style: TextStyle(color: Colors.blue.shade900),textAlign: TextAlign.left,),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(30),
                      ),
                    ),

                    actions:  [

                      InkWell(
                        child: Container(
                            margin: EdgeInsets.only(right: 16),
                            child: Icon(Icons.output_sharp, color: Colors.blue.shade900,)),

                        onTap: (){
                          final auth = FirebaseAuth.instance;

                          auth.signOut();
                          Navigator.pushNamedAndRemoveUntil(context, LoginScreen.id, (route) => false);
                        },
                      ),
                    ],
                    backgroundColor: Colors.white,
                    toolbarHeight: 90,
                    elevation: 7,
                  ),
                  floatingActionButton: Visibility(
                    visible: isVisible,
                    child: FloatingActionButton(
                      onPressed: () {
                        Navigator.pushNamed(context, NewProfileScreen.id);
                      },
                      backgroundColor: Colors.blue.shade900,
                      child: const Icon(Icons.add,color: Colors.white,),
                    ),
                  ),
                  body: Container(
                    margin: EdgeInsets.only(top: 20,left: 8,right: 8,bottom: 8),
                    child: ListView.builder(
                      itemCount: checkedValue.length,
                      controller: controller,
                      itemBuilder: (context, index) {
                        return Slidable(
                          // Specify a key if the Slidable is dismissible.
                          // key: const ValueKey(0),
                          startActionPane: const ActionPane(
                            motion: ScrollMotion(),
                            children: [
                              SlidableAction(
                                flex: 1,
                                onPressed: navigate,
                                backgroundColor: Colors.green,
                                foregroundColor: Colors.white,
                                icon: Icons.share,
                                label: 'Share',
                              ),

                            ],
                          ),


                          // The end action pane is the one at the right or the bottom side.
                          endActionPane:  ActionPane(
                            motion: ScrollMotion(),
                            children: [
                              SlidableAction(
                                flex: 1,
                                onPressed:(context){
                                  deletePatient(snapshot, patientList[index].hCode!);
                                  showToast("Patient successfully deleted");
                                },
                                backgroundColor: Color(0xFFFE4A49),
                                foregroundColor: Colors.white,
                                icon: Icons.delete,
                                label: 'Delete',
                              ),

                            ],
                          ),

                          // The child of the Slidable is what the user sees when the
                          // component is not dragged.
                          child:   SizedBox(
                            height: 80,
                            child: InkWell(
                              onTap: (){
                                Navigator.pushNamed(context, ProfileScreen.id, arguments: PatientArguments(patientList[index].name!, patientList[index].hCode!));
                              },
                              child: Card(
                                  shape: RoundedRectangleBorder(

                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                    side: BorderSide(
                                      color: Colors.blue.shade900,
                                    ),
                                  ),
                                  child: ListTile(
                                    leading: Container(padding:EdgeInsets.all(8),child: Image.asset('assets/img/patient.png',height:50 ,)),
                                    title: Text('Patient Name : ${patientList[index].name}'),
                                    subtitle: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text('# ${patientList[index].hCode}'),
                                    ),
                                  )
                              ),
                            ),
                          ),
                        );

                      },
                    ),
                  ),
                );

        }
    );

  }


  void deletePatient(AsyncSnapshot<QuerySnapshot> snapshot, String hCode)async{
    var checkedValue=snapshot.data?.docs.firstWhere((element) =>element['user']==client.token && element['hCode']==hCode);
    await FirebaseFirestore.instance.collection(ADMSheetKeys.table).doc(checkedValue?.reference.id).delete();
    setState(() {

    });
  }

  void showToast(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white
    );
  }

}

void doNothing(BuildContext context, var snapshot) {}
void navigate(BuildContext context) {

  Navigator.pushNamed(context, ShareScreen.id);
}

