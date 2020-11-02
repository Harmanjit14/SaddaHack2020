import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:our_world/color.dart';
import 'package:our_world/loginScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget with ColorFile {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Our World',
      theme: ThemeData(primaryColor: lock),
      home: Screen1(),
    );
  }
}
