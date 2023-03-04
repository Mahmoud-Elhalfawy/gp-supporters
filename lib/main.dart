import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:editable/editable.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gppsupporters/Utils/LabKeys.dart';
import 'package:gppsupporters/Utils/LabsTable.dart';
import 'package:gppsupporters/View/DashboardView.dart';
import 'package:gppsupporters/View/GuidelineView.dart';
import 'package:gppsupporters/View/MedicalCalculatorView.dart';
import 'package:gppsupporters/View/PatientsScreen.dart';
import 'package:gppsupporters/View/ProfileScreen.dart';
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
  if (!(registered == null || registered == false)) {
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
          //
          LoginScreen.id:(context)=> LoginScreen(),
          //   SplashScreen.id:(context)=>SplashScreen(),
          SignupScreen.id:(context)=> SignupScreen(),
          // HomeScreen.id:(context)=> HomeScreen(),
          // //   PatientScreen.id:(context)=>PatientScreen(),
          // //   LabTestsScreen.id:(context)=>LabTestsScreen(),
          // //   NurseScreen.id:(context)=>NurseScreen(),
          CelebrateScreen.id:(context)=>CelebrateScreen(),
          //   CheckPatientScreen.id:(context)=>CheckPatientScreen(),
        }
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  /// Create a Key for EditableState
  final _editableKey = GlobalKey<EditableState>();

  List rows = [
    {
      "lab": LabKeys.hb,
      "1": '23/09/2020',
      "month": 'June',
      "status": 'completed'
    },
    {
      "lab": LabKeys.plt,
      "month": 'March',
      "status": 'new',
      "1": '12/4/2020',
    },
    {
      "month": LabKeys.wbc,
      "lab": 'Mark Zuckerberg',
      "1": '09/4/1993',
      "status": 'expert'
    },
    {
      "lab": LabKeys.neutrophils,
      "status": 'legend',
      "1": '01/7/1820',
      "month": 'December',
    },
  ];
  List cols = [
    {"title": 'Lab', 'widthFactor': 0.2, 'key': 'lab', 'editable': false},
    {"title": '1/10', 'widthFactor': 0.2, 'key': '1'},
    {"title": '2', 'widthFactor': 0.2, 'key': '2'},
    {"title": '3', 'key': '3'},
    {"title": '4', 'key': '4'},
    {"title": '5', 'key': '5'},
    {"title": '6', 'key': '6'},
    {"title": '7', 'key': '7'},
    {"title": '8', 'key': '8'},
    {"title": '9', 'key': '9'},
    {"title": '10', 'key': '10'},

  ];

  /// Function to add a new row
  /// Using the global key assigined to Editable widget
  /// Access the current state of Editable
  void _addNewRow() {
    setState(() {
      _editableKey.currentState?.createRow();
    });
  }

  void save(){

  }

  ///Print only edited rows.
  void _printEditedRows() {
    List editedRows = _editableKey.currentState!.editedRows;
    print(editedRows);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 200,
        leading: TextButton.icon(
            onPressed: () => _addNewRow(),
            icon: Icon(Icons.add),
            label: Text(
              'Add',
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
        title: Text(widget.title),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
                onPressed: () => _printEditedRows(),
                child: Text('Print Edited Rows',
                    style: TextStyle(fontWeight: FontWeight.bold))),
          )
        ],
      ),
      body: Editable(
        key: _editableKey,
        columns: cols,
        rows: rows,
        zebraStripe: true,
        stripeColor1: Colors.blue.shade50,
        stripeColor2: Colors.grey.shade200,
        onRowSaved: (value) {
          print(value);
        },
        onSubmitted: (value) {
          print(value);
        },
        borderColor: Colors.blueGrey,
        tdStyle: TextStyle(fontWeight: FontWeight.bold),
        trHeight: 80,
        thStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        thAlignment: TextAlign.center,
        thVertAlignment: CrossAxisAlignment.end,
        thPaddingBottom: 3,
        showSaveIcon: true,
        saveIconColor: Colors.black,
        showCreateButton: true,
        tdAlignment: TextAlign.left,
        tdEditableMaxLines: 100, // don't limit and allow data to wrap
        tdPaddingTop: 0,
        tdPaddingBottom: 14,
        tdPaddingLeft: 10,
        tdPaddingRight: 8,
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
            borderRadius: BorderRadius.all(Radius.circular(0))),
      ),
    );
  }
}