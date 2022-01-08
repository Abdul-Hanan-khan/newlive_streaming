import 'package:flutter/cupertino.dart';

// class ChatUsers {
//  late String name;
//  late String messageText;
//  late String imageURL;
//  late String time;
//  late String secondaryText;
//   ChatUsers( String name,String messageText, String imageURL,  String time,  String secondaryText)
//       {
//         this.name=name;
//       this.messageText=messageText;
//       this.imageURL=imageURL;
//       this.time=time;
//       this.secondaryText=secondaryText;
//       }
//
// }

class ChatUsers{
  String name;
  String messageText;
  String imageURL;
  String time;
  ChatUsers({  required this.name,  required this.messageText,  required this.imageURL,  required this.time});
}