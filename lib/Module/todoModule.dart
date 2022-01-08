import 'package:cloud_firestore/cloud_firestore.dart';

class TodoModule{
  String? documentid;
  late String name;
  late String email;
  late String phoone;
  late String password;
  late String Headline;
  late String position;
  late String Education;
  late String Country;
  late String location;
  late String industry;
  late String onlineStatus;
  late String imgStr;

  TodoModule({
    required this.name,
    required this.email,
    required this.phoone,
    required this.password,
    required this.Headline,
    required this.position,
    required this.Education,
    required this.Country,
    required this.location,
    required this.industry,
    required this.onlineStatus,
    required this.imgStr,

  });
  TodoModule.fromDocumentSnapShoot({required DocumentSnapshot documentSnapshot}){
    documentid=documentSnapshot.id;
    name=documentSnapshot["name"];
    email=documentSnapshot["email"];
    phoone=documentSnapshot["phone"];
    phoone=documentSnapshot["password"];
    Headline=documentSnapshot["headline"];
    position=documentSnapshot["position"];
    Education=documentSnapshot["education"];
    Country=documentSnapshot["country"];
    location=documentSnapshot["location"];
    industry=documentSnapshot["industry"];
    onlineStatus=documentSnapshot["onlineStatus"];
    imgStr=documentSnapshot["imgStr"];
  }
}