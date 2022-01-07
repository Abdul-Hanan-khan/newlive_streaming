import 'package:flutter/material.dart';
import 'package:newlive_streaming/widget/Buttons.dart';


class FirstScreen extends StatefulWidget {
  const FirstScreen({Key key}) : super(key: key);

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.black,
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   elevation: 1,
      // ),
      body:Container(
        padding: EdgeInsets.only(top: 30),
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(

          image:  DecorationImage(
            colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstATop),
            image: AssetImage('assets/icons/screenBack.PNG'),
            fit: BoxFit.fill,

          ),
         color:   Colors.black.withOpacity(0.5)
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height*0.3,
                width: MediaQuery.of(context).size.width,
               child: Image.asset("assets/icons/appicon.png",height: 160,width: 160,),
              ),
              Container(
                height: MediaQuery.of(context).size.height*0.2,
                width: MediaQuery.of(context).size.width,
                child:Center(
                  child: RichText
                    (text: TextSpan(
              text: " No ",
                    style: TextStyle(
                        fontSize: 35,fontWeight: FontWeight.w800,
                        fontStyle: FontStyle.normal,color: Colors.white),
                    children: [
                      TextSpan(text: "Risk,\n",style:TextStyle(
                          fontSize: 35,fontWeight: FontWeight.w800,
                          fontStyle: FontStyle.normal,color:Color(0xffff00ff))   ),
                      TextSpan(text: "All ",style:TextStyle(
                          fontSize: 35,fontWeight: FontWeight.w800,
                          fontStyle: FontStyle.normal,color:Colors.white)   ),
                      TextSpan(text: "Rewards",style:TextStyle(
                          fontSize: 35,fontWeight: FontWeight.w800,
                          fontStyle: FontStyle.normal,color:Color(0xffff00ff))   ),
                    ]
              )
                  ),
                )
              ),
              Container(
                height: MediaQuery.of(context).size.height*0.2,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Text( "Get insstant,anywhere access",style:TextStyle(
                    fontSize: 22,fontWeight: FontWeight.w800,
                    fontStyle: FontStyle.normal,color:Colors.white)),
                    Text( "To Forex training and live streaming",style:TextStyle(
                        fontSize: 22,fontWeight: FontWeight.w800,
                        fontStyle: FontStyle.normal,color:Colors.white)),
                    Text( "With Cabana group",style:TextStyle(
                        fontSize: 22,fontWeight: FontWeight.w800,
                        fontStyle: FontStyle.normal,color:Colors.white)),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height*0.3,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: buttonsimple(Colors.cyanAccent, "Sign Up Free",context,),
                    ),

                    Padding(
                      padding: EdgeInsets.all(10),
                      child: buttonsimple(Colors.white, "Sign In",context),
                    ),
                  ],
                ),
              ),
             // Expanded(child: child)
            ],
          ),
        ),
      ) ,
    );
  }
}
