import 'package:cloud_firestore/cloud_firestore.dart';

class TodoModule{
  String documentid;
   String name;
   String email;
   String phoone;
   String password;
   String Headline;
   String position;
   String Education;
   String Country;
   String location;
   String industry;
   String onlineStatus;
   String imgStr;

TodoModule({
   this.name,
  this.email,
  this.phoone,
  this.password,
  this.Headline,
  this.position,
  this.Education,
  this.Country,
  this.location,
  this.industry,
  this.onlineStatus,
  this.imgStr,

});
TodoModule.fromDocumentSnapShoot({ DocumentSnapshot documentSnapshot}){
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