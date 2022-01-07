import 'package:flutter/material.dart';
import 'package:newlive_streaming/screens/AuthenticationScreen/SignIn.dart';
import 'package:newlive_streaming/screens/AuthenticationScreen/SignUp.dart';

button(String image,String name)
{
 return Padding(
   padding: const EdgeInsets.only(left: 20,right: 20),
   child: RaisedButton(
      elevation: 5.0,
      onPressed: ()
      {
        // if(_key1.currentState.validate() && _key2.currentState.validate()){
        //   databaseLogin();
        // }
      },
      padding: EdgeInsets.all(15.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      color: Colors.white,
      child:
      Row(
          mainAxisAlignment: MainAxisAlignment.center,
           crossAxisAlignment: CrossAxisAlignment.center,
          children:[
            Image.asset(image,width: 24,height: 24,),
            SizedBox(width: 20,),
            Text(name,style: TextStyle(color: Colors.black,fontSize: 14, fontWeight: FontWeight.w600),),
          ]),
    ),
 );
}
buttonsimple(Color color,String name,BuildContext context)
{
  return Padding(
    padding: const EdgeInsets.only(left: 20,right: 20),
    child: RaisedButton(
      elevation: 5.0,
      onPressed: ()
      {
        if(name=="Sign In")
          {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>SignIn()));
          }
        else if(name=="Sign Up Free"){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp()));

        }
        // if(_key1.currentState.validate() && _key2.currentState.validate()){
        //   databaseLogin();
        // }
      },
      padding: EdgeInsets.all(15.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: color,
      child:
      Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:[
          //  Image.asset(image,width: 24,height: 24,),
          //  SizedBox(width: 20,),
            Text(name,style: TextStyle(color: Colors.black,fontSize: 18,
                fontWeight: FontWeight.w900),),
          ]
      ),
    ),
  );

}
