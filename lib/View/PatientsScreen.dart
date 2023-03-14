import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_switch/flutter_switch.dart';
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
  static String id = "patientsscren";
  const PatientsScreen({Key? key}) : super(key: key);

  @override
  _PatientsScreenState createState() => _PatientsScreenState();
}

class _PatientsScreenState extends State<PatientsScreen> {
  late final ScrollController controller = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller.addListener(() {
      if (controller.position.userScrollDirection == ScrollDirection.forward) {
        if (!isVisible) {
          setState(() {
            isVisible = true;
          });
        }
      } else if (controller.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (isVisible) {
          setState(() {
            isVisible = false;
          });
        }
      }
    });
  }

  bool isVisible = true;
  Client client = Client();
  bool first = true;

  List<Patient> patientList = List.empty(growable: true);
  List<Patient> patientListFiltered = List.empty(growable: true);

  bool search = false;
  bool searchCriteria=true;
  String query="";
  @override
  Widget build(BuildContext context) {
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
          print("object");

          var checkedValue = snapshot.data?.docs
              .where((element) => element['user'] == client.token);

          if (checkedValue != null) {
            patientList = [];
            for (var row in checkedValue) {
              Map<String, dynamic> rowData = row.data() as Map<String, dynamic>;
              Patient patient = Patient();
              patient.cloneData(rowData);
              patientList.add(patient);
            }
          }
          Map<String, dynamic> dataBackEnd = checkedValue!.isEmpty
              ? {}
              : checkedValue.first.data() as Map<String, dynamic>;

          if(!search) {
            patientListFiltered=patientList;
          }
          return Scaffold(
            backgroundColor: Colors.grey.shade200,
            appBar: AppBar(
             automaticallyImplyLeading: false,
              title: search
                  ? Container(
                width: 900,
                      color: Colors.white,
                      margin: EdgeInsets.all(5),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FlutterSwitch(
                              width: 85,
                              height: 40,
                              activeText: "name",
                              inactiveText: "code",
                              showOnOff: true,
                              // activeTextColor: Colors.blue.shade900,
                              // inactiveTextColor: Colors.green.shade900,
                              activeColor: Colors.blue.shade900,
                              inactiveColor: Colors.green.shade900,
                              value: searchCriteria,
                              onToggle: (val) {
                                setState(() {
                                  searchCriteria = val;
                                });
                              },
                            ),
                            SizedBox(width: 10,),
                            Flexible(
                              child: TextField(

                                onChanged: (query) {
                                  setState(() {
                                    this.query=query;
                                    if(query.isEmpty) {
                                      patientListFiltered=patientList;
                                    } else {
                                      if (searchCriteria) {
                                        patientListFiltered =
                                            patientList.where((element) =>
                                                element.name!.toLowerCase().contains(
                                                    query.toLowerCase()))
                                                .toList();
                                      } else {
                                        patientListFiltered =
                                            patientList.where((element) =>
                                                element.hCode!.contains(
                                                    query.toLowerCase()))
                                                .toList();
                                      }
                                    }
                                  });
                                },

                                // controller: _controller,
                                decoration: InputDecoration(
                                    // suffixIconColor: Colors.white,
                                    hintText: "Search",
                                    hintStyle: TextStyle(color: Colors.grey),
                                    prefixIcon: Icon(
                                      Icons.search,
                                      color: Colors.blue.shade900,
                                    ),
                                    fillColor: Colors.white,
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 5.0, horizontal: 5),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    )),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : Center(
                    child: Text(
                        'Patient Profiles',
                        style: TextStyle(color: Colors.blue.shade900),
                        textAlign: TextAlign.left,
                      ),
                  ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(30),
                ),
              ),
              actions: [
                InkWell(
                  child: Container(
                      margin: EdgeInsets.only(right: 16),
                      child: Icon(
                        search?Icons.search_off:Icons.search,
                        color: Colors.blue.shade900,
                      )),
                  onTap: () {
                    setState(() {
                      search=!search;
                    });
                  },
                ),

                InkWell(
                  child: Container(
                      margin: EdgeInsets.only(right: 16),
                      child: Icon(
                        Icons.output_sharp,
                        color: Colors.blue.shade900,
                      )),
                  onTap: () {
                    final auth = FirebaseAuth.instance;

                    auth.signOut();
                    Navigator.pushNamedAndRemoveUntil(
                        context, LoginScreen.id, (route) => false);
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
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            ),
            body: Container(
              margin: EdgeInsets.only(top: 20, left: 8, right: 8, bottom: 8),
              child: ListView.builder(
                itemCount: patientListFiltered.length,
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
                    endActionPane: ActionPane(
                      motion: ScrollMotion(),
                      children: [
                        SlidableAction(
                          flex: 1,
                          onPressed: (context) {
                            deletePatient(snapshot, patientListFiltered[index].hCode!);
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
                    child: SizedBox(
                      height: 80,
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, ProfileScreen.id,
                              arguments: PatientArguments(
                                  patientListFiltered[index].name!,
                                  patientListFiltered[index].hCode!));
                        },
                        child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              side: BorderSide(
                                color: Colors.blue.shade900,
                              ),
                            ),
                            child: ListTile(
                              leading: Container(
                                  padding: EdgeInsets.all(8),
                                  child: Image.asset(
                                    'assets/img/patient.png',
                                    height: 50,
                                  )),
                              title: Text(
                                  'Patient Name : ${patientListFiltered[index].name}'),
                              subtitle: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('# ${patientListFiltered[index].hCode}'),
                              ),
                            )),
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        });
  }

  void deletePatient(
      AsyncSnapshot<QuerySnapshot> snapshot, String hCode) async {
    var checkedValue = snapshot.data?.docs.firstWhere((element) =>
        element['user'] == client.token && element['hCode'] == hCode);
    await FirebaseFirestore.instance
        .collection(ADMSheetKeys.table)
        .doc(checkedValue?.reference.id)
        .delete();
    setState(() {});
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
}

void doNothing(BuildContext context, var snapshot) {}
void navigate(BuildContext context) {
  Navigator.pushNamed(context, ShareScreen.id);
}
