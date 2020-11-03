import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

int bio, nonBio, other;
String name, phone, email, location;
class FirebaseClass {
  Future getPoints() async{
    final obj = FirebaseFirestore.instance;
    var info = await obj.collection("test1@mail.com").doc("userPoints").get();
    bio = info["bioWaste"];
    nonBio = info["nonBioWaste"];
    other = info["nonBioWaste"];
    return info;
  }

  Future loginUser(String email, String password) async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    var temp = "not_null";
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
