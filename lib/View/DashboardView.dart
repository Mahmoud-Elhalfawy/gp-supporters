import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gppsupporters/View/DDIScreen.dart';
import 'package:gppsupporters/View/GuidelineView.dart';
import 'package:gppsupporters/View/LoginScreen.dart';
import 'package:gppsupporters/View/MedicalCalculatorView.dart';
import 'package:gppsupporters/View/NewProfileScreen.dart';
import 'package:gppsupporters/View/PatientsScreen.dart';
import 'package:gppsupporters/View/ProfileScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
                child: Icon(Icons.output_sharp, color: Colors.blue.shade900,)),

            onTap: ()async{
              auth.signOut();
SharedPreferences preferences = await SharedPreferences.getInstance();
await preferences.clear();
              Navigator.pushNamedAndRemoveUntil(context, LoginScreen.id, (route) => false);
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
                         width: 160,
                        height: 210,
                        decoration: BoxDecoration(

                            borderRadius: BorderRadius.all(Radius.circular(20))
                        ),

                         child: InkWell(
                           onTap: ()=> Navigator.pushNamed(context, MedicalCalculatorView.id),
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
                        width: 160,
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
                        children: [
                          Text("DDI", style: TextStyle(color: Colors.black, fontSize: 20),),
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
                      onPressed: () {},
                      child: Column(
                        children: [
                          Text("About us", style: TextStyle(color: Colors.black, fontSize: 20),),
                          Image.asset('assets/img/working.png',width: 45,height: 45,)
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


                  ],
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
                        width: 160,
                        height: 210,
                        decoration: BoxDecoration(

                            borderRadius: BorderRadius.all(Radius.circular(20))
                        ),

                        child: InkWell(
                          onTap: ()=> Navigator.pushNamed(context, GuidelineView.id),
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
                          width: 160,
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
