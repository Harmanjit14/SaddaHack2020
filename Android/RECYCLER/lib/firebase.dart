import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

int bio=0, nonBio=0, other=0;
String name="", phone="", email="", location="",title="";
List<String> pics = [];


class FirebaseClass {
  Future getPoints() async {
    final obj = FirebaseFirestore.instance;
    var info = await obj.collection("test1@mail.com").doc("userPoints").get();
    bio = info["bioWaste"];
    nonBio = info["nonBioWaste"];
    other = info["nonBioWaste"];
    return info;
  }

  Future getUser() async {
    final obj = FirebaseFirestore.instance;
    var info = await obj.collection("test1@mail.com").doc("userInfo").get();
    name = info["name"];
    email = info["email"];
    phone = info["phone"];
    title = "Hero";
    return info;
  }

  Future getWastePics() async {
    pics.clear();
    final obj = FirebaseFirestore.instance;
    await obj.collection("wastePics").get().then((value) async {
      for (var pic in value.docs) {
        String temp = await pic["url"];
        print(temp);
        pics.add("$temp");
      }
    });
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
