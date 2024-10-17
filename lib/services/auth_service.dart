import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  FirebaseAuth auth = FirebaseAuth.instance;



  checkUser() async{
    var user = await auth.currentUser!.displayName;
    return user;
  }


  login(email, password) async {
    try {
      var user = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      return user;
    } catch (e) {
      throw e;
    }
  }
  
  register(name, email, password) async {
    try {
      var user = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
       await user.user!.updateDisplayName(name);   
      return user;
    } catch (e) {
      throw e;
    }
  }




  recoverPassword(email) async {
    try {
      await auth.sendPasswordResetEmail(
          email: email);
      return true;
    } catch (e) {
      throw e;
    }
  }
}
