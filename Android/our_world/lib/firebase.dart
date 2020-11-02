import 'package:firebase_auth/firebase_auth.dart';

class FirebaseClass {
  Future loginUser(String email, String password) async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    var temp="not_null";
    if (password != null && email != null) {
      try {
        await firebaseAuth.signInWithEmailAndPassword(
            email: email.toString(), password: password.toString());
      } catch (e) {
        temp = e;
      }
    }
    return temp;
  }
}
