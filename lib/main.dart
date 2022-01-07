import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newlive_streaming/Controller.dart';
import 'package:newlive_streaming/screens/SplashScreen.dart';
import 'package:newlive_streaming/widget/contant.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();

  await firebaseInitialization.then((value) => Get.put(AuthController()));
  runApp(App()
  );

}
class App extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Live Streaming",
      theme: ThemeData.dark(),
      home:  SplashScreen(),
    );
  }
}