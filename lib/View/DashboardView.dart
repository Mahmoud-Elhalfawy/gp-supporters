import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gppsupporters/View/GuidelineView.dart';
import 'package:gppsupporters/View/LoginScreen.dart';
import 'package:gppsupporters/View/MedicalCalculatorView.dart';
import 'package:gppsupporters/View/ProfileScreen.dart';

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

        leading: Icon(Icons.menu, color: Colors.blue.shade900,),
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

            onTap: (){
              auth.signOut();
              Navigator.pushNamedAndRemoveUntil(context, LoginScreen.id, (route) => false);
            },
          ),
        ],
        backgroundColor: Colors.white,
        toolbarHeight: 100,
        elevation: 7,
      ),

      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.grey.shade200,
        padding: EdgeInsets.all(20),
        child: Column(

          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                // mainAxisSize: MainAxisSize.max,
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Material(
                      elevation: 10,
                      borderRadius: BorderRadius.all(Radius.circular(20)),

                       child: Container(
                        decoration: BoxDecoration(

                            borderRadius: BorderRadius.all(Radius.circular(20))
                        ),

                         child: InkWell(
                           onTap: ()=> Navigator.pushNamed(context, MedicalCalculatorView.id),
                           child: Center(child: Column(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                               Text("Medical Calculators", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                               SizedBox(height: 15,),
                               Image.asset('assets/img/calc.png',width: 170,height: 170,)
                             ],
                           )),
                         ),
                      ),
                    ),
                  ),
                  SizedBox(width: 30,),
                  Expanded(
                    child: Material(
                      elevation: 10,
                      borderRadius: BorderRadius.all(Radius.circular(20)),

                      child: Container(
                        decoration: BoxDecoration(

                            borderRadius: BorderRadius.all(Radius.circular(20))
                        ),

                        child: InkWell(
                          onTap: ()=> Navigator.pushNamed(context, ProfileScreen.id),
                          child: Center(child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("View Profiles", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                              SizedBox(height: 15,),
                              Image.asset('assets/img/viewprofile.png',width: 145,height: 170,)
                            ],
                          )),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 40,),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                // mainAxisSize: MainAxisSize.max,
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Material(
                      elevation: 10,
                      borderRadius: BorderRadius.all(Radius.circular(20)),

                      child: Container(
                        decoration: BoxDecoration(

                            borderRadius: BorderRadius.all(Radius.circular(20))
                        ),

                        child: InkWell(
                          onTap: ()=> Navigator.pushNamed(context, GuidelineView.id),
                          child: Center(child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Guidelines", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                              SizedBox(height: 15,),
                              Image.asset('assets/img/guideline3.png',width: 170,height: 170,)
                            ],
                          )),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20,),
                  Expanded(
                    child: Material(
                      elevation: 10,
                      borderRadius: BorderRadius.all(Radius.circular(20)),

                      child: Container(
                        decoration: BoxDecoration(

                            borderRadius: BorderRadius.all(Radius.circular(20))
                        ),

                        child: Center(child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("New Profile", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                            SizedBox(height: 15,),
                            Image.asset('assets/img/adddoctor.png',width: 170,height: 170,)
                          ],
                        )),
                      ),
                    ),
                  ),

                ],
              ),
            ),

          ],
        ),

      ),
    );
  }
}
