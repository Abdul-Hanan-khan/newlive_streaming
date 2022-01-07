import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:newlive_streaming/screens/HomeScreen/TabScreen/GoLive.dart';

class Admin_live extends StatefulWidget {
  // const GoLive({Key? key}) : super(key: key);

  @override
  _Admin_liveState createState() => _Admin_liveState();
}

class _Admin_liveState extends State<Admin_live> {
  int valueHolder = 10;
  openAlertBox() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0))),
            contentPadding: EdgeInsets.only(top: 10.0),
            content: Container(
              width: 300.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        "Rate",
                        style: TextStyle(fontSize: 24.0),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(
                            Icons.star_border,
                            color: Color(0xff743536),
                            size: 30.0,
                          ),
                          Icon(
                            Icons.star_border,
                            color: Color(0xff743536),
                            size: 30.0,
                          ),
                          Icon(
                            Icons.star_border,
                            color: Color(0xff743536),
                            size: 30.0,
                          ),
                          Icon(
                            Icons.star_border,
                            color: Color(0xff743536),
                            size: 30.0,
                          ),
                          Icon(
                            Icons.star_border,
                            color: Color(0xff743536),
                            size: 30.0,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Divider(
                    color: Colors.grey,
                    height: 4.0,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 30.0, right: 30.0),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Add Review",
                        border: InputBorder.none,
                      ),
                      maxLines: 8,
                    ),
                  ),
                  InkWell(
                    child: Container(
                      padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                      decoration: BoxDecoration(
                        color: Color(0xff743536),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(32.0),
                            bottomRight: Radius.circular(32.0)),
                      ),
                      child: InkWell(
                        onTap: (){
                          Navigator.pushReplacement(
                              context, MaterialPageRoute(builder: (context) => Admin_live()));
                        },
                        child: Text(
                          "Rate Product",
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
  void initState(){
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }
  // void dialog(BuildContext context) {
  //   AlertDialog(
  //     backgroundColor: Colors.white,
  //     title: Text('Alert', style: TextStyle(
  //         color: Colors.red, fontWeight: FontWeight.w900, fontSize: 14),),
  //     // To display the title it is optional
  //     content: Text('Metting End?'),
  //     // Message which will be pop up on the screen
  //     // Action widget which will provide the user to acknowledge the choice
  //     actions: [
  //       FlatButton( // FlatButton widget is used to make a text to work like a button
  //         textColor: Colors.black,
  //         onPressed: () {
  //           Navigator.pop(context);
  //         }, // function used to perform after pressing the button
  //         child: Text('CANCEL'),
  //
  //       ),
  //       FlatButton(
  //         textColor: Colors.black,
  //         onPressed: () {
  //           Navigator.pushReplacement(
  //               context, MaterialPageRoute(builder: (context) => GoLive()));
  //         },
  //         child: Text('OK'),
  //       ),
  //     ],
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:Colors.black,
        body:Container(
            padding: EdgeInsets.only(top: 10),
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image:  DecorationImage(
                colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstATop),
                image: AssetImage('assets/icons/screenBack.PNG'),
                fit: BoxFit.fill,

              ),
            ),
            child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      //  height: 120,
                      color: Colors.black.withOpacity(0.5),
                      //  width: MediaQuery.of(context).size.width,

                      child:   Column(
                          children:[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: CircleAvatar(
                                    radius: 25,
                                    backgroundColor: Color(0xffffffff),
                                    child:CircleAvatar(
                                      radius: 23,
                                      backgroundColor: Colors.white,
                                      backgroundImage:AssetImage("assets/icons/testimage.jpg",),

                                    ),
                                  ),
                                ),
                                FlatButton(
                                    color: Colors.black38,
                                    onPressed: (){

                                      openAlertBox();

                                      },
                                    //  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>GoLive()));


                                    //                                  },
                                    child: Text("End Live",style: TextStyle(color: Colors.cyan),))
                              ],
                            ),

                          ]

                      ),
                      //    SizedBox(height: 40,),
                      //     Center(child: Text("Nadeem",style: TextStyle(fontSize: 18,color: Colors.cyanAccent,fontWeight: FontWeight.w800),),)
                      //    ],
                      //  ),


                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [

                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.width*0.7,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage("https://cdn.shopify.com/app-store/listing_images/c299a1b734a78cf3f39d5277ecea0bae/banner/CLDCgtP0lu8CEAE=.png")
                                  ),
                                  border: Border(
                                      top: BorderSide(color: Colors.white,width: 5),
                                      bottom: BorderSide(color: Colors.white,width: 5)
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.purple
                              ),
                              //    child:Column(
                              //     children: [
                              //   Expanded(child: Container()),
                              // Row(
                              //   children: [
                              //     Container(
                              //       height: 5,
                              //       width: MediaQuery.of(context).size.width*0.85,
                              //       color: Colors.red,
                              //     )
                              //   ],
                              // ),
                              // Container(
                              //   height: 40,
                              //   width: MediaQuery.of(context).size.width,
                              //   color: Color(0xff171d1d),
                              //   child: Row(
                              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              //     children: [
                              //       Padding(padding: EdgeInsets.only(left: 10,top: 5,bottom: 5),
                              //         child: Container(
                              //           height: 25,
                              //           width: 50,
                              //           decoration: BoxDecoration(
                              //               color: Colors.white,
                              //               borderRadius: BorderRadius.circular(5)
                              //           ),
                              //           child: Row(
                              //             mainAxisAlignment: MainAxisAlignment.center,
                              //             children: [
                              //               Padding(
                              //                 padding: const EdgeInsets.all(3.0),
                              //                 child: Container(height: 5,width: 5,
                              //
                              //                   decoration: BoxDecoration(
                              //                       color: Colors.cyanAccent,
                              //                       borderRadius: BorderRadius.circular(5)
                              //                   ),
                              //                 ),
                              //               ),
                              //               Text("Live",style: TextStyle(fontSize: 11,fontWeight: FontWeight.w900),)
                              //             ],
                              //           ),
                              //         ),
                              //       ),
                              //       IconButton(onPressed: (){}, icon:Icon(Icons.volume_up,color: Colors.white70)),
                              //       Container(
                              //           width: 100,
                              //           //  margin: EdgeInsets.fromLTRB(0, 100, 0, 0),
                              //           child: Slider(
                              //
                              //               value: valueHolder.toDouble(),
                              //               min: 0,
                              //               max: 10,
                              //               divisions: 100,
                              //               activeColor: Colors.white,
                              //               inactiveColor: Colors.grey,
                              //               label: '${valueHolder.round()}',
                              //               onChanged: (double newValue) {
                              //                 setState(() {
                              //                   valueHolder = newValue.round();
                              //                 });
                              //               },
                              //               semanticFormatterCallback: (double newValue) {
                              //                 return '${newValue.round()}';
                              //               }
                              //           )),
                              //
                              //       //   IconButton(onPressed: (){}, icon:Icon(Icons.volume_up,color: Colors.white70)),
                              //       IconButton(onPressed: (){}, icon:Icon(Icons.wrap_text,color: Colors.white70)),
                              //       IconButton(onPressed: (){
                              //     //    Navigator.push(context, MaterialPageRoute(builder: (context)=>FullScreen()));
                              //       }, icon:Icon(Icons.zoom_out_map_rounded,color: Colors.white70,)),
                              //
                              //
                              //
                              //
                              //     ],
                              //   ),
                              // )
                              //      ],
                              //     ),

                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("I am Live Here",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w700,color: Colors.white),),
                                    SizedBox(height: 10,),
                                    Row(
                                      children: [
                                        Icon(Icons.visibility_outlined,color: Colors.white54,),
                                        SizedBox(width: 10,),
                                        Text("12,354 views",style: TextStyle(color: Colors.white54,),),
                                        SizedBox(width: 20,),
                                        Icon(Icons.volunteer_activism,color: Colors.white54,),
                                        SizedBox(width: 10,),
                                        Text("12,354 Liks",style: TextStyle(color: Colors.white54,)),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 20,top: 5,bottom: 5,right: 20),
                                child: Row(

                                  children: [
                                    CircleAvatar(
                                      radius: 20,
                                      backgroundColor: Colors.white,
                                      backgroundImage:AssetImage("assets/icons/testimage.jpg",),

                                    ),
                                    SizedBox(width: MediaQuery.of(context).size.width*0.1,),
                                    Column(
                                      children: [
                                        SizedBox(height: 10,),
                                        Align(
                                          alignment: Alignment.bottomCenter,
                                          child: Container(

                                            decoration: BoxDecoration(
                                                color: Colors.cyan,
                                                borderRadius: BorderRadius.only(topRight:Radius.circular(10),bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10))
                                            ),
                                            height: 60,
                                            width: MediaQuery.of(context).size.width*0.6,
                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Center(
                                                child: Text("How many user are attend\ncan it possible we arrange another meting?",style: TextStyle(
                                                    fontSize:11,fontWeight: FontWeight.w900,color: Colors.black),),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          )
                        ],

                      ),
                    ),
                  )
                ]
            )
        )
    );
  }
}
