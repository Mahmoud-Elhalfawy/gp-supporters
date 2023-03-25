import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gppsupporters/Model/Dermatology.dart';
import 'package:gppsupporters/Model/Dermatology.dart';
import 'package:gppsupporters/Model/Dermatology.dart';
import 'package:gppsupporters/Model/Dermatology.dart';
import 'package:gppsupporters/Model/Dermatology.dart';
import 'package:gppsupporters/Model/Dermatology.dart';
import 'package:gppsupporters/View/GuidelinesListScreen.dart';
import 'package:gppsupporters/View/ProfileScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Model/Oncology.dart';
import '../Model/Client.dart';
import '../Model/PatientArguments.dart';
import 'LoginScreen.dart';

class DermatologyScreen extends StatefulWidget {
  const DermatologyScreen({Key? key}) : super(key: key);
  static String id="dermatology screen";
  static String code='';

  @override
  State<DermatologyScreen> createState() => _DermatologyScreenState();
}

class _DermatologyScreenState extends State<DermatologyScreen> {
  final auth = FirebaseAuth.instance;

  Client client=Client();
  @override
  Widget build(BuildContext context) {


    return DefaultTabController(
      length: 1,
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
                    child: Icon(Icons.output_sharp, color: Colors.indigo.shade900)),

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
              dividerColor: Colors.indigo.shade900,
              indicatorColor: Colors.indigo.shade900,
              indicatorSize: TabBarIndicatorSize.label,
              isScrollable: true,
              tabs:  [

                Tab(text:Dermatology.option1),


              ],
            ),
            title:  Center(
              child: Text(
                'Dermatology',
                style: TextStyle(color: Colors.indigo.shade900),
                textAlign: TextAlign.left,
              ),
            )
        ),
        body: Container(
          margin: EdgeInsets.all(15),
          child:  TabBarView(
            children: [

              GuidelinesListScreen(type: "dermatology", subType: Dermatology.option1,),



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

