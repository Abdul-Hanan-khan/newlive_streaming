// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:live_streaming/TestingModule/AgoraScreen.dart';
// import 'package:live_streaming/TestingModule/BroadCast.dart';
// import 'package:live_streaming/screens/FullScreen.dart';
// import 'package:live_streaming/screens/HomeScreen/TabScreen/New%20Room.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:share_plus/share_plus.dart';
// import 'package:url_launcher/url_launcher.dart';
//
// class AdminMain extends StatefulWidget {
// //  const GoLive({Key? key}) : super(key: key);
//
//   @override
//   _GoLiveState createState() => _GoLiveState();
// }
// enum SocialMedia{facebook,watsapp,twitter,email}
// class _GoLiveState extends State<AdminMain> {
//   final _channelName = TextEditingController();
//   String check = '';
//   int valueHolder = 10;
//   String _platformVersion = 'Unknown';
//   bool isSwitched = false;
//   bool isSwitchedchat = false;
//   var textValue = 'Switch is OFF';
//   void toggleSwitchchat(bool value) {
//
//     if(isSwitchedchat == false)
//     {
//       setState(() {
//         isSwitchedchat = true;
//         textValue = 'Switch Button is ON';
//       });
//       print('Switch Button is ON');
//     }
//     else
//     {
//       setState(() {
//         isSwitchedchat = false;
//         textValue = 'Switch Button is OFF';
//       });
//       print('Switch Button is OFF');
//     }
//   }
//   void toggleSwitch(bool value) {
//
//     if(isSwitched == false)
//     {
//       setState(() {
//         isSwitched = true;
//         textValue = 'Switch Button is ON';
//       });
//       print('Switch Button is ON');
//     }
//     else
//     {
//       setState(() {
//         isSwitched = false;
//         textValue = 'Switch Button is OFF';
//       });
//       print('Switch Button is OFF');
//     }
//   }
//
//   void initState(){
//     super.initState();
//   //  initPlatformState();
//     SystemChrome.setPreferredOrientations([
//       DeviceOrientation.portraitUp,
//       DeviceOrientation.portraitDown,
//     ]);
//   }
//
//  //  Future share(SocialMedia socialMedia) async
//  //  {
//  //    final subject="Nadeem send you invition for attend live room";
//  //    final text="8:30pm i start meting please join it";
//  //    final urlshare=Uri.encodeComponent("http://google.com");
//  //    final urls={
//  //      SocialMedia.twitter:"https://twitter.com/intent/tweet?url=$urlshare",
//  //      SocialMedia.facebook:'https://www.facebook.com/sharer/sharer.php?u=$urlshare'
//  //    };
//  // final url=urls[socialMedia]!;
//  // if(await canLaunch(url)){
//  //   await launch(url);
//  // }
//   //}
//   // openAlertBox() {
//   //   return showDialog(
//   //       context: context,
//   //       builder: (BuildContext context) {
//   //         return AlertDialog(
//   //           shape: RoundedRectangleBorder(
//   //               borderRadius: BorderRadius.all(Radius.circular(32.0))),
//   //           contentPadding: EdgeInsets.only(top: 10.0),
//   //           content: Container(
//   //             width: 300.0,
//   //             child: Column(
//   //               mainAxisAlignment: MainAxisAlignment.start,
//   //               crossAxisAlignment: CrossAxisAlignment.stretch,
//   //               mainAxisSize: MainAxisSize.min,
//   //               children: <Widget>[
//   //                 Row(
//   //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   //                   mainAxisSize: MainAxisSize.min,
//   //                   children: <Widget>[
//   //                     Text(
//   //                       "Send Invition",
//   //                       style: TextStyle(fontSize: 24.0),
//   //                     ),
//   //                     // Row(
//   //                     //   mainAxisSize: MainAxisSize.min,
//   //                     //   children: <Widget>[
//   //                     //     Icon(
//   //                     //       Icons.star_border,
//   //                     //       color: Color(0xff743536),
//   //                     //       size: 30.0,
//   //                     //     ),
//   //                     //     Icon(
//   //                     //       Icons.star_border,
//   //                     //       color: Color(0xff743536),
//   //                     //       size: 30.0,
//   //                     //     ),
//   //                     //     Icon(
//   //                     //       Icons.star_border,
//   //                     //       color: Color(0xff743536),
//   //                     //       size: 30.0,
//   //                     //     ),
//   //                     //     Icon(
//   //                     //       Icons.star_border,
//   //                     //       color: Color(0xff743536),
//   //                     //       size: 30.0,
//   //                     //     ),
//   //                     //     Icon(
//   //                     //       Icons.star_border,
//   //                     //       color: Color(0xff743536),
//   //                     //       size: 30.0,
//   //                     //     ),
//   //                     //   ],
//   //                     // ),
//   //                   ],
//   //                 ),
//   //                 SizedBox(
//   //                   height: 5.0,
//   //                 ),
//   //                 Divider(
//   //                   color: Colors.grey,
//   //                   height: 4.0,
//   //                 ),
//   //                 Padding(
//   //                   padding: EdgeInsets.only(left:5.0, right: 5.0,top: 10,bottom: 10),
//   //                   child: Column(
//   //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//   //                     children:[
//   //                       InkWell(
//   //                         onTap:()async{
//   //                           final urlpreviw=
//   //                           'https://www.facebook.com/';
//   //                           await Share.share("nfbvdbvjh");
//   //                         },
//   //                         child: Row(
//   //                           mainAxisAlignment: MainAxisAlignment.spaceAround,
//   //                           children: [
//   //                             Image(image: NetworkImage(
//   //                                 "https://cdn3.iconfinder.com/data/icons/capsocial-round/500/facebook-512.png"),height: 20,width: 24,)
//   //                           ,Text("Share on Facebook",style: TextStyle(
//   //                               fontSize: 14,
//   //                               fontWeight: FontWeight.w900
//   //                             ),)
//   //                           ],
//   //                         ),
//   //                       ),
//   //                       SizedBox(height: 10,),
//   //                       Padding(
//   //                         padding: const EdgeInsets.only(left: 20,right: 20),
//   //                         child: Container(
//   //                           width: MediaQuery.of(context).size.width*5,
//   //                           height: 1,
//   //                           color: Colors.black26,
//   //                         ),
//   //                       ),
//   //                       SizedBox(height: 10,),
//   //                       Row(
//   //                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//   //                         children: [
//   //                           Image(image: NetworkImage("https://freepngimg.com/download/whatsapp/77079-logo-whatsapp-computer-icons-free-hq-image.png"),
//   //                             height: 20,width: 24,)
//   //                           ,Text("Share on WhatsApp",style: TextStyle(
//   //                               fontSize: 14,
//   //                               fontWeight: FontWeight.w900
//   //                           ),)
//   //                         ],
//   //                       ),
//   //                       SizedBox(height: 10,),
//   //                       Padding(
//   //                         padding: const EdgeInsets.only(left: 20,right: 20),
//   //                         child: Container(
//   //                           width: MediaQuery.of(context).size.width*5,
//   //                           height: 1,
//   //                           color: Colors.black26,
//   //                         ),
//   //                       ),
//   //                       SizedBox(height: 10,),
//   //                       InkWell(
//   //                         onTap: ()=>share(SocialMedia.facebook),
//   //                         child: Row(
//   //                           mainAxisAlignment: MainAxisAlignment.spaceAround,
//   //                           children: [
//   //                             Image(image: NetworkImage
//   //                               ("https://w7.pngwing.com/pngs/239/740/png-transparent-twitter-logo-icon-twitter-file-logo-social-media-news.png"),height: 20,width: 24,)
//   //                             ,Text("Share on Twitter",style: TextStyle(
//   //                                 fontSize: 14,
//   //                                 fontWeight: FontWeight.w900
//   //                             ),)
//   //                           ],
//   //                         ),
//   //                       ),
//   //                       Padding(
//   //                         padding: const EdgeInsets.only(left: 20,right: 20),
//   //                         child: Container(
//   //                           width: MediaQuery.of(context).size.width*5,
//   //                           height: 1,
//   //                           color: Colors.black26,
//   //                         ),
//   //                       ),
//   //                       SizedBox(height: 10,),
//   //                       Row(
//   //                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//   //                         children: [
//   //                           Image(image: NetworkImage(
//   //                               "https://i.pinimg.com/originals/8f/c3/7b/8fc37b74b608a622588fbaa361485f32.png"),height: 20,width: 24,)
//   //                           ,Text("Share on Email",style: TextStyle(
//   //                               fontSize: 14,
//   //                               fontWeight: FontWeight.w900
//   //                           ),)
//   //                         ],
//   //                       ),
//   //                     ]
//   //                   )
//   //                 ),
//   //                 InkWell(
//   //                   child: Container(
//   //                     padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
//   //                     decoration: BoxDecoration(
//   //                       color: Color(0xff743536),
//   //                       borderRadius: BorderRadius.only(
//   //                           bottomLeft: Radius.circular(32.0),
//   //                           bottomRight: Radius.circular(32.0)),
//   //                     ),
//   //                     child: Text(
//   //                       "Rate Product",
//   //                       style: TextStyle(color: Colors.white),
//   //                       textAlign: TextAlign.center,
//   //                     ),
//   //                   ),
//   //                 ),
//   //               ],
//   //             ),
//   //           ),
//   //         );
//   //       });
//   // }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor:Colors.black,
//         body:Container(
//             padding: EdgeInsets.only(top: 10),
//             width: double.infinity,
//             height: double.infinity,
//             decoration: BoxDecoration(
//               image:  DecorationImage(
//                 colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstATop),
//                 image: AssetImage('assets/icons/screenBack.PNG'),
//                 fit: BoxFit.fill,
//
//               ),
//             ),
//             child: Column(
//                 children: [
//                   Expanded(
//                     flex: 1,
//                     child: Container(
//                       height: 160,
//                       color: Colors.black.withOpacity(0.5),
//                       width: MediaQuery.of(context).size.width,
//                       child: Wrap(
//                         children: [
//
//                           Column(
//                               children:[
//
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     CircleAvatar(
//                                         radius: 25,
//                                         backgroundColor: Color(0xffffffff),
//                                         child:CircleAvatar(
//                                           radius: 23,
//                                           backgroundColor: Colors.white,
//                                           backgroundImage:AssetImage("assets/icons/testimage.jpg",),
//                                         )
//                                     ),
//                                     FlatButton(
//                                         color: Colors.white24,
//                                         onPressed: ()async{
//                                           await Share.share('https://www.playstore.com/com.example.live_streaming');
//                                         },
//                                         child: Text('Send Invition',
//                                           style: TextStyle(fontSize: 11,color: Colors.white),)
//                                     ),
//                                   ],
//                                 ),
//                               ]
//
//                           ),
//                         ],
//                       ),
//
//
//                     ),
//                   ),
//                   Expanded(
//                     flex: 5,
//                     child: SingleChildScrollView(
//                       child: Column(
//                         children: [
//
//                           Padding(
//                             padding: const EdgeInsets.all(20.0),
//                             child: Container(
//                               width: MediaQuery.of(context).size.width,
//                               height: MediaQuery.of(context).size.width*0.7,
//                               decoration: BoxDecoration(
//                                   border: Border(
//                                     left: BorderSide(color: Colors.white, width: 5,),
//                                     right: BorderSide(color: Colors.white, width: 5,),
//                                     top: BorderSide(color: Colors.white, width: 5,),
//                                     bottom: BorderSide(color: Colors.white, width: 5,),
//                                   ),
//                                   image: DecorationImage(
//                                       fit: BoxFit.cover,
//                                       image: NetworkImage("https://cdn.shopify.com/app-store/listing_images/c299a1b734a78cf3f39d5277ecea0bae/banner/CLDCgtP0lu8CEAE=.png")
//                                   ),
//                                   borderRadius: BorderRadius.circular(10),
//                                   color: Colors.purple
//                               ),
//                               child:Column(
//                                 children: [
//                                   Expanded(child: Container()),
//
//                                   // Row(
//                                   //   children: [
//                                   //     Container(
//                                   //       height: 5,
//                                   //       width: MediaQuery.of(context).size.width*0.85,
//                                   //       color: Colors.red,
//                                   //     )
//                                   //   ],
//                                   // ),
//                                   // Container(
//                                   //   height: 40,
//                                   //   width: MediaQuery.of(context).size.width,
//                                   //   color: Color(0xff171d1d),
//                                   //   child: Row(
//                                   //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                   //     children: [
//                                   //       Padding(padding: EdgeInsets.only(left: 10,top: 5,bottom: 5),
//                                   //         child: Container(
//                                   //           height: 25,
//                                   //           width: 50,
//                                   //           decoration: BoxDecoration(
//                                   //             color: Colors.white,
//                                   //             borderRadius: BorderRadius.circular(5)
//                                   //           ),
//                                   //           child: Row(
//                                   //             mainAxisAlignment: MainAxisAlignment.center,
//                                   //             children: [
//                                   //               Padding(
//                                   //                 padding: const EdgeInsets.all(3.0),
//                                   //                 child: Container(height: 5,width: 5,
//                                   //
//                                   //                   decoration: BoxDecoration(
//                                   //                       color: Colors.cyanAccent,
//                                   //                       borderRadius: BorderRadius.circular(5)
//                                   //                   ),
//                                   //                 ),
//                                   //               ),
//                                   //               Text("Live",style: TextStyle(fontSize: 11,fontWeight: FontWeight.w900),)
//                                   //             ],
//                                   //           ),
//                                   //         ),
//                                   //       ),
//                                   //     IconButton(onPressed: (){}, icon:Icon(Icons.volume_up,color: Colors.white70)),
//                                   //       Container(
//                                   //         width: 100,
//                                   //         //  margin: EdgeInsets.fromLTRB(0, 100, 0, 0),
//                                   //           child: Slider(
//                                   //
//                                   //               value: valueHolder.toDouble(),
//                                   //               min: 0,
//                                   //               max: 10,
//                                   //               divisions: 100,
//                                   //               activeColor: Colors.white,
//                                   //               inactiveColor: Colors.grey,
//                                   //               label: '${valueHolder.round()}',
//                                   //               onChanged: (double newValue) {
//                                   //                 setState(() {
//                                   //                   valueHolder = newValue.round();
//                                   //                 });
//                                   //               },
//                                   //               semanticFormatterCallback: (double newValue) {
//                                   //                 return '${newValue.round()}';
//                                   //               }
//                                   //           )),
//                                   //
//                                   //                  //   IconButton(onPressed: (){}, icon:Icon(Icons.volume_up,color: Colors.white70)),
//                                   //                     IconButton(onPressed: (){}, icon:Icon(Icons.wrap_text,color: Colors.white70)),
//                                   //                     IconButton(onPressed: (){
//                                   //                       Navigator.push(context, MaterialPageRoute(builder: (context)=>FullScreen()));
//                                   //                     }, icon:Icon(Icons.zoom_out_map_rounded,color: Colors.white70,)),
//                                   //
//                                   //
//                                   //
//                                   //
//                                   //     ],
//                                   //   ),
//                                   // )
//                                 ],
//                               ),
//
//                             ),
//                           ),
//
//
//                           Column(
//                             children: [
//                               Padding(
//                                 padding: const EdgeInsets.all(10.0),
//                                 child: Container(
//                                   child: Row(
//                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         Container(
//                                           child: Row(
//
//                                             children: [
//                                               Text("Video on",style: TextStyle(color: Colors.cyan),),
//                                               Transform.scale(
//                                                   scale: 1,
//                                                   child: Switch(
//                                                     onChanged: toggleSwitch,
//                                                     value: isSwitched,
//                                                      activeColor: Colors.white,
//                                                     activeTrackColor: Colors.pink,
//                                                     inactiveThumbColor: Colors.redAccent,
//                                                     inactiveTrackColor: Colors.white70,
//                                                   )
//                                               ),
//                                               // Text('$textValue', style: TextStyle(fontSize: 20),)
//
//                                             ],
//                                           ),
//                                         ),
//                                         Container(
//                                           child: Row(
//                                             children: [
//                                               Text("Chat on",style: TextStyle(color: Colors.cyan),),
//                                               Transform.scale(
//                                                   scale: 1,
//                                                   child: Switch(
//                                                     onChanged: toggleSwitchchat,
//                                                     value: isSwitchedchat,
//                                                     activeColor: Colors.white,
//                                                     activeTrackColor: Colors.pink,
//                                                     inactiveThumbColor: Colors.redAccent,
//                                                     inactiveTrackColor: Colors.white70,
//                                                   )
//                                               ),
//                                               // Text('$textValue', style: TextStyle(fontSize: 20),)
//
//                                             ],
//                                           ),
//                                         ),
//                                       ]
//                                   ),
//                                 ),
//                               ),
//
//                               Padding(
//                                 padding: const EdgeInsets.only(left: 20),
//                                 child: Align(
//                                   alignment: Alignment.topLeft,
//                                   child: FlatButton(
//                                       color: Colors.pink,
//                                       onPressed: (){},
//                                       child: Text('Set Timer', style: TextStyle(fontSize: 11,color: Colors.white),)
//                                   ),
//                                 ),
//                               ),
//                               Padding(
//                                 padding: EdgeInsets.only(left: 20,top: 5,bottom: 5,right: 20),
//                                 child:
//                                 Column(
//                                   children: [
//                                     SizedBox(height: 20,),
//                                     Align(
//                                         alignment:Alignment.topLeft,
//                                         child: Text("Title of the session",style: TextStyle(fontSize: 11,fontWeight: FontWeight.w700,color: Colors.pink),)),
//
//                                     TextField(
//                                       controller: _channelName,
//                                       //controller: passEditingController,
//                                       onChanged: (val){
//                                         setState(() {
//                                           //    isEnabled=true;
//                                         });
//                                       },
//                                       keyboardType: TextInputType.multiline,
//                                       style: TextStyle(color: Color(0xff202D50)),
//                                       //  obscureText: !passswordvisible,
//                                       decoration: InputDecoration(
//                                         border: OutlineInputBorder(
//                                             borderRadius: BorderRadius.circular(10.0),
//                                             borderSide: new BorderSide(color: Color(0xff3D4864))
//                                         ),
//                                         enabledBorder:  OutlineInputBorder(
//                                           borderRadius: BorderRadius.circular(10),
//                                           borderSide:  BorderSide(color:Color(0xff3D4864), width: 0.0),
//                                         ),
//                                         focusedBorder: OutlineInputBorder(
//                                           borderRadius: BorderRadius.circular(10),
//                                           borderSide:  BorderSide(color: Color(0xff3D4864), width: 0.0),
//                                         ),
//                                         hintText: 'Give LiveCast Name',
//                                         hintStyle: TextStyle(color: Color(
//                                             0xffffffff)),
//                                         //    errorText: "Password not match"
//                                       ),
//                                     ),
//                                     SizedBox(height: 10,),
//                                     TextButton(
//                                       onPressed: () => onJoin(isBroadcaster: false),
//                                       child: Row(
//                                         mainAxisAlignment: MainAxisAlignment.center,
//                                         children: <Widget>[
//                                           Text(
//                                             'Just Watch  ',
//                                             style: TextStyle(fontSize: 20),
//                                           ),
//                                           Icon(
//                                             Icons.remove_red_eye,
//                                           )
//                                         ],
//                                       ),
//                                     ),
//                                     TextButton(
//                                       style: TextButton.styleFrom(
//                                         primary: Colors.pink,
//                                       ),
//                                       onPressed: () => onJoin(isBroadcaster: true),
//                                       child: Row(
//                                         mainAxisAlignment: MainAxisAlignment.center,
//                                         children: <Widget>[
//                                           Text(
//                                             'Broadcast    ',
//                                             style: TextStyle(fontSize: 20),
//                                           ),
//                                           Icon(Icons.live_tv)
//                                         ],
//                                       ),
//                                     ),
//                                     Text(
//                                       check,
//                                       style: TextStyle(color: Colors.red),
//                                     ),
//                                           SizedBox(height: 10,),
//                                     Center(
//                                       child: Container(
//                                         height: 45,
//                                         width: 45,
//                                         decoration: BoxDecoration(
//                                             color: Colors.black26,
//                                             border: Border(
//                                               left: BorderSide(color: Colors.white10, width: 3,),
//                                               right: BorderSide(color: Colors.white10, width: 3,),
//                                               top: BorderSide(color: Colors.white10, width: 3,),
//                                               bottom: BorderSide(color: Colors.white10, width: 3,),
//                                             ),
//                                             borderRadius: BorderRadius.circular(20)
//                                         ),
//                                         child: Center(
//                                           child: IconButton(
//                                             onPressed: (){
//                                               Navigator.push(context,MaterialPageRoute(builder: (context)=>MyApp()));                                            },
//                                             icon: Icon(Icons.wrong_location,color: Colors.cyan,),
//                                           ),
//                                         ),
//                                       ),
//
//                                     ),
//                                     Text("Start Live",style: TextStyle(fontSize: 14,color:Colors.cyan,fontWeight: FontWeight.w900),)
//                                   ],
//                                 ),
//
//
//                                 // child:   Align(
//                                 //      alignment: Alignment.bottomCenter,
//                                 //      child: Container(
//                                 //
//                                 //        decoration: BoxDecoration(
//                                 //          color: Colors.cyan,
//                                 //          borderRadius: BorderRadius.only(topRight:Radius.circular(10),topLeft:Radius.circular(10),bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10))
//                                 //        ),
//                                 //        height: 60,
//                                 //        width: MediaQuery.of(context).size.width*0.9,
//                                 //      child: Padding(
//                                 //        padding: const EdgeInsets.all(8.0),
//                                 //        child: Center(
//                                 //          child: Text("How many user are attend\ncan it possible we arrange another meting?",style: TextStyle(
//                                 //              fontSize:11,fontWeight: FontWeight.w900,color: Colors.black),),
//                                 //        ),
//                                 //      ),
//                                 //      ),
//                                 // )
//                               )
//                             ],
//                           )
//                         ],
//
//                       ),
//                     ),
//                   )
//                 ]
//             )
//         )
//     );
//
//   }
//   Future<void> onJoin({bool? isBroadcaster}) async {
//     await [Permission.camera, Permission.microphone].request();
//
//     Navigator.of(context).push(
//       MaterialPageRoute(
//         builder: (context) => BroadcastPage(
//         _channelName.text,isBroadcaster!
//         ),
//       ),
//     );
//   }
// }
