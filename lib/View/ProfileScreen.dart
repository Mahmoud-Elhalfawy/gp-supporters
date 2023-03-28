import 'package:firebase_auth/firebase_auth.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gppsupporters/Model/Client.dart';
import 'package:gppsupporters/Utils/LabsTable.dart';
import 'package:gppsupporters/View/ADMScreen.dart';
import 'package:gppsupporters/View/DashboardView.dart';
import 'package:gppsupporters/View/InterventionScreen.dart';
import 'package:gppsupporters/View/LabsScreen.dart';
import 'package:gppsupporters/View/MedScreen.dart';
import 'package:gppsupporters/View/NotesScreen.dart';
import 'package:gppsupporters/View/OncoScreen.dart';
import 'package:gppsupporters/View/VitalsScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Model/PatientArguments.dart';
import 'LoginScreen.dart';

class ProfileScreen extends StatefulWidget {

  const ProfileScreen({Key? key}) : super(key: key);
  static String id="profile";
  static String code='';

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final auth = FirebaseAuth.instance;

  Client client=Client();
  @override
  Widget build(BuildContext context) {

    final args = ModalRoute.of(context)!.settings.arguments as PatientArguments;
    ProfileScreen.code=args.code;
    return DefaultTabController(
        length: 8,
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
              tabs: const [

                Tab(text:"ADM"),
                Tab(text:"LAB"),
                Tab(text:"MED"),
                Tab(text:"VITALS"),
                Tab(text:"ONCO"),
                Tab(text:"PIC"),
                Tab(text:"NOTES"),
                Tab(text:"INTRV"),

              ],
            ),
            title:  Container(
              margin: EdgeInsets.only(top: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.account_circle,color: Colors.black,),
                      SizedBox(width: 10,),
                      Text(args.name, style: TextStyle(color: Colors.black),),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Icon(Icons.numbers_rounded,color: Colors.blue.shade900,),
                      SizedBox(width: 10,),

                      Text(args.code, style: TextStyle(color: Colors.black),),
                    ],
                  ),

                ],
              ),
            ),
          ),
          body: Container(
            margin: EdgeInsets.all(15),
            child:  TabBarView(
              children: [
               ADMScreen(code: ProfileScreen.code),
                LabsScreen(code: ProfileScreen.code),
                MedScreen(code: ProfileScreen.code,),
                VitalsScreen(code: ProfileScreen.code),
                OncoScreen(code: ProfileScreen.code),

                Icon(Icons.downloading),
                NotesScreen(code: ProfileScreen.code,),
                InterventionScreen(code: ProfileScreen.code,),


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

