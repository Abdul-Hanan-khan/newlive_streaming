

import 'package:get/get.dart';
import 'package:newlive_streaming/Module/todoModule.dart';
import 'package:newlive_streaming/widget/contant.dart';

import '../variables.dart';

class FirebaseCRUD{
  // static addTodo(TodoModule todoModule)async{
  // await firebaseFirestore
  //     .collection("User")
  //     .doc(todoModule.email)
  //     .set({
  //   'name':todoModule.name,
  //   'email':todoModule.email,
  //   'phone':todoModule.phoone,
  //   'password':todoModule.password,
  //   'Headline':todoModule.Headline,
  //   'position':todoModule.position,
  //   'Education':todoModule.Education,
  //   'Country':todoModule.Country,
  //   'location':todoModule.location,
  //   'industry':todoModule.industry,
  //   'onlineStatus':todoModule.onlineStatus,
  //
  // });
  // }
  static addTodo(TodoModule todoModule)async{
  await firebaseFirestore
      .collection("User").where('email',isEqualTo: todoModule.email).get()
    .then((value) {
    if (value.docs.length > 0) {
      Variables.userExistAlready=true;
    Get.snackbar('Error', 'This Email is Already Registered');

    }else{
      Variables.userExistAlready=false;
      firebaseFirestore
          .collection("User")
          .doc(todoModule.email)
          .set({
        'name':todoModule.name,
        'email':todoModule.email,
        'phone':todoModule.phoone,
        'password':todoModule.password,
        'Headline':todoModule.Headline,
        'position':todoModule.position,
        'Education':todoModule.Education,
        'Country':todoModule.Country,
        'location':todoModule.location,
        'industry':todoModule.industry,
        'onlineStatus':todoModule.onlineStatus,
      });
    }
  });
  }
}
