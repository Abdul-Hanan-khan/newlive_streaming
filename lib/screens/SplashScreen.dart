import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:newlive_streaming/screens/AuthenticationScreen/FirstScreen.dart';
import 'package:newlive_streaming/screens/AuthenticationScreen/SignIn.dart';
import 'package:newlive_streaming/screens/HomeScreen/HomeTabe.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState(){
    super.initState();
    Timer(Duration(seconds: 3), ()=>
        Navigator.pushReplacement(context,MaterialPageRoute(builder:(context)=>FirstScreen())));
  }
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor:Color((0xffffffff))));
    return  Scaffold(
      body: Container(
        color: Color(0xff000000),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 30,),
              Image.asset("assets/icons/appicon.jpg",height: 160,width: 160,),
              Center(child: Text("Fucc Yea",style:TextStyle(
                  fontSize: 18,fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.normal,color: Color(0xfff2f6f6)) ),)
            ],
          ),
        ),
      ),
    );
  }
}
