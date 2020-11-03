import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

int bio, nonBio, other;
String name, phone, email, location;
List<String> pics = ["https://www.scidev.net/objects_store/thumbnail/71201187C8802D88C35733675E169F6B.jpg", "https://www.scidev.net/objects_store/thumbnail/71201187C8802D88C35733675E169F6B.jpg", "https://www.scidev.net/objects_store/thumbnail/71201187C8802D88C35733675E169F6B.jpg"];
class FirebaseClass {
  Future getPoints() async {
    final obj = FirebaseFirestore.instance;
    var info = await obj.collection("test1@mail.com").doc("userPoints").get();
    bio = info["bioWaste"];
    nonBio = info["nonBioWaste"];
    other = info["nonBioWaste"];
    return info;
  }

  // Future getWastePics() async {
  //   final obj = FirebaseFirestore.instance;
  //   await obj.collection("wastePics").get().then((value) async {
  //     for (var pic in value.docs) {
  //       String temp = await pic["url"];
  //       print(temp);
  //       pics.add("$temp");
  //     }
  //   });
  // }

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
