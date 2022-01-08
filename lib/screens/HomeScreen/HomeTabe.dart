import 'package:flutter/material.dart';
import 'package:newlive_streaming/screens/HomeScreen/TabScreen/Chat.dart';
import 'package:newlive_streaming/screens/HomeScreen/TabScreen/GoLive.dart';
import 'package:newlive_streaming/screens/HomeScreen/TabScreen/Home.dart';
import 'AgoraTokenScreen/index.dart';
class HomeTab extends StatefulWidget {
  const HomeTab({Key ?key}) : super(key: key);

  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int _currentIndex = 0;
  final List _children =
  [
    Home(),
    Chat(),
    GoLive(),
    IndexPage()
  ];
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          currentIndex:_currentIndex,
          onTap: onTabTapped,
          selectedItemColor: Color(0xff007360),
          unselectedItemColor: Color(0xffC8DBCF),
          type: BottomNavigationBarType.fixed,
          // showSelectedLabels: true,

          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home,size: 24,),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat,size: 24,),
              label: 'Chat',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.live_tv,size: 24,),
              label: 'Go Live',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.live_tv,size: 24,),
              label: 'New Room',
            ),
          ]
      ),
      body: _children[_currentIndex],
    );
  }
}
