

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gppsupporters/View/DashboardView.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../DatabaseUtils/keys.dart';
import '../Model/Client.dart';
import '../Utils/CustomColors.dart';
import '../Utils/Strings.dart';
import 'SignupScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static String id="login";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _nameController=new TextEditingController();
  TextEditingController _mailController=new TextEditingController();
  TextEditingController _phoneController=new TextEditingController();
  TextEditingController _passController=new TextEditingController();

  String _register_by="email";






  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;


    return buildPage(height : height);
  }





  Widget buildPage({required double height}) {
    return Scaffold(
      // resizeToAvoidBottomInset: true,

      // appBar: AppBar(
      //   leading: Icon(
      //     Icons.arrow_back_ios,
      //     color: CustomColors.blueBg,
      //
      //   ),
      //   backgroundColor: Colors.white,
      //   toolbarHeight: 70,
      //   title: Center(
      //     child: Padding(
      //       padding: const EdgeInsets.only(right:50.0),
      //       child: Text(
      //         Strings.login,
      //         textAlign: TextAlign.right,
      //         style:TextStyle(
      //           
      //           fontWeight: FontWeight.bold,
      //           fontSize: 20,
      //         ),
      //       ),
      //     ),
      //   ),
      //
      //
      // ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              color: Colors.white,
              // padding: EdgeInsets.all(16),
              height: height,

              child: SafeArea(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(
                        flex: 2,
                        child: Container(
                            margin: EdgeInsets.all(8),
                            child: Image.asset('assets/img/doctorlogin.png', fit: BoxFit.contain,))),
                    Expanded(
                        flex:1,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:  [
                            const Center(
                              child: Text("Di-Med-Care", style: TextStyle(fontSize: 26),),
                            ),
                            Container(
                                height:20,
                                child: Image.asset('assets/img/logo.png', fit: BoxFit.contain,))
                          ],
                        )
                    ),
                    Expanded(
                      flex: 4,
                      child: Container(
                        margin: EdgeInsets.only(top: 0),

                        decoration: const BoxDecoration(
                          color: Colors.white,

                          // border: Border.all(color:Colors.black, width: 2),
                          // borderRadius: BorderRadius.all(Radius.circular(8)),


                        ),

                        child: Form(child:
                        Padding(
                          padding: const EdgeInsets.all(25.0),

                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                            children: [
                              TextFormField(
                                controller: _mailController,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.mail_sharp,
                                    color: Colors.black,
                                  ),
                                  contentPadding: EdgeInsets.all(16),
                                  filled: true,
                                  fillColor: Colors.grey.shade100,
                                  hintText: Strings.email,
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black)),
                                  floatingLabelBehavior:
                                  FloatingLabelBehavior.auto,
                                ),


                              ),

                              const SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                controller: _passController,
                                obscureText: true,
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(
                                    Icons.lock,
                                    color: Colors.black,
                                  ),
                                  contentPadding: EdgeInsets.all(16),
                                  filled: true,
                                  fillColor: Colors.grey.shade100,
                                  hintText: Strings.password,
                                  enabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black)),
                                  focusedBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black)),
                                  floatingLabelBehavior:
                                  FloatingLabelBehavior.auto,
                                ),


                              ),

                              SizedBox(
                                height: 25,
                              ),


                              ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all<Color>(Colors.blue.shade900),
                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(8.0),

                                        )
                                    )
                                ),
                                onPressed: ()async{
                                  await signin();
                                },
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    Strings.login,
                                    textAlign: TextAlign.right,
                                    style:TextStyle(
                                      color: Colors.white,
                                      
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),),



                            ],

                          ),

                        ),



                        ),
                      ),
                    ),

                    Expanded(
                      flex: 1,
                      child: Container(
                        margin: EdgeInsets.only(top: 8),
                        child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,

                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(2.0),
                                  child: Text(
                                    Strings.no_account,
                                    style: TextStyle(
                                      fontSize: 16,
                                      

                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(0),
                                  child: TextButton(
                                    onPressed: () {

                                      Navigator.pushReplacementNamed(context, SignupScreen.id);


                                    },
                                    child: const Text(
                                      Strings.signup,
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 16,
                                        

                                      ),
                                    ),
                                  ),
                                )
                              ],

                            )),

                      ),
                    ),


                  ],
                ),
              ),



            ),
          ),
        ],
      ),
    );
  }


   signin()async {

    final auth = FirebaseAuth.instance;
  final database=FirebaseFirestore.instance;
    String username=_register_by=="email"?_mailController.text:_phoneController.text;

    String password=_passController.text;

    try {

      final user = await auth.signInWithEmailAndPassword(
          email: username, password: password);

      if (user != null) {


        SharedPreferences prefs = await SharedPreferences.getInstance();
        var data= await prefs.setString("register",user.user!.uid.toString());
       var dataStream= await database.collection(Keys.CLIENT_DB).get();




       var snapshot=dataStream.docs.firstWhere((element) => element.get("token").toString()==user.user!.uid.toString());

        print(dataStream.docs.first.id);


        Client client= Client(name: snapshot.get("name").toString(), token: user.user!.uid.toString());


        print("Sign in successful");


        Navigator.pushReplacementNamed(context, DashboardView.id);

      }
    }catch(e){
      print(e);
    }


  }


}
