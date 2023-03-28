import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gppsupporters/Model/Geriatrics.dart';
import 'package:gppsupporters/View/GuidelinesScreens/GuidelinesListScreen.dart';
import 'package:gppsupporters/View/ProfileScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Model/Client.dart';
import '../../Model/PatientArguments.dart';
import '../LoginScreen.dart';

class GeriatricsScreen extends StatefulWidget {
  const GeriatricsScreen({Key? key}) : super(key: key);
  static String id="geriatrics screen";
  static String code='';

  @override
  State<GeriatricsScreen> createState() => _GeriatricsScreenState();
}

class _GeriatricsScreenState extends State<GeriatricsScreen> {
  final auth = FirebaseAuth.instance;

  Client client=Client();
  @override
  Widget build(BuildContext context) {


    return DefaultTabController(
      length: 2,
      child: Scaffold(
        // resizeToAvoidBottomInset: false, // set it to false

        appBar: AppBar(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(15),
              ),
            ),

            backgroundColor: Colors.white,
            toolbarHeight: 90,
            elevation: 7,

            actions:  [

              InkWell(
                child: Container(
                    margin: EdgeInsets.only(right: 16),
                    child: Icon(Icons.output_sharp, color: Colors.blue.shade900)),

                onTap: ()async{
                  final ConfirmAction action = (await _asyncConfirmDialog(context))!;

                  if(action==ConfirmAction.Accept){
                    auth.signOut();
                    SharedPreferences preferences = await SharedPreferences.getInstance();
                    await preferences.clear();
                    Navigator.pushNamedAndRemoveUntil(context, LoginScreen.id, (route) => false);}

                },
              ),
            ],
            bottom:   TabBar(
              labelColor:Colors.black,
              dividerColor: Colors.blue.shade900,
              indicatorColor: Colors.blue.shade900,
              indicatorSize: TabBarIndicatorSize.label,
              isScrollable: true,
              tabs:  [

                Tab(text:Geriatrics.option1),
                Tab(text:Geriatrics.option2),


              ],
            ),
            title:  Center(
              child: Text(
                'Geriatrics',
                style: TextStyle(color: Colors.blue.shade900),
                textAlign: TextAlign.left,
              ),
            )
        ),
        body: Container(
          margin: EdgeInsets.all(15),
          child:  TabBarView(
            children: [

              GuidelinesListScreen(type: "geriatrics", subType: Geriatrics.option1,),
              GuidelinesListScreen(type: "geriatrics", subType: Geriatrics.option2,),

              // ADMScreen(code: ProfileScreen.code),
              // LabsScreen(code: ProfileScreen.code),
              // MedScreen(code: ProfileScreen.code,),
              // VitalsScreen(code: ProfileScreen.code),
              // OncoScreen(code: ProfileScreen.code),
              //
              // Icon(Icons.downloading),
              // NotesScreen(code: ProfileScreen.code,),
              // InterventionScreen(code: ProfileScreen.code,),
              //

            ],
          ),
        ),
      ),
    );

  }
}


enum ConfirmAction { Cancel, Accept}
Future<ConfirmAction?> _asyncConfirmDialog(BuildContext context) async {
  return showDialog<ConfirmAction>(
    context: context,
    barrierDismissible: false, // user must tap button for close dialog!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Sign out'),
        content: const Text(
            'Are you sure you want to sign out?'),
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

