import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:editable/editable.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gppsupporters/Model/Endocrinology.dart';
import 'package:gppsupporters/Model/Rheumatology.dart';
import 'package:gppsupporters/Utils/LabKeys.dart';
import 'package:gppsupporters/Utils/LabsTable.dart';
import 'package:gppsupporters/View/AboutusScreen.dart';
import 'package:gppsupporters/View/DrugNarrativeScreen.dart';
import 'package:gppsupporters/View/GuidelinesScreens/BookScreen.dart';
import 'package:gppsupporters/View/GuidelinesScreens/CNSScreen.dart';
import 'package:gppsupporters/View/GuidelinesScreens/CardiologyScreen.dart';
import 'package:gppsupporters/View/DDIScreen.dart';
import 'package:gppsupporters/View/DashboardView.dart';
import 'package:gppsupporters/View/GuidelinesScreens/DermatologyScreen.dart';
import 'package:gppsupporters/View/GuidelinesScreens/GastroenologyScreen.dart';
import 'package:gppsupporters/View/GuidelinesScreens/GeriatricsScreen.dart';
import 'package:gppsupporters/View/GuidelinesScreens/GuidelineView.dart';
import 'package:gppsupporters/View/GuidelinesScreens/GuildelinesOptionsScreen.dart';
import 'package:gppsupporters/View/GuidelinesScreens/HepatologyScreen.dart';
import 'package:gppsupporters/View/GuidelinesScreens/ImmunologyScreen.dart';
import 'package:gppsupporters/View/GuidelinesScreens/NutritionScreen.dart';
import 'package:gppsupporters/View/MedicalCalculatorScreen.dart';
import 'package:gppsupporters/View/GuidelinesScreens/NerphologyScreen.dart';
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
import 'View/GuidelinesScreens/EndocrinologyScreen.dart';
import 'View/LoginScreen.dart';
import 'View/GuidelinesScreens/OncologyScreen.dart';
import 'View/GuidelinesScreens/RheumatologyScreen.dart';
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
          MedicalCalculatorScreen.id:(context)=>MedicalCalculatorScreen(),
          GuidelineView.id:(context)=>GuidelineView(),
          ProfileScreen.id:(context)=>ProfileScreen(),
          PatientsScreen.id:(context)=>PatientsScreen(),
          VitalsScreen.id:(context)=>VitalsScreen(code: '', name: '',),
          OncoScreen.id:(context)=>OncoScreen(code: '', name: '',),
          NewProfileScreen.id:(context)=>NewProfileScreen(),
          LoginScreen.id:(context)=> LoginScreen(),
          SignupScreen.id:(context)=> SignupScreen(),
          ShareScreen.id:(context)=>ShareScreen(),
          DDIScreen.id:(context)=>DDIScreen(),
          GuidelinesOptionsScreen.id:(context)=>GuidelinesOptionsScreen(),
          CardiologyScreen.id:(context)=>CardiologyScreen(),
          HepatologyScreen.id:(context)=>HepatologyScreen(),
          ImmunologyScreen.id:(context)=>ImmunologyScreen(),
          CNSScreen.id:(context)=>CNSScreen(),
          EndocrinologyScreen.id:(context)=>EndocrinologyScreen(),
          OncologyScreen.id:(context)=>OncologyScreen(),
          DermatologyScreen.id:(context)=>DermatologyScreen(),
          RheumatologyScreen.id:(context)=>RheumatologyScreen(),
          GeriatricsScreen.id:(context)=>GeriatricsScreen(),
          GastroenterologyScreen.id:(context)=>GastroenterologyScreen(),
          NephrologyScreen.id:(context)=>NephrologyScreen(),
          BookScreen.id:(context)=>BookScreen(),
          NutritionScreen.id:(context)=>NutritionScreen(),
          DrugNarrativeScreen.id:(context)=>DrugNarrativeScreen(),
          CelebrateScreen.id:(context)=>CelebrateScreen(),
          AboutusScreen.id:(context)=>AboutusScreen(),
          //   CheckPatientScreen.id:(context)=>CheckPatientScreen(),
        }
    );
  }
}
