



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../DatabaseUtils/keys.dart';
import '../Utils/CustomColors.dart';
import '../Utils/Strings.dart';
import '../Validator/EmailValidator.dart';
import '../Validator/PasswordValidator.dart';
import 'CelebrateScreen.dart';
import 'LoginScreen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  static String id="signup";


  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {


  String _register_by="email";

  TextEditingController _nameController=new TextEditingController();
  TextEditingController _mailController=new TextEditingController();
  TextEditingController _phoneController=new TextEditingController();
  TextEditingController _passController=new TextEditingController();
  TextEditingController _confirmPassController=new TextEditingController();

  final auth=FirebaseAuth.instance;
  final firestore= FirebaseFirestore.instance;


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;


    return buildPage(height : height);
  }



  Widget buildPage({required double height}) {
    return Scaffold(
      // appBar: AppBar(
      //   leading: Icon(
      //     Icons.arrow_back_ios,
      //     color: CustomColors.blueBg,
      //
      //   ),
      //   backgroundColor: Colors.black,
      //   toolbarHeight: 70,
      //   title: const Center(
      //     child: Padding(
      //       padding: EdgeInsets.only(right:50.0),
      //       child: Text(
      //         Strings.signup,
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
                            child: Image.asset('assets/img/doctorfemale.png', fit: BoxFit.contain,))),
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
                      flex: 6,
                      child: Container(
                        margin: EdgeInsets.only(top: 8),

                        decoration: const BoxDecoration(
                          color: Colors.white,

                          // border: Border.all(color:Colors.black, width: 2),
                          // borderRadius: BorderRadius.all(Radius.circular(8)),


                        ),

                        child:
                        Form(child:
                        Padding(
                          padding: const EdgeInsets.all(25.0),

                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,


                            children: [
                              TextFormField(
                                controller: _nameController,
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(
                                    Icons.account_circle_sharp,
                                    color: Colors.black,
                                  ),
                                  contentPadding: EdgeInsets.all(16),
                                  filled: true,
                                  fillColor: Colors.grey.shade100,
                                  hintText: "Name",
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
                                height: 20,
                              ),

                             TextFormField(
                                validator: EmailValidator.validate,
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


                              ) ,





                              const SizedBox(
                                height: 20,
                              ),

                              TextFormField(
                                validator: PasswordValidator.validate,
                                obscureText: true,
                                controller: _passController,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.lock,
                                    color: Colors.black,
                                  ),
                                  contentPadding: EdgeInsets.all(16),
                                  filled: true,
                                  fillColor: Colors.grey.shade100,
                                  hintText: Strings.password,
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
                                obscureText: true,

                                controller: _confirmPassController,

                                decoration: InputDecoration(
                                  prefixIcon: const Icon(
                                    Icons.lock,
                                    color: Colors.black,
                                  ),
                                  contentPadding: EdgeInsets.all(16),
                                  filled: true,
                                  fillColor: Colors.grey.shade100,
                                  hintText: "confirm password",
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

                              const SizedBox(
                                height: 20,
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
                                  print("pressed on signup");
                                  await signup();

                                },
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    Strings.signup,
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
                      // flex: 1,
                      child: Container(
                        margin: EdgeInsets.only(top: 8),
                        child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,

                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(2.0),
                                  child: Text(
                                    Strings.already_account,
                                    style: TextStyle(
                                      fontSize: 16,


                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(0),
                                  child: TextButton(
                                    onPressed: () {

                                      Navigator.pushReplacementNamed(context, LoginScreen.id);



                                    },
                                    child: Text(
                                      Strings.login,
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

   signup()async {


       String username=_register_by=="email"?_mailController.text:_phoneController.text;

       String password = _passController.text;
        if(_register_by=="email" && _passController.text.toString()==_confirmPassController.text.toString()) {

          try {


            final user = await auth.createUserWithEmailAndPassword(
                email: username, password: password);
            

            if (user.user != null) {



             await firestore.collection(Keys.CLIENT_DB).add({

                Keys.CLIENT_NAME:_nameController.text,
                // Keys.CLIENT_PHONE :_phoneController.text,
               Keys.CLIENT_TOKEN:user.user!.uid,

              });

             SharedPreferences prefs = await SharedPreferences.getInstance();
             var data= await prefs.setString("register",user.user!.uid.toString());

              Navigator.pushReplacementNamed(context, CelebrateScreen.id);
            }
              
          }catch(e){
            print(e);
          }
        }else{
          print("passwords doesn't match");
        }
    // var response=await AuthRepository().getSignupResponse(name: _nameController.text,

    //     password: _passController.text,
    //     register_by: _register_by);
    //
    // print("Response : ${response.status}");

  }


}
