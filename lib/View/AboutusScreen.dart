import 'package:flutter/material.dart';

class AboutusScreen extends StatelessWidget {
  static String id = "about us screen";
  const AboutusScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/img/logofinal.jpg',
                  fit: BoxFit.contain,
                  height: 200,
                  width: 200,
                ),
                Text(
                  'The team behind',
                  style: TextStyle(
                      fontFamily: 'SourceSansPro',
                      letterSpacing: 2.5,
                      color: Color(0xfff07b3f),
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'Di-Med-Care',
                  style: TextStyle(
                      fontFamily: 'Pacifico',
                      color: Colors.blue.shade900,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 40,
                  width: 250,
                  child: Divider(
                    color: Color(0xfff07b3f),
                    thickness: 1,
                  ),
                ),

                Text(
                  'Brief about us',
                  style: TextStyle(
                      fontFamily: 'SourceSansPro',
                      letterSpacing: 2.5,
                      color: Color(0xfff07b3f),
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                  width: 150,
                  child: Divider(
                    color: Color(0xfff07b3f),
                    thickness: 1,

                  ),
                ),
                Container(
                  margin: EdgeInsets.all(16),
                  padding: EdgeInsets.all(16),
                  child: Text(
                      "We are a group of 13 senior clinical pharmacy students from Alexandria university.We designed the Di-Medcare(digitalized medical care) app as our graduation project that aims at converting hard copied patient profiles into digitalized one for geriatric patients as a start in Alexandria Main University Hospitals then to be applied to all patients in different departments in all other hospitals and clinics.This will help clinical pharmacists, physicians and all other health care professionals improving their documentation about patients, as we've observed some drawbacks related to paper based profiles during our training in wards.Thank you for using our application and hope you enjoy all the application features.",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        fontFamily: 'SourceSansPro',
                        color: Colors.black,
                        letterSpacing: 0.1,
                        fontSize: 18,
                        ),

                  ),
                ),
                
                Container(
                  margin: EdgeInsets.all(8),
                  padding: EdgeInsets.all(16),
                  child: Text("For enquiries and suggestions contact us through:",
                    style: TextStyle(
                      fontFamily: 'SourceSansPro',
                      letterSpacing: 2.5,
                      color: Color(0xfff07b3f),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                Card(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: ListTile(
                    leading: ImageIcon(
                      AssetImage("assets/img/drug.png"),
                      color: Colors.blue.shade900,
                    ),
                    title: Text(
                      'Nabila Farouk Mohamed Tmmam\n',
                      style: TextStyle(
                        fontFamily: 'SourceSansPro',
                        color: Colors.blue.shade900,
                        fontSize: 20,
                      ),
                    ),
                    subtitle: Text(
                      'nbylhtmam@gmail.com\n',
                      style: TextStyle(
                        fontFamily: 'SourceSansPro',
                        color: Colors.blue.shade900,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                Card(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: ListTile(
                    leading: ImageIcon(
                      AssetImage("assets/img/drug.png"),
                      color: Colors.blue.shade900,
                    ),
                    title: Text(
                      'Tarek salah Saad Abdelhamid Okasha\n',
                      style: TextStyle(
                        fontFamily: 'SourceSansPro',
                        color: Colors.blue.shade900,
                        fontSize: 20,
                      ),
                    ),
                    subtitle: Text(
                      'rh44415@gmail.com\n',
                      style: TextStyle(
                        fontFamily: 'SourceSansPro',
                        color: Colors.blue.shade900,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                Card(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: ListTile(
                    leading: ImageIcon(
                      AssetImage("assets/img/drug.png"),
                      color: Colors.blue.shade900,
                    ),
                    title: Text(
                      'Dr. Rana Khalil Draz\n(Project Supervisor)\n ',
                      style: TextStyle(
                        fontFamily: 'SourceSansPro',
                        color: Colors.blue.shade900,
                        fontSize: 20,
                      ),
                    ),
                    subtitle: Text(
                      'rana.draz90@gmail.com\n',
                      style: TextStyle(
                        fontFamily: 'SourceSansPro',
                        color: Colors.blue.shade900,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                Card(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: ListTile(
                    leading: ImageIcon(
                      AssetImage("assets/img/drug.png"),
                      color: Colors.blue.shade900,
                    ),
                    title: Text(
                      'Mahmoud Elhalfawy\n(App Developer)\n',
                      style: TextStyle(
                        fontFamily: 'SourceSansPro',
                        color: Colors.blue.shade900,
                        fontSize: 20,
                      ),
                    ),
                    subtitle: Text(
                      'elhalfawymahmoud@gmail.com\n',
                      style: TextStyle(
                        fontFamily: 'SourceSansPro',
                        color: Colors.blue.shade900,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 40,
                  width: 250,
                  child: Divider(
                    color: Color(0xfff07b3f),
                    thickness: 1,
                  ),
                ),

                Text(
                  'Group Members',
                  style: TextStyle(
                      fontFamily: 'SourceSansPro',
                      letterSpacing: 2.5,
                      color: Color(0xfff07b3f),
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                  width: 150,
                  child: Divider(
                    color: Color(0xfff07b3f),
                    thickness: 1,

                  ),
                ),

                Card(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: ListTile(
                    leading: ImageIcon(
                      AssetImage("assets/img/drug.png"),
                      color: Colors.blue.shade900,
                    ),
                    title: Text(
                      'Nabila Farouk Mohamed Tmmam ',
                      style: TextStyle(
                        fontFamily: 'SourceSansPro',
                        color: Colors.blue.shade900,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                Card(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: ListTile(
                    leading: ImageIcon(
                      AssetImage("assets/img/drug.png"),
                      color: Colors.blue.shade900,
                    ),
                    title: Text(
                      'Nehal Saber Abdelaziz Basuony',
                      style: TextStyle(
                        fontFamily: 'SourceSansPro',
                        color: Colors.blue.shade900,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                Card(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: ListTile(
                    leading: ImageIcon(
                      AssetImage("assets/img/drug.png"),
                      color: Colors.blue.shade900,
                    ),
                    title: Text(
                      'Marium Ihab Ahmed Elfahham',
                      style: TextStyle(
                        fontFamily: 'SourceSansPro',
                        color: Colors.blue.shade900,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                Card(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: ListTile(
                    leading: ImageIcon(
                      AssetImage("assets/img/drug.png"),
                      color: Colors.blue.shade900,
                    ),
                    title: Text(
                      'Tarek salah Saad Abdelhamid Okasha',
                      style: TextStyle(
                        fontFamily: 'SourceSansPro',
                        color: Colors.blue.shade900,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                Card(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: ListTile(
                    leading: ImageIcon(
                      AssetImage("assets/img/drug.png"),
                      color: Colors.blue.shade900,
                    ),
                    title: Text(
                      'Abdelwahhab Mohamed soliman Hamadi',
                      style: TextStyle(
                        fontFamily: 'SourceSansPro',
                        color: Colors.blue.shade900,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                Card(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: ListTile(
                    leading: ImageIcon(
                      AssetImage("assets/img/drug.png"),
                      color: Colors.blue.shade900,
                    ),
                    title: Text(
                      'Omar Shebl Ahmed Ismaeil Elhalawany',
                      style: TextStyle(
                        fontFamily: 'SourceSansPro',
                        color: Colors.blue.shade900,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                Card(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: ListTile(
                    leading: ImageIcon(
                      AssetImage("assets/img/drug.png"),
                      color: Colors.blue.shade900,
                    ),
                    title: Text(
                      'Walid Hassan Abdelhameed Elmenaisy',
                      style: TextStyle(
                        fontFamily: 'SourceSansPro',
                        color: Colors.blue.shade900,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                Card(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: ListTile(
                    leading: ImageIcon(
                      AssetImage("assets/img/drug.png"),
                      color: Colors.blue.shade900,
                    ),
                    title: Text(
                      'Ahmed Deyaa Abdelmonem Asfour',
                      style: TextStyle(
                        fontFamily: 'SourceSansPro',
                        color: Colors.blue.shade900,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                Card(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: ListTile(
                    leading: ImageIcon(
                      AssetImage("assets/img/drug.png"),
                      color: Colors.blue.shade900,
                    ),
                    title: Text(
                      'Sohaila Mohamed Abdelmonem',
                      style: TextStyle(
                        fontFamily: 'SourceSansPro',
                        color: Colors.blue.shade900,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                Card(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: ListTile(
                    leading: ImageIcon(
                      AssetImage("assets/img/drug.png"),
                      color: Colors.blue.shade900,
                    ),
                    title: Text(
                      'Marium Abdelmonem Saeed Mohamed Elsayed',
                      style: TextStyle(
                        fontFamily: 'SourceSansPro',
                        color: Colors.blue.shade900,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                Card(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: ListTile(
                    leading: ImageIcon(
                      AssetImage("assets/img/drug.png"),
                      color: Colors.blue.shade900,
                    ),
                    title: Text(
                      'Doaa Sameh Farouk Mostafa Abdelrahman',
                      style: TextStyle(
                        fontFamily: 'SourceSansPro',
                        color: Colors.blue.shade900,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                Card(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: ListTile(
                    leading: ImageIcon(
                      AssetImage("assets/img/drug.png"),
                      color: Colors.blue.shade900,
                    ),
                    title: Text(
                      'Mohamed Gahed Abdelwahhab Eid',
                      style: TextStyle(
                        fontFamily: 'SourceSansPro',
                        color: Colors.blue.shade900,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                Card(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: ListTile(
                    leading: ImageIcon(
                      AssetImage("assets/img/drug.png"),
                      color: Colors.blue.shade900,
                    ),
                    title: Text(
                      'Ahmed Mohamed Rabiae ',
                      style: TextStyle(
                        fontFamily: 'SourceSansPro',
                        color: Colors.blue.shade900,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                  width: 250,
                  child: Divider(
                    color: Color(0xfff07b3f),
                    thickness: 1,
                  ),
                ),

                Text(
                  'Project supervisors ',
                  style: TextStyle(
                      fontFamily: 'SourceSansPro',
                      letterSpacing: 2.5,
                      color: Color(0xfff07b3f),
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                  width: 150,
                  child: Divider(
                    color: Color(0xfff07b3f),
                    thickness: 1,

                  ),
                ),
                Card(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: ListTile(
                    leading: ImageIcon(
                      AssetImage("assets/img/drug.png"),
                      color: Colors.blue.shade900,
                    ),
                    title: Text(
                      'Dr. Rana Khalil Draz ',
                      style: TextStyle(
                        fontFamily: 'SourceSansPro',
                        color: Colors.blue.shade900,
                        fontSize: 20,
                      ),
                    ),
                    subtitle: Text(
                      'rana.draz90@gmail.com',
                      style: TextStyle(
                        fontFamily: 'SourceSansPro',
                        color: Colors.blue.shade900,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                Card(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: ListTile(
                    leading: ImageIcon(
                      AssetImage("assets/img/drug.png"),
                      color: Colors.blue.shade900,
                    ),
                    title: Text(
                      'Dr. Rawan Ahmed Salem  ',
                      style: TextStyle(
                        fontFamily: 'SourceSansPro',
                        color: Colors.blue.shade900,
                        fontSize: 20,
                      ),
                    ),
                    subtitle: Text(
                      'rawan.asalem@gmail.com',
                      style: TextStyle(
                        fontFamily: 'SourceSansPro',
                        color: Colors.blue.shade900,
                        fontSize: 16,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
