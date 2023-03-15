import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../DatabaseUtils/ADMSheetKeys.dart';
import '../DatabaseUtils/keys.dart';
import '../Model/Client.dart';
import '../Model/Doctor.dart';
import '../Model/Patient.dart';
import '../Model/PatientArguments.dart';
import 'LoginScreen.dart';
import 'NewProfileScreen.dart';
import 'ProfileScreen.dart';

class ShareScreen extends StatefulWidget {
  static String id="share screen";
  const ShareScreen({Key? key}) : super(key: key);

  @override
  State<ShareScreen> createState() => _ShareScreenState();
}

class _ShareScreenState extends State<ShareScreen> {
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

  List<Doctor> doctorList=List.empty(growable: true);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection(Keys.CLIENT_DB).snapshots(),

        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {

          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          var checkedValue= snapshot.data?.docs;

          if(checkedValue!=null) {
            for (var row in checkedValue) {
              Map<String, dynamic> rowData = row.data() as Map<String, dynamic>;
              Doctor doctor = Doctor();
              doctor.cloneData(rowData);
              doctorList.add(doctor);

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

                  onTap: ()async{
                    final auth = FirebaseAuth.instance;

                    auth.signOut();
SharedPreferences preferences = await SharedPreferences.getInstance();
await preferences.clear();
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




                    // The child of the Slidable is what the user sees when the
                    // component is not dragged.
                    child:   SizedBox(
                      height: 80,
                      child: InkWell(
                        onTap: ()async{
                          final ConfirmAction action = (await _asyncConfirmDialog(context)) as ConfirmAction;
                          print("Confirm Action $action" );
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
                              title: Text('Patient Name : ${doctorList[index].name}'),
                              subtitle: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('# ${doctorList[index].token}'),
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
}



// void doNothing(BuildContext context) {}
enum ConfirmAction { Cancel, Accept}
Future<Future<ConfirmAction?>> _asyncConfirmDialog(BuildContext context) async {
  return showDialog<ConfirmAction>(
    context: context,
    barrierDismissible: false, // user must tap button for close dialog!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Confirm sharing the patient'),
        content: const Text(
            'This will share the patient\'s data to the specified doctor'),
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

void doNothing(BuildContext context){
}