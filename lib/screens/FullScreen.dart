import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:newlive_streaming/screens/HomeScreen/TabScreen/GoLive.dart';

class FullScreen extends StatefulWidget {
  //const FullScreen({Key? key}) : super(key: key);

  @override
  _FullScreenState createState() => _FullScreenState();
}

class _FullScreenState extends State<FullScreen> {
  @override
  void initState(){
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  dispose(){
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
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
    child:Column(
    children: [
    Expanded(child: Container()),
    Row(
    children: [
    Container(

    height: 5,
    width: MediaQuery.of(context).size.width*0.92,
    color: Colors.red,
    )
    ],
    ),
    Container(
    height: 40,
    width: MediaQuery.of(context).size.width,
    color: Color(0xff171d1d),
    child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
    Padding(padding: EdgeInsets.only(left: 20,top: 5,bottom: 5),
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
    Container(
      child: Padding(

              padding: EdgeInsets.only(right: 20,top: 5,bottom: 5),
        child: Row(
          children: [
            IconButton(onPressed: (){}, icon:Icon(Icons.volume_up,color: Colors.white70)),
            IconButton(onPressed: (){}, icon:Icon(Icons.wrap_text,color: Colors.white70)),
            IconButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>GoLive()));
            }, icon:Icon(Icons.wallpaper,color: Colors.white70,)),
          ],
        ),
      ),
    )


    ],
    ),
    )
    ],
    ),
      )
    );
  }
}
