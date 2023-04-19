import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gppsupporters/View/AboutusScreen.dart';
import 'package:gppsupporters/View/DDIScreen.dart';
import 'package:gppsupporters/View/DrugNarrativeScreen.dart';
import 'package:gppsupporters/View/GuidelinesScreens/BookScreen.dart';
import 'package:gppsupporters/View/GuidelinesScreens/GuidelineView.dart';
import 'package:gppsupporters/View/LoginScreen.dart';
import 'package:gppsupporters/View/MedicalCalculatorScreen.dart';
import 'package:gppsupporters/View/NewProfileScreen.dart';
import 'package:gppsupporters/View/PatientsScreen.dart';
import 'package:gppsupporters/View/ProfileScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'GuidelinesScreens/GuildelinesOptionsScreen.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({Key? key}) : super(key: key);
  static String id="dashboard";

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(

        leading: Icon(Icons.menu, color: Colors.transparent,),
        title: Text('Dashboard', style: TextStyle(color: Colors.blue.shade900),textAlign: TextAlign.left,),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),

        actions:  [
          InkWell(
            child: Container(
                margin: EdgeInsets.only(right: 16),
                child: Image.asset("assets/img/working.png", fit: BoxFit.contain,height: 35,width: 35,)),

            onTap: ()async{
                    Navigator.pushNamed(context, AboutusScreen.id);
            },
          ),

          InkWell(
            child: Container(
                margin: EdgeInsets.only(right: 16),
                child: Icon(Icons.output_sharp, color: Colors.blue.shade900,size: 35,)),

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
        backgroundColor: Colors.white,
        toolbarHeight: 100,
        elevation: 7,
      ),

      body: SafeArea(
        child: Center(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 8),
            child: Column(

              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,

              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Material(
                      elevation: 10,
                      borderRadius: BorderRadius.all(Radius.circular(20)),

                       child: Container(
                         width: 170,
                        height: 210,
                        decoration: BoxDecoration(

                            borderRadius: BorderRadius.all(Radius.circular(20))
                        ),

                         child: InkWell(
                           onTap: ()=> Navigator.pushNamed(context, MedicalCalculatorScreen.id),
                           child: Center(child: Column(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                               Container(margin:EdgeInsets.only(top: 10),child: Text("Medical Calculators", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),)),
                               SizedBox(height: 15,),
                               Image.asset('assets/img/calc.png',width: 145,height: 145,)
                             ],
                           )),
                         ),
                      ),
                    ),
                    SizedBox(width: 20,),
                    Material(
                      elevation: 10,
                      borderRadius: BorderRadius.all(Radius.circular(20)),

                      child: Container(
                        width: 170,
                        height: 210,
                        padding: EdgeInsets.only(left: 10),
                        decoration: BoxDecoration(

                            borderRadius: BorderRadius.all(Radius.circular(20))
                        ),

                        child: InkWell(
                          onTap: ()=> Navigator.pushNamed(context, PatientsScreen.id),
                          child: Center(child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(margin:EdgeInsets.only(top: 10),child: Text("View Profiles", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),)),
                              SizedBox(height: 15,),
                              Image.asset('assets/img/viewprofile.png',width: 145,height: 145,)
                            ],
                          )),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 70),
                  child: Divider(
                    color: Colors.grey.shade500,
                    thickness: 2,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        
                        Navigator.pushNamed(context, DDIScreen.id);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,

                        children: [
                          Text("DDI", style: TextStyle(color: Colors.black, fontSize: 16),),
                          SizedBox(height: 5,),

                          Image.asset('assets/img/drug.png',width: 45,height: 45,)
                          ,
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(130,110),
                        maximumSize: Size(130,110),

                        shape: CircleBorder(),
                        padding: EdgeInsets.all(20),
                        backgroundColor: Colors.white, // <-- Button color
                        foregroundColor: Colors.blue.shade900, // <-- Splash color
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {

                        Navigator.pushNamed(context, DrugNarrativeScreen.id);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Drug Narrative", style: TextStyle(color: Colors.black, fontSize: 15),),
                          SizedBox(height: 5,),

                          Image.asset('assets/img/pharmacy.png',width: 45,height: 45,)
                          ,
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(0,110),

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))
                        ),
                        padding: EdgeInsets.all(20),
                        backgroundColor: Colors.white, // <-- Button color
                        foregroundColor: Colors.blue.shade900, // <-- Splash color
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {

                        Navigator.pushNamed(context, BookScreen.id);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Book Stock", style: TextStyle(color: Colors.black, fontSize: 15),),
                          SizedBox(height: 5,),
                          Image.asset('assets/img/bookstack.png',width: 45,height: 45,)
                          ,
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(130,110),
                        maximumSize: Size(130,110),

                        shape: CircleBorder(),
                        padding: EdgeInsets.all(20),
                        backgroundColor: Colors.white, // <-- Button color
                        foregroundColor: Colors.blue.shade900, // <-- Splash color
                      ),
                    ),
                    // ElevatedButton(
                    //   onPressed: () {},
                    //   child: Column(
                    //     children: [
                    //       Text("About us", style: TextStyle(color: Colors.black, fontSize: 20),),
                    //       Image.asset('assets/img/working.png',width: 45,height: 45,)
                    //       ,
                    //     ],
                    //   ),
                    //   style: ElevatedButton.styleFrom(
                    //     minimumSize: Size(130,110),
                    //     maximumSize: Size(130,110),
                    //
                    //     shape: CircleBorder(),
                    //     padding: EdgeInsets.all(20),
                    //     backgroundColor: Colors.white, // <-- Button color
                    //     foregroundColor: Colors.blue.shade900, // <-- Splash color
                    //   ),
                    // ),


                  ],
                ),

                Container(
                  margin: EdgeInsets.symmetric(horizontal: 30),

                  child: Divider(

                    color: Colors.grey.shade500,
                    thickness: 2,
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Material(
                      elevation: 10,
                      borderRadius: BorderRadius.all(Radius.circular(20)),

                      child: Container(
                        width: 170,
                        height: 210,
                        decoration: BoxDecoration(

                            borderRadius: BorderRadius.all(Radius.circular(20))
                        ),

                        child: InkWell(
                          onTap: ()=> Navigator.pushNamed(context, GuidelinesOptionsScreen.id),
                          child: Center(child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(margin:EdgeInsets.only(top: 10),child: Text("Guidelines", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),)),
                              SizedBox(height: 15,),
                              Image.asset('assets/img/guideline3.png',width: 145,height: 145,)
                            ],
                          )),
                        ),
                      ),
                    ),
                    SizedBox(width: 20,),
                    InkWell(
                      onTap: (){
                        Navigator.pushNamed(context, NewProfileScreen.id);
                      },
                      child: Material(
                        elevation: 10,
                        borderRadius: BorderRadius.all(Radius.circular(20)),

                        child: Container(
                          width: 170,
                          height: 210,
                          decoration: BoxDecoration(

                              borderRadius: BorderRadius.all(Radius.circular(20))
                          ),

                          child: Center(child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(margin:EdgeInsets.only(top: 10),child: Text("New Profile", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),)),
                              SizedBox(height: 15,),
                              Image.asset('assets/img/adddoctor.png',width: 145,height: 145,)
                            ],
                          )),
                        ),
                      ),
                    ),

                  ],
                ),

              ],
            ),
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

