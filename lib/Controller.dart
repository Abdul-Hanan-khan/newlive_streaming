import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:newlive_streaming/Module/todoModule.dart';
import 'package:newlive_streaming/database/FirbaseCRUD.dart';
import 'package:newlive_streaming/screens/AuthenticationScreen/SignUp.dart';
import 'package:newlive_streaming/screens/HomeScreen/HomeTabe.dart';
import 'package:newlive_streaming/screens/HomeScreen/TabScreen/Home.dart';
import 'package:newlive_streaming/widget/contant.dart';

class AuthController extends GetxController{
static AuthController instance=Get.find();
 Rx<GoogleSignInAccount> googleSignInAccount;
Rx<List<TodoModule>> todolist=Rx<List<TodoModule>>([]);
List<TodoModule> get  todos=>todolist.value;
 Rx<User>firebaseUser;
void onReady() {
  super.onReady();
  firebaseUser = Rx<User>(auth.currentUser);
  googleSignInAccount = Rx<GoogleSignInAccount>(googleSign.currentUser);

  ever(firebaseUser, _setInitilizeScree);

  firebaseUser.bindStream(auth.userChanges());
// todolist.bindStream(FirebaseCRUD.todoStream());
  googleSignInAccount.bindStream(googleSign.onCurrentUserChanged);
  ever(googleSignInAccount, _setInitilizeScreenGoogle);
}
  _setInitilizeScree(User user) {
    if (user == null) {
      Get.offAll(() => SignUp());
    }
    else {

      Get.offAll(() => HomeTab());

    }
  }

_setInitilizeScreenGoogle(GoogleSignInAccount googleSignInAccount) {
  print(googleSignInAccount);
  if(googleSignInAccount==null){
    Get.offAll(()=>SignUp());
  }
  else{
    Get.offAll(()=>HomeTab());
  }
}
void signinwithgoogle()async{
  try{
    GoogleSignInAccount googleSignInAccount=await googleSign.signIn();
    if(googleSignInAccount!=null)
      {
        GoogleSignInAuthentication googleSignInAuthentication=await googleSignInAccount.authentication;
        AuthCredential credential=GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken
        );
        await auth
        .signInWithCredential(credential)
        .catchError((onErr)=>print(onErr));
      }
  }
  catch(e)
  {
    Get.snackbar("Error", e.toString(),snackPosition: SnackPosition.BOTTOM);
    print(e.toString());
  }
}
void register(String email,password)async{
try{
  await auth.createUserWithEmailAndPassword(email: email, password: password);
}
catch(firebaseAuthException)
  {}
}
void login(String email,password) async
{
  try {
    await auth.signInWithEmailAndPassword(email: email, password: password);
  }
  catch(firebaseAuthException)
  {

  }
}
void siginout(){
  auth.signOut();
}
void storeData(String name,email,phone) async{
await firebaseFirestore.collection('data').add({name:name,email:email,phone:phone});
}
}