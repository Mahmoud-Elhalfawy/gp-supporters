import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:editable/editable.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gppsupporters/Utils/LabKeys.dart';
import 'package:gppsupporters/Utils/LabsTable.dart';
import 'package:gppsupporters/View/DDIScreen.dart';
import 'package:gppsupporters/View/DashboardView.dart';
import 'package:gppsupporters/View/GuidelineView.dart';
import 'package:gppsupporters/View/MedicalCalculatorView.dart';
import 'package:gppsupporters/View/NewProfileScreen.dart';
import 'package:gppsupporters/View/OncoScreen.dart';
import 'package:gppsupporters/View/PatientsScreen.dart';
import 'package:gppsupporters/View/ProfileScreen.dart';
import 'package:gppsupporters/View/ShareScreen.dart';
import 'package:gppsupporters/View/VitalsScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'DatabaseUtils/keys.dart';
import 'Model/Client.dart';
import 'SplashScreen.dart';
import 'View/CelebrateScreen.dart';
import 'View/LoginScreen.dart';
import 'View/SignupScreen.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  final database = FirebaseFirestore.instance;
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? registered = prefs.getString("register");
  print("registered : $registered");
  Widget screen;
  if (!(registered == null || registered == false || registered.isEmpty)) {
    var dataStream = await database.collection(Keys.CLIENT_DB).get();


    var snapshot = dataStream.docs.firstWhere((element) =>
    element.get("token").toString() == registered.toString());
    Client client = Client(name: snapshot.get("name").toString(), token: snapshot.get("token").toString());
    print("Client 3 : ${client.name}");
    screen=DashboardView();


  }else {
    screen=LoginScreen();

  }

  runApp(MyApp(screen:screen));
}

class MyApp extends StatelessWidget {
  Widget screen;

  MyApp({required this.screen});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Editable example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.blue,
        accentColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(screen: screen,),
        initialRoute: SplashScreen.id,

        // home: SplashScreen(),
        // initialRoute: SplashScreen.id,
        routes: {

          DashboardView.id:(context)=>DashboardView(),
          MedicalCalculatorView.id:(context)=>MedicalCalculatorView(),
          GuidelineView.id:(context)=>GuidelineView(),
          ProfileScreen.id:(context)=>ProfileScreen(),
          PatientsScreen.id:(context)=>PatientsScreen(),
          VitalsScreen.id:(context)=>VitalsScreen(code: '',),
          OncoScreen.id:(context)=>OncoScreen(code: ''),
          NewProfileScreen.id:(context)=>NewProfileScreen(),
          LoginScreen.id:(context)=> LoginScreen(),
          SignupScreen.id:(context)=> SignupScreen(),
          ShareScreen.id:(context)=>ShareScreen(),
          DDIScreen.id:(context)=>DDIScreen(),
          CelebrateScreen.id:(context)=>CelebrateScreen(),
          //   CheckPatientScreen.id:(context)=>CheckPatientScreen(),
        }
    );
  }
}
