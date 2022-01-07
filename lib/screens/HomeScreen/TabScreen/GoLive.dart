
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:newlive_streaming/screens/FullScreen.dart';

class GoLive extends StatefulWidget {
  const GoLive({Key key}) : super(key: key);

  @override
  _GoLiveState createState() => _GoLiveState();
}

class _GoLiveState extends State<GoLive> {
  int valueHolder = 10;
    // AgoraClient client=AgoraClient(
    //     agoraConnectionData:AgoraConnectionData(
    //       appId: "89014020b3e24eb98ee9a0202de703f7",
    //    //   tempToken: "00689014020b3e24eb98ee9a0202de703f7IAB04YCbmEhKwIxxeR9STLJpHHN4wp8ssewQM6EikuOquRF4VJwAAAAAEAAZVNxrSneeYQEAAQBKd55h",
    //       channelName: "live_streaming"
    //     ),
    //     enabledPermission:[
    //       Permission.camera,
    //       Permission.microphone
    //     ]);
  void initState(){
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }
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
                height: 120,
                color: Colors.black.withOpacity(0.5),
                width: MediaQuery.of(context).size.width,
                child: Wrap(
                  children: [

                    Column(
                        children:[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: Icon(Icons.arrow_back,color: Colors.white,size: 30,),
                              ),
                              Icon(Icons.search,color: Colors.white,size: 30,),
                            ],
                          ),
                          Align(
                            alignment: Alignment.topCenter,
                            child: CircleAvatar(
                              radius: 30,
                              backgroundColor: Color(0xffffffff),
                              child:CircleAvatar(
                                radius: 27,
                                backgroundColor: Colors.white,
                                backgroundImage:AssetImage("assets/icons/testimage.jpg",),

                              ),
                            ),
                          ),
                        ]

                    ),
                    SizedBox(height: 40,),
                    Center(child: Text("Nadeem",style: TextStyle(fontSize: 18,color: Colors.cyanAccent,fontWeight: FontWeight.w800),),)
                  ],
                ),


      ),
              ),
              Expanded(
                flex: 4,
                child: SingleChildScrollView(
                  child: Column(
                    children: [

                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.width*0.9,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage("https://cdn.shopify.com/app-store/listing_images/c299a1b734a78cf3f39d5277ecea0bae/banner/CLDCgtP0lu8CEAE=.png")
                          ),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.purple
                        ),
                        child:Stack(
                            children: [
                            // AgoraVideoViewer(client: client),
                            //   AgoraVideoButtons(client: client),
                              //  Expanded(child: Container()),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Row(
                                  children: [
                                    Container(
                                      height: 5,
                                      width: MediaQuery.of(context).size.width*0.85,
                                      color: Colors.red,
                                    )
                                  ],
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  height: 40,
                                  width: MediaQuery.of(context).size.width,
                                  color: Color(0xff171d1d),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(padding: EdgeInsets.only(left: 10,top: 5,bottom: 5),
                                        child: Container(
                                          height: 25,
                                          width: 50,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(5)
                                          ),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.all(3.0),
                                                child: Container(height: 5,width: 5,
                                                  decoration: BoxDecoration(
                                                      color: Colors.cyanAccent,
                                                      borderRadius: BorderRadius.circular(5)
                                                  ),
                                                ),
                                              ),
                                              Text("Live",style: TextStyle(fontSize: 11,fontWeight: FontWeight.w900),)
                                            ],
                                          ),
                                        ),
                                      ),
                                    IconButton(onPressed: (){}, icon:Icon(Icons.volume_up,color: Colors.white70)),
                                      Container(
                                        width: 100,
                                        //  margin: EdgeInsets.fromLTRB(0, 100, 0, 0),
                                          child: Slider(

                                              value: valueHolder.toDouble(),
                                              min: 0,
                                              max: 10,
                                              divisions: 100,
                                              activeColor: Colors.white,
                                              inactiveColor: Colors.grey,
                                              label: '${valueHolder.round()}',
                                              onChanged: (double newValue) {
                                                setState(() {
                                                  valueHolder = newValue.round();
                                                });
                                              },
                                              semanticFormatterCallback: (double newValue) {
                                                return '${newValue.round()}';
                                              }
                                          )),

                                                 //   IconButton(onPressed: (){}, icon:Icon(Icons.volume_up,color: Colors.white70)),
                                                    IconButton(onPressed: (){}, icon:Icon(Icons.wrap_text,color: Colors.white70)),
                                                    IconButton(onPressed: (){
                                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>FullScreen()));
                                                    }, icon:Icon(Icons.zoom_out_map_rounded,color: Colors.white70,)),




                                    ],
                                  ),
                                ),
                              )
                            ],
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
