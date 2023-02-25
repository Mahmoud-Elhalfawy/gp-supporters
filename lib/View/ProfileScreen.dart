import 'package:firebase_auth/firebase_auth.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gppsupporters/Utils/LabsTable.dart';
import 'package:gppsupporters/View/ADMScreen.dart';
import 'package:gppsupporters/View/DashboardView.dart';
import 'package:gppsupporters/View/LabsScreen.dart';

import 'LoginScreen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  static String id="profile";

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
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
                    child: Icon(Icons.output_sharp, color: Colors.blue.shade900,)),

                onTap: (){
                  auth.signOut();
                  Navigator.pushNamedAndRemoveUntil(context, LoginScreen.id, (route) => false);
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
                    children: [
                      Icon(Icons.account_circle,color: Colors.black,),
                      SizedBox(width: 15,),
                      Text('Mahmoud', style: TextStyle(color: Colors.black),),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Icon(Icons.numbers_rounded,color: Colors.blue.shade900,),
                      SizedBox(width: 15,),

                      Text('1', style: TextStyle(color: Colors.black),),
                    ],
                  ),

                ],
              ),
            ),
          ),
          body: Container(
            margin: EdgeInsets.all(15),
            child: const TabBarView(
              children: [
               ADMScreen(),
                LabsScreen(title: "title"),
                // LabsScreen(title: "title"),
                Icon(Icons.downloading),
                Icon(Icons.downloading),
                Icon(Icons.downloading),
                Icon(Icons.downloading),
                Icon(Icons.downloading),
                Icon(Icons.downloading),


              ],
            ),
          ),
        ),
      );

  }
}