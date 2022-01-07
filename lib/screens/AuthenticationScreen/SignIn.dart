import 'dart:convert';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:get/get.dart';
import 'package:newlive_streaming/screens/AuthenticationScreen/facebookLogin/login_with_facebook.dart';
import 'package:newlive_streaming/screens/HomeScreen/HomeTabe.dart';
import 'package:newlive_streaming/widget/contant.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../variables.dart';
import 'SignUp.dart';
class SignIn extends StatefulWidget {
  //const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<SignIn> {
  bool islogin=false;
  // Future<UserCredential> signInWithFacebook() async {
  //   // Trigger the sign-in flow
  //   final LoginResult loginResult = await FacebookAuth.instance.login();
  //   // Create a credential from the access token
  //   final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);
  //   // Once signed in, return the UserCredential
  //   return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  // }
 // final FirebaseAuth auth = FirebaseAuth.instance;
  bool isPhone=true;
  bool checkedValue=false;
  bool isEnabled=false;
  bool isLoading =false;
   String otpToken;
   String phone;
   String error;
 // bool namevalidate=false;
  bool emailvalidate=false;
  bool passwordvalidate=false;
  bool confirmpassvalidate=false;
 // bool phonevalidate=false;
  bool passswordvisible=false;
 // bool cpassswordvisible=false;
//  TextEditingController name=TextEditingController();
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController passEditingController = TextEditingController();
 // TextEditingController conpassEditingController = TextEditingController();
//  TextEditingController phoneEditingController = TextEditingController();
   bool _success;
   String _userEmail;
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp
    ]);
  }
  void dispose() {
    emailEditingController.dispose();
    passEditingController.dispose();
  //  phoneEditingController.dispose();

    super.dispose();
  }
  // final databaseRef = FirebaseDatabase.instance.reference();//database reference object

  // void addData(String name,String email) {
  //   databaseRef.push().set({'name': name, 'comment': email});
  // }
  String btnText="Request OTP";
  @override
  Widget build(BuildContext context) {
    var h=MediaQuery.of(context).size.height;
    var w=MediaQuery.of(context).size.width;
    GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return  Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            color:  Colors.black,
            image:  DecorationImage(
              colorFilter:
              ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstATop),
              image: AssetImage('assets/icons/screenBack.PNG'),
              fit: BoxFit.fill,

            ),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: h*0.045,),
                  // SizedBox(height: h*0.07,),
                  //   isPhone?

                  Center(child: Image(image: AssetImage('assets/icons/appicon.png'),height: 90,width: 90,)),
                  SizedBox(height: 20,),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 52,
                    decoration: BoxDecoration(
                      color:Color(0xffF7F6FB),

                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: (){
                            if(isPhone==true){
                              setState(() {
                                btnText="Sign In";
                                isPhone=false;
                              });
                            }
                            else{
                              setState(() {
                                btnText="Request OTP";
                                isPhone=true;
                              });
                            }
                          },
                          child: Container(
                            height: 44,
                            width: MediaQuery.of(context).size.width*0.4,
                            decoration: BoxDecoration(
                              color:isPhone?  Color(0xffffffff):Color(0xffF7F6FB),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Text('Social',style: TextStyle(color: Color(0xff3D4864),
                                  fontWeight: FontWeight.w600),),
                            ),
                          ),
                        ),
                        SizedBox(width: 20,),
                        GestureDetector(
                          onTap: (){
                            if(isPhone==false){
                              setState(() {
                                btnText="Request OTP";
                                isPhone=true;
                              });
                            }
                            else{
                              setState(() {
                                btnText="Sign In";
                                isPhone=false;
                              });
                            }
                          },
                          child: Container(
                            height: 44,
                            width: MediaQuery.of(context).size.width*0.4,
                            decoration: BoxDecoration(
                              color:isPhone?  Color(0xffF7F6FB):Color(0xffffffff),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Text('Email',style: TextStyle(color: Color(0xff3D4864),
                                  fontWeight: FontWeight.w600),),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                  SizedBox(height: 5,),
                  isPhone?Container()  : Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: Container(
                      //  height: h*0.08,
                      child: TextField(
                        keyboardType: TextInputType.emailAddress,
                        controller: emailEditingController,
                        style: TextStyle(color: Color(0xff3D4864)),
                        decoration: InputDecoration(
                            fillColor: Color(0xFFFFFFFF),
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(14.0),
                                borderSide: new BorderSide(color: Color(0xff3D4864))
                            ),
                            enabledBorder:  OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14),
                              borderSide:  BorderSide(color: Color(0xff3D4864), width: 0.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14),
                              borderSide:  BorderSide(color: Color(0xff3D4864), width: 0.0),
                            ),
                            hintText: 'Email*',
                            hintStyle: TextStyle(color: Color(0xff3D4864)),
                            errorText: emailvalidate?"email Required*":null
                        ),
                      ),
                    ),
                  ),


                  isPhone? Container():Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: Container(
                      //  height: h*0.08,
                      child: TextField(

                        controller: passEditingController,
                        onChanged: (val){
                          setState(() {
                            isEnabled=true;
                          });
                        },
                        style: TextStyle(color: Color(0xff202D50)),
                        obscureText: !passswordvisible,
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                              onPressed: (){
                                setState(() {
                                  passswordvisible=!passswordvisible;
                                });

                              },
                              icon:Icon( passswordvisible?Icons.visibility:Icons.visibility_off,color: Theme.of(context).primaryColorDark,),
                            ),
                            fillColor: Color(0xFFFFFFFF),
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(14.0),
                                borderSide: new BorderSide(color: Color(0xff3D4864))
                            ),
                            enabledBorder:  OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14),
                              borderSide:  BorderSide(color:Color(0xff3D4864), width: 0.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14),
                              borderSide:  BorderSide(color: Color(0xff3D4864), width: 0.0),
                            ),
                            hintText: 'Password',
                            hintStyle: TextStyle(color: Color(0xff3D4864)),
                            errorText:passwordvalidate? "Password not match":null
                        ),
                      ),
                    ),
                  ),
                  // isPhone? Container():Padding(
                  //   padding: const EdgeInsets.only(top: 12.0),
                  //   child: Container(
                  //     //  height: h*0.08,
                  //     child: TextField(
                  //       controller: conpassEditingController,
                  //       onChanged: (val){
                  //         setState(() {
                  //           isEnabled=true;
                  //         });
                  //       },
                  //       style: TextStyle(color: Color(0xff202D50)),
                  //       obscureText: !cpassswordvisible,
                  //       decoration: InputDecoration(
                  //           fillColor: Color(0xFFFFFFFF),
                  //           filled: true,
                  //           border: OutlineInputBorder(
                  //               borderRadius: BorderRadius.circular(14.0),
                  //               borderSide: new BorderSide(color: Color(0xff3D4864))
                  //           ),
                  //           enabledBorder:  OutlineInputBorder(
                  //             borderRadius: BorderRadius.circular(14),
                  //             borderSide:  BorderSide(color:Color(0xff3D4864), width: 0.0),
                  //           ),
                  //           focusedBorder: OutlineInputBorder(
                  //             borderRadius: BorderRadius.circular(14),
                  //             borderSide:  BorderSide(color: Color(0xff3D4864), width: 0.0),
                  //           ),
                  //           suffixIcon: IconButton(
                  //             onPressed: (){
                  //               setState(() {
                  //                 cpassswordvisible=!cpassswordvisible;
                  //               });
                  //
                  //             },
                  //             icon:Icon( cpassswordvisible?Icons.visibility:Icons.visibility_off,color: Theme.of(context).primaryColorDark,),
                  //           ),
                  //           hintText: 'Confirm Password',
                  //           hintStyle: TextStyle(color: Color(0xff3D4864)),
                  //           errorText: confirmpassvalidate?"password not match":null
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // Theme(
                  //   data: ThemeData(unselectedWidgetColor: Colors.white),
                  //   child: CheckboxListTile(
                  //     title: Text("remember me",style: TextStyle(color: Colors.white),),
                  //     value: checkedValue,
                  //     activeColor: Colors.grey,
                  //     onChanged: (newValue) {
                  //       setState(() {
                  //         checkedValue = newValue;
                  //       });
                  //     },
                  //     controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
                  //   ),
                  // ),
                  SizedBox(height: 20,),
                  // isPhone? Container():
                  // Align(
                  //   alignment: Alignment.centerRight,
                  //   child: GestureDetector(
                  //       onTap: (){},
                  //       child: Text(' forgot password',style: TextStyle(fontWeight: FontWeight.w400,color: Color(0xff6EC350),fontSize: 16,decoration: TextDecoration.underline,),)),
                  // ),
                  isPhone?Container(): isLoading?CircularProgressIndicator():  GestureDetector(
                    onTap: () async{

                      //login();
                      if(isPhone==true) {
                        setState(() {isLoading=true;
                          // phoneEditingController.text.isEmpty?phonevalidate=true:phonevalidate=false;
                          // name.text.isEmpty?namevalidate=true:namevalidate=false;

                        }
                        );
                        // if(phoneEditingController.text.isNotEmpty && name.text.isNotEmpty) {
                        //   // Navigator.pushReplacement(
                        //   //     context,
                        //   //     MaterialPageRoute(builder: (context) =>
                        //   //         OtpScreen(username:name.text,phoneNumber: phoneEditingController.text,))
                        //   // );
                        // }
                      }
                      else {
                        setState(() {
                          isLoading=true;
                          emailEditingController.text.isEmpty ? emailvalidate =
                          true : emailvalidate = false;
                          passEditingController.text.isEmpty ?
                          passwordvalidate = true : passwordvalidate = false;
                          false;

                          // phoneEditingController.text.isEmpty ? phonevalidate =
                          // true : phonevalidate = false;
                        });
                        if (emailEditingController.text.isNotEmpty &&
                            passEditingController.text.isNotEmpty ) {
                            authController.login(emailEditingController.text.trim(),
                                                  passEditingController.text.trim());
                            userLogin();


                         //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeTab()));
                          //_register();
                          // if(_userEmail.isNotEmpty)
                          //   {
                          //     addData(name.text, _userEmail);
                          //   }
                          // print(_success==null?'':(_success?"Successflly register"+_userEmail:"registeration faild"));
                          // if(_userEmail.isEmpty)
                          // {
                          //
                          // }
                          // else {
                          //   // Navigator.push(
                          //   //
                          //   //     context,
                          //   //     MaterialPageRoute(builder: (context) =>
                          //   //         DoorSelection())
                          //   //
                          //   // );
                          // }
                        }
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 12.0),
                      child: Container(
                        height: h*0.08,
                        decoration: BoxDecoration(
                          color:Color(0xff007360),

                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(btnText,style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w600),),
                        ),
                      ),
                    ),
                  ),

             //     SizedBox(height: 30,),
                  isPhone?   RaisedButton(
                    elevation: 5.0,
                    onPressed: () async
                    {
                      authController.signinwithgoogle();
                      // signInWithGoogle().then((value) => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>
                      // DoorSelection())));
                      // if(_key1.currentState.validate() && _key2.currentState.validate()){
                      //   databaseLogin();
                      // }
                    },
                    padding: EdgeInsets.all(15.0),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    color: Colors.white,
                    child:
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children:[
                          Image.asset("assets/icons/icons_google.png",width: 24,height: 24,),
                          SizedBox(width: 20,),
                          Text("Continue with Google",style: TextStyle(color: Colors.black,fontSize: 14,
                              fontWeight: FontWeight.w600),),
                        ]),
                  ):Container(),
                  SizedBox(height: 10,),
                  isPhone? RaisedButton(
                    elevation: 5.0,
                    onPressed: ()
                    {
                      // if(_key1.currentState.validate() && _key2.currentState.validate()){
                      //   databaseLogin();
                      // }
                      //signInWithApple();
                    },
                    padding: EdgeInsets.all(15.0),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    color: Colors.white,
                    child:
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children:[
                          Image.asset("assets/icons/Apple.png",width: 24,height: 24,),
                          SizedBox(width: 20,),
                          Text("Continue with Apple",style: TextStyle(color: Colors.black,fontSize: 14,
                              fontWeight: FontWeight.w600),),
                        ]),
                  ):Container(),
                  SizedBox(height: 10,),
                  isPhone? RaisedButton(
                    elevation: 5.0,
                    onPressed: ()
                    {
                      //signInWithFacebook();

                      Get.to(LoginWithFacebook());
                      // if(_key1.currentState.validate() && _key2.currentState.validate()){
                      //   databaseLogin();
                      // }
                      //signInWithApple();
                    },
                    padding: EdgeInsets.only(bottom:15,top:15.0,left: 15,right: 15),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    color: Colors.white,
                    child:
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children:[
                          Image.asset("assets/icons/facebook.png",width: 24,height: 24,),
                          SizedBox(width: 20,),
                          Text("Continue with FaceBook",style: TextStyle(color: Colors.black,fontSize: 14,
                              fontWeight: FontWeight.w600),),
                        ]),
                  ):Container(),
                  SizedBox(height: 10,),

                  isPhone? Container():  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: InkWell(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SignUp()),
                          );
                        },
                        child: RichText(text: TextSpan(
                            text: "New User?",
                            style: TextStyle(
                                fontSize: 11,fontWeight: FontWeight.w900,
                                fontStyle: FontStyle.normal,color: Color(0xa8cec8c8)),
                            children: [
                              TextSpan(text: " Create new Account",style:TextStyle(
                                  fontSize: 11,fontWeight: FontWeight.w900,
                                  fontStyle: FontStyle.normal,color: Colors.blue)   ),
                            ]
                        )     ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child:InkWell(
                      onTap: (){},
                      child: RichText(text: TextSpan(
                          text: "Login means you agree",
                          style: TextStyle(
                              fontSize: 14,fontWeight: FontWeight.w600,
                              fontStyle: FontStyle.normal,color: Color(0xffffffff)),
                          children: [
                            TextSpan(text: " Term of use,Privicy Policy",style:TextStyle(
                                fontSize: 14,fontWeight: FontWeight.w600,
                                fontStyle: FontStyle.normal,color: Color(0xffff00ff))   ),
                          ]
                      )     ),
                    ),
                  ),


                ],
              ),
            ),
          ),
        )
    );
  }
  Future userLogin() async {
    SharedPreferences prefs= await SharedPreferences.getInstance();
    await FirebaseFirestore.instance
        .collection("User")
        .where('email', isEqualTo: emailEditingController.text)
        .where('password', isEqualTo: passEditingController.text)
        .get()
        .then((value) {
      if (value.docs.length > 0) {
        {
          prefs.setString('userId',value.docs[0].id);
      prefs.setString('email', emailEditingController.text);
          Variables.userLoggedIn=emailEditingController.text;
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => HomeTab()));
        }
      } else {
        showDialog(
            barrierColor: Colors.red[100],
            context: context,
            builder: (context) {
              return Container(
                decoration:
                BoxDecoration(border: Border.all(color: Colors.amber)),
                child: AlertDialog(
                  title: Text(
                    "Error !",
                    style: TextStyle(color: Colors.red),
                  ),
                  content: Text("Invalid Login"),
                  backgroundColor: Colors.grey[300],
                  actions: [
                    FlatButton(
                        onPressed: () {
                          setState(() {
                            isLoading = false;
                          });
                          Navigator.pop(context);
                        },
                        child: Text("ok")),
                  ],
                ),
              );
            });
      }
    });
  }
}
