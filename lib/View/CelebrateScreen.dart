

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Utils/CustomColors.dart';
import 'LoginScreen.dart';
import 'SignupScreen.dart';

class CelebrateScreen extends StatefulWidget {
  const CelebrateScreen({Key? key}) : super(key: key);
  static String id="celebrate";

  @override
  _CelebrateScreenState createState() => _CelebrateScreenState();
}

class _CelebrateScreenState extends State<CelebrateScreen> {
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
      //   // leading: Icon(
      //   //   Icons.arrow_back_ios,
      //   //   color: CustomColors.blueBg,
      //   //
      //   // ),
      //   backgroundColor: Colors.black,
      //   toolbarHeight: 70,
      //   title: Center(
      //     child: Padding(
      //       padding: const EdgeInsets.only(right:0.0),
      //       child: Text(
      //         "Congratulations!",
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
              height: height,

              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[

                  Expanded(
                      flex:4,
                      child: Image.asset("assets/img/bg.png", fit: BoxFit.fitWidth,)),

                  Expanded(
                    flex: 5,
                    child: Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,

                        // borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      // margin: EdgeInsets.only(top: 20),

                      child: Center(

                          child:
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            mainAxisSize: MainAxisSize.max,
                            children: [

                                 Text("Di-Med Care is ready!",

                                style: TextStyle(
                                  color: CustomColors.blueBg,
                            // fontWeight: FontWeight.bold,
                              fontSize: 24,
                              fontFamily: "urdu"
                              ),),
                          Container(
                              height: 50,
                              child: Image.asset("assets/img/doctorlogin.png", fit: BoxFit.fitHeight,)),
                              const Text("Let's Go",
                                textAlign: TextAlign.center,
                                style: TextStyle(

                                  fontFamily: "urdu",
                                  color: Colors.black,
                                  // fontWeight: FontWeight.bold,
                                    fontSize: 20
                                ),),

                              ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all<Color>(CustomColors.blueBg),
                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(8.0),

                                        )
                                    )
                                ),
                                onPressed: ()async{
                                  Navigator.pushReplacementNamed(context, LoginScreen.id);
                                },
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    "Login",
                                    textAlign: TextAlign.right,
                                    style:TextStyle(
                                      color: Colors.white,

                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),),

                            ],
                          )),
                    ),
                  )





                ],
              ),



            ),
          ),
        ],
      ),
    );
  }





}
