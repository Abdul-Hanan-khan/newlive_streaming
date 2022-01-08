import 'dart:convert';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newlive_streaming/screens/HomeScreen/TabScreen/Chat.dart';
import 'package:newlive_streaming/screens/HomeScreen/TabScreen/GoLive.dart';
import 'package:newlive_streaming/screens/Live_catogories.dart';
import 'package:newlive_streaming/screens/ProfilePage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../variables.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
 var names=['FRX','HFX','chan','don','killer'];
 var AdvanceBasic=['FRX Advance','FRX Basic','Chan Bacis','Don Advance','Don Basic'];
 var views=['2233','3323','333','72','25'];
@override
  void initState() {
    // TODO: implement initState
  getUserByEmail();
    super.initState();
  }



 getUserByEmail()async {
   SharedPreferences prefs= await SharedPreferences.getInstance();

   final String id = prefs.getString('email').toString();
   final userRef = FirebaseFirestore.instance.collection('User');
   userRef.doc(id).get().then((DocumentSnapshot doc) {
     Variables.name = (doc.get('name').toString());
     Variables.email = (doc.get('email').toString());
     Variables.phone = (doc.get('phone').toString());
     Variables.password = (doc.get('password').toString());
     Variables.Headline = (doc.get('Headline').toString());
     Variables.position = (doc.get('position').toString());
     Variables.Education = (doc.get('Education').toString());
     Variables.Country = (doc.get('Country').toString());
     Variables.location = (doc.get('location').toString());
     Variables.industry = (doc.get('industry').toString());
     Variables.onlineStatus = (doc.get('onlineStatus').toString());
     Variables.imgStr = (doc.get('imgStr').toString());

   });
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
       //     color:   Colors.black.withOpacity(0.5)
        ),
        child: Column(
          children: [
            Expanded(
            flex: 1,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 20,left: 20),
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        Text("Discover",style: TextStyle(fontSize: 28,color: Colors.white,fontWeight: FontWeight.w700),),
                        Expanded(child: Container(),),
                        IconButton(
                          icon: Icon(Icons.account_circle_outlined,color: Colors.cyan,),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfilePage()));
                          },
                        ),
                        // IconButton(
                        //   icon: Icon(Icons.search,size: 30,color: Colors.cyan,),
                        //   onPressed: () {},
                        // ),
                      ],
                    ),
                  ),

              // Container(
              //   height: 120,
              //
              //   width: MediaQuery.of(context).size.width,
              //   child: ListView.builder(
              //     scrollDirection: Axis.horizontal,
              //     itemCount: 5,
              //       itemBuilder: (BuildContext context,int item){
              //
              //      //  return  InkWell(
              //      //    onTap: (){Navigator.push(context,MaterialPageRoute(builder: (context)=>GoLive()));},
              //      //    child: Card(
              //      //
              //      //      elevation: 0,
              //      //      color: Colors.transparent,
              //      //       // shape: RoundedRectangleBorder(side:BorderSide.none,borderRadius: BorderRadius.zero ),
              //      //        child: Column(
              //      //          children: [
              //      //            Padding(
              //      //              padding: const EdgeInsets.all(5.0),
              //      //              child: CircleAvatar(
              //      //                radius: 20,
              //      //                backgroundImage:AssetImage("assets/icons/testimage.jpg",),
              //      //              ),
              //      //            ),
              //      //            Text("${names[item]}",style: TextStyle(color: Colors.cyanAccent,fontWeight: FontWeight.w600),),
              //      //            Text("${views[item]}",style: TextStyle(color: Color(
              //      //                0xffb6b7bd),fontSize: 9,fontWeight: FontWeight.w300),),
              //      //            Text("view",style: TextStyle(color: Color(
              //      //                0xffb6b7bd),fontSize: 9,fontWeight: FontWeight.w300),),
              //      //            InkWell(
              //      //              onTap:(){Navigator.push(context,MaterialPageRoute(builder: (context)=>Chat()));},
              //      //              child: Container(
              //      //                height: 20,
              //      //                width: 60,
              //      //               decoration: BoxDecoration(
              //      //                 borderRadius: BorderRadius.circular(10),
              //      //                 color: Color(
              //      //                     0xff171ac2)
              //      //               ),
              //      //                child:Center(
              //      //                  child: Text("Message",style: TextStyle(color: Color(
              //      //                      0xffffffff),fontSize: 9,fontWeight: FontWeight.w300),),
              //      //                ),
              //      //              ),
              //      //            )
              //      //
              //      //          ],
              //      //        ),
              //      // //   ),
              //      //    ),
              //      //  );
              //
              //       }
              //       ),
              // ),
                  Container(
                height: 120,
                width: MediaQuery.of(context).size.width,
                child:  StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance.collection('User').snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return ListView(
                        scrollDirection: Axis.horizontal,
                        children: snapshot.data.docs.map((doc) {

                           Uint8List bytes=base64Decode(doc.get('imgStr'));
                                return  InkWell(
                                  onTap: (){Navigator.push(context,MaterialPageRoute(builder: (context)=>GoLive()));},
                                  child: Card(

                                    elevation: 0,
                                    color: Colors.transparent,
                                     // shape: RoundedRectangleBorder(side:BorderSide.none,borderRadius: BorderRadius.zero ),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: CircleAvatar(
                                              radius: 25,
                                              backgroundImage:MemoryImage(bytes)
                                            ),
                                          ),
                                          Text("${doc.get('name')}",style: TextStyle(color: Colors.cyanAccent,fontWeight: FontWeight.w600),),
                                          Text("${doc.get('onlineStatus')}",style: TextStyle(color: Color(
                                              0xffb6b7bd),fontSize: 9,fontWeight: FontWeight.w300),),

                                          InkWell(
                                            onTap:(){Navigator.push(context,MaterialPageRoute(builder: (context)=>Chat()));},
                                            child: Container(
                                              height: 20,
                                              width: 60,
                                             decoration: BoxDecoration(
                                               borderRadius: BorderRadius.circular(10),
                                               color: Color(
                                                   0xff171ac2)
                                             ),
                                              child:Center(
                                                child: Text("Message",style: TextStyle(color: Color(
                                                    0xffffffff),fontSize: 9,fontWeight: FontWeight.w300),),
                                              ),
                                            ),
                                          )

                                        ],
                                      ),
                               //   ),
                                  ),
                                );
                         
                          // return Card(
                          //   child: ListTile(
                          //     // title: Text(doc.data()['title']),
                          //     title: Text(doc.get('name')),
                          //   ),
                          // );
                        }).toList(),
                      );
                      // return
                      // Container(
                      //   height: 120,
                      //
                      //   width: MediaQuery.of(context).size.width,
                      //   child: ListView.builder(
                      //     scrollDirection: Axis.horizontal,
                      //     itemCount: 5,
                      //       itemBuilder: (BuildContext context,int index){
                      //       return  InkWell(
                      //         onTap: (){Navigator.push(context,MaterialPageRoute(builder: (context)=>GoLive()));},
                      //         child: Card(
                      //
                      //           elevation: 0,
                      //           color: Colors.transparent,
                      //            // shape: RoundedRectangleBorder(side:BorderSide.none,borderRadius: BorderRadius.zero ),
                      //             child: Column(
                      //               children: [
                      //                 Padding(
                      //                   padding: const EdgeInsets.all(5.0),
                      //                   child: CircleAvatar(
                      //                     radius: 20,
                      //                     backgroundImage:AssetImage("assets/icons/testimage.jpg",),
                      //                   ),
                      //                 ),
                      //                 Text("${snapshot.data[index]}",style: TextStyle(color: Colors.cyanAccent,fontWeight: FontWeight.w600),),
                      //                 Text("${views[item]}",style: TextStyle(color: Color(
                      //                     0xffb6b7bd),fontSize: 9,fontWeight: FontWeight.w300),),
                      //                 Text("view",style: TextStyle(color: Color(
                      //                     0xffb6b7bd),fontSize: 9,fontWeight: FontWeight.w300),),
                      //                 InkWell(
                      //                   onTap:(){Navigator.push(context,MaterialPageRoute(builder: (context)=>Chat()));},
                      //                   child: Container(
                      //                     height: 20,
                      //                     width: 60,
                      //                    decoration: BoxDecoration(
                      //                      borderRadius: BorderRadius.circular(10),
                      //                      color: Color(
                      //                          0xff171ac2)
                      //                    ),
                      //                     child:Center(
                      //                       child: Text("Message",style: TextStyle(color: Color(
                      //                           0xffffffff),fontSize: 9,fontWeight: FontWeight.w300),),
                      //                     ),
                      //                   ),
                      //                 )
                      //
                      //               ],
                      //             ),
                      //      //   ),
                      //         ),
                      //       );
                      //
                      //       }
                      //       ),
                      // );
                    }
                  },
                ),
              ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text("Go Live",style: TextStyle(color: Color(
                            0xffffffff),fontSize: 28,fontWeight: FontWeight.w700),),
                      ),
                    ),

                Container(
                  padding: EdgeInsets.only(top: 10),
                  height: 180,

                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (BuildContext context,int item){

                        return  InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Live_Catogories(catgoryname:names[item])));
                          },
                          child: Card(
                            elevation: 0,
                            color: Colors.transparent,
                            // shape: RoundedRectangleBorder(side:BorderSide.none,borderRadius: BorderRadius.zero ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child:  Container(
                                    height: 90,
                                    width: 140,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage("assets/icons/testimage.jpg",),fit: BoxFit.cover
                                      ),
                                        borderRadius: BorderRadius.circular(10),
                                        color: Color(
                                            0xff171ac2)
                                    ),
                                  )
                                ),
                                Text("${names[item]}",style: TextStyle(fontSize: 16,color: Colors.cyanAccent,fontWeight: FontWeight.w900),),
                                Text("GO LIVE",style: TextStyle(color: Color(
                                    0xffebecf3),fontSize: 14,fontWeight: FontWeight.w600),),
                                Text("Library",style: TextStyle(color: Color(
                                    0xffe7e9ef),fontSize: 11,fontWeight: FontWeight.w300),),


                              ],
                            ),
                            //   ),
                          ),
                        );

                      }
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text("Production Education",style: TextStyle(color: Color(
                        0xffffffff),fontSize: 28,fontWeight: FontWeight.w700),),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 10),
                  height: 180,

                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (BuildContext context,int item){

                        return  InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Live_Catogories(catgoryname:AdvanceBasic[item])));
                          },
                          child: Card(
                            elevation: 0,
                            color: Colors.transparent,
                            // shape: RoundedRectangleBorder(side:BorderSide.none,borderRadius: BorderRadius.zero ),
                            child: Column(
                              children: [
                                Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child:  Container(
                                      height: 90,
                                      width: 140,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage("assets/icons/testimage.jpg",),fit: BoxFit.cover
                                          ),
                                          borderRadius: BorderRadius.circular(10),
                                          color: Color(
                                              0xff171ac2)
                                      ),
                                    )
                                ),
                                Text("${AdvanceBasic[item]}",style: TextStyle(fontSize: 18,color: Colors.cyanAccent,fontWeight: FontWeight.w800),),
                              ],
                            ),
                            //   ),
                          ),
                        );

                      }
                  ),
                ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

        //   ],
        // ),
      //)
    );
  }
}
