import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:newlive_streaming/variables.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  var nameEditingController;
  var phoneNoControler;
  var emailControler;
  var headlineControlser;
  var currentpositionControler;
  var educationControler;
  var countryControler;
  var locationControler;
  var industryControler;
  bool isEnabled=true;
  bool checksave=false;
  bool isLoading= false;
  bool v=false;
  File _image;
   String fileImageAsString;
   Uint8List bytes;
  initState(){
    setState(() {

      bytes=base64Decode(Variables.imgStr);

      nameEditingController=new TextEditingController(text: "${Variables.name}");
      phoneNoControler=new TextEditingController(text: "${Variables.phone}");
      emailControler=new TextEditingController(text: "${Variables.email}");
      headlineControlser=new TextEditingController(text: "${Variables.Headline}");
      currentpositionControler=new TextEditingController(text: "${Variables.position}");
      educationControler=new TextEditingController(text: "${Variables.Education}");
      countryControler=new TextEditingController(text: "${Variables.Country}");
      locationControler=new TextEditingController(text: "${Variables.location}");
      industryControler=new TextEditingController(text: "${Variables.industry}");
    });
  }



  Future getImagefromGallery() async {
    var picker=ImagePicker();
    var image = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      _image = File(image.path) ;
    });

    List<int> imageBase64 = _image.readAsBytesSync();
     fileImageAsString = base64Encode(imageBase64);
    updateUserImage().then((value)  {
      setState(() { });
    });

  }

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
        resizeToAvoidBottomInset: false,
        backgroundColor:Colors.black,
        body:Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
        image:  DecorationImage(
        colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstATop),
    image: AssetImage('assets/icons/screenBack.PNG'),
    fit: BoxFit.fill,

    ),
    ),
          child: Container(
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.only(top: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(Icons.arrow_back,color: Colors.white,size: 30,),
                            ),
                           isLoading?CircularProgressIndicator(): GestureDetector(
                              onTap: (){
                                getImagefromGallery();
                              },
                              child: CircleAvatar(
                                radius: 45,
                                backgroundColor: Color(0xffffffff),
                                child:CircleAvatar(
                                radius: 45,
                                backgroundColor: Colors.white,
                                backgroundImage: MemoryImage(bytes),

                              ),
                              ),
                            ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: checksave?IconButton(
                          onPressed: (){
                            // scaffoldKey.currentState!.showSnackBar(SnackBar(
                            //     content: const Text("Data Updated Succesfully",style: TextStyle(color: Colors.white,fontSize: 18),),
                            //   duration: Duration(seconds: 5),
                            // ));
                            updateUserData().then((value) => Get.snackbar('Success', 'message',messageText: Text('Profile Updated',style: TextStyle(
                              color: Colors.deepOrangeAccent
                            ),)));

                            setState(() {
                              checksave=false;
                              v=false;
                            });
                          },
                          icon: Icon(Icons.check,color: Colors.white,size: 30,),
                        ):null,
                      ),
                    ),


                          ],
                        ),
                // Padding(
                //     padding: const EdgeInsets.only(top: 20.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                       // crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(),
                          Text("${Variables.email}",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w900,color: Colors.white),),
                          SizedBox(width: 30,),
                          InkWell(
                              onTap: (){
                                setState(() {
                                  v=true;
                                  checksave=true;
                                });
                              },
                              child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text("Edit",style: TextStyle(color: Colors.purple,))))
                        ],
                      )
                   // ),
                      ],
                    ),
                  ),
                ),
               Expanded(
                 flex: 3,
                 child: SingleChildScrollView(
                   child: Padding(
                     padding: const EdgeInsets.only(left: 20.0),
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.start,
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Text("Name:",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700,color: Colors.white),),

                TextField(
                  controller: nameEditingController,
                  onChanged: (val){
                      setState(() {
                      });
                  },
                  style: TextStyle(color: Colors.white),
                  enabled: v,
                ),
                SizedBox(height: 20,),
                     Text("Phone No:",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700,color: Colors.white),),

                TextField(
                  controller: phoneNoControler,
                  onChanged: (val){
                      setState(() {
                      });
                  },

                  style: TextStyle(color: Colors.white),
                  //   obscureText: !passswordvisible,
                  enabled: v,

                ),
               Text("E-mail:",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700,color: Colors.white),),

                TextField(
                  controller: emailControler,
                  onChanged: (val){
                      setState(() {
                      });
                  },
                  style: TextStyle(color: Colors.white),
                  //   obscureText: !passswordvisible,
                  enabled: v,

                ),
                SizedBox(height: 20,),
                Text("Headline:",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700,color: Colors.white),),

                TextField(
                  controller: headlineControlser,
                  onChanged: (val){
                      setState(() {
                      });
                  },

                  style: TextStyle(color: Colors.white),
                  //   obscureText: !passswordvisible,
                  enabled: v,

                ),
                SizedBox(height: 20,),
               Text("Current position:",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700,color: Colors.white),),

                TextField(
                  controller: currentpositionControler,
                  onChanged: (val){
                      setState(() {
                      });
                  },

                  style: TextStyle(color: Colors.white),
                  //   obscureText: !passswordvisible,
                  enabled: v,

                ),
                SizedBox(height: 20,),
               Text("Education:",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700,color: Colors.white),),

                TextField(
                  controller: educationControler,
                  onChanged: (val){
                      setState(() {
                      });
                  },

                  style: TextStyle(color: Colors.white),
                  //   obscureText: !passswordvisible,
                  enabled: v,

                ),
                SizedBox(height: 20,),
                Text("Country:",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700,color: Colors.white),),

                TextField(
                  controller: countryControler,
                  onChanged: (val){
                      setState(() {
                      });
                  },

                  style: TextStyle(color: Colors.white),
                  //   obscureText: !passswordvisible,
                  enabled: v,

                ),
                SizedBox(height: 20,),
                Text("Current Location:",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700,color: Colors.white),),

                TextField(
                  controller: locationControler,
                  onChanged: (val){
                      setState(() {
                      });
                  },

                  style: TextStyle(color: Colors.white),
                  //   obscureText: !passswordvisible,
                  enabled: v,

                ),
                SizedBox(height: 20,),
                Text("Industry:",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700,color: Colors.white),),

                TextField(
                  controller: industryControler,
                  onChanged: (val){
                      setState(() {
                      });
                  },

                  style: TextStyle(color: Colors.white),
                  //   obscureText: !passswordvisible,
                  enabled: v,

                ),
                       ],
                     ),
                   ),
                 ),


               )
             //   ),
              ],
            ),
          ),
    )
    );
  }
  Future updateUserData() async {
    // await FlutterSession().get("userId").then((value) {
    //   print(value.toString());
    //   userRef.doc(value.toString()).update({
    //     "FirstName": firstNameController.text,
    //     "LastName": lastNameController.text,
    //     "Password": passwordController.text,
    //     "Phone No": phoneNoController.text,
    //   });
    // });

    await FirebaseFirestore.instance.collection('User').doc(Variables.email).update(
      {
        'name':nameEditingController.text.trim(),
        'email':emailControler.text.trim(),
        'phone':phoneNoControler.text.trim(),
        'Headline': headlineControlser.text.trim(),
        'position':currentpositionControler.text.trim(),
        'Education':educationControler.text.trim(),
        'Country':countryControler.text.trim(),
        'location':locationControler.text.trim(),
        'industry':industryControler.text.trim(),
        'onlineStatus':'online',
      }
    );

    Variables.name=nameEditingController.text.trim();
    Variables.email=emailControler.text.trim();
    Variables.phone=phoneNoControler.text.trim();
    Variables.Headline=headlineControlser.text.trim();
    Variables.position=currentpositionControler.text.trim();
    Variables.Country=countryControler.text.trim();
    Variables.location=locationControler.text.trim();
    Variables.industry=industryControler.text.trim();
  }
  Future updateUserImage() async {
    setState(() {
      isLoading=true;
    });
    await FirebaseFirestore.instance.collection('User').doc(Variables.email).update(
      {
        'imgStr':fileImageAsString,
      }
    );
    Variables.imgStr=fileImageAsString;
    setState(() {
      bytes=base64Decode(fileImageAsString);
      isLoading=false;

    });
  }
}
