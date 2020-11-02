import 'package:firebase_auth/firebase_auth.dart';

class Firebase {
  Future loginUser(String email, String password) async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    var temp="not_null";
    if (password != null && email != null) {
      try {
        await firebaseAuth.signInWithEmailAndPassword(
            email: email, password: password);
      } catch (e) {
        temp = e;
      }
    }
    return temp;
  }
}
