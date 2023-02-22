

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gppsupporters/View/DashboardView.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Model/Client.dart';
import 'View/LoginScreen.dart';


class SplashScreen extends StatefulWidget {

  Widget screen;
   SplashScreen({Key? key,required this.screen}) : super(key: key);
  static String id="splash";


  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin  {


  late AnimationController _animationController;
  String? registered;
  @override
  void initState() {
    super.initState();



  }




  Widget chooseScreen(){

    return registered==null?const LoginScreen():const DashboardView();
  }
  @override
  void dispose() {

    super.dispose();
  }

  Duration get transitionDuration => const Duration(milliseconds: 1000);

  @override
  Widget build(BuildContext context) {

    return AnimatedSplashScreen(
        centered: true,
        backgroundColor:Colors.white,
        splash: SizedBox(
          // height: 1000,
          // width: 1000,
          child: Image.asset('assets/img/logo.png',fit: BoxFit.contain,),
        ),
        nextScreen:  widget.screen,

      splashTransition: SplashTransition.slideTransition,
      // backgroundColor: Colors.blueGrey.shade900,
      splashIconSize: 500,

    );

  }


}
