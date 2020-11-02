import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:our_world/color.dart';

int i = 0;
String email;
String password;

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> with ColorFile {
  Widget manager() {
    switch (i) {
      case 0:
        {
          return loginScreen();
        }
        break;
      case 1:
        {
          registerScreen();
        }
        break;
      default:
        {
          return loginScreen();
        }
    }
  }

  Widget loginScreen() {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(20),
              child: Text(
                "Login",
                style: TextStyle(
                    fontSize: 60,
                    color: skin,
                    letterSpacing: -2,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  ElasticInLeft(
                    child: TextField(
                      onChanged: (value) {
                        email = value;
                      },
                      style: TextStyle(fontSize: 18, color: Colors.white),
                      keyboardType: TextInputType.emailAddress,
                      maxLines: 1,
                      textAlign: TextAlign.center,
                      autocorrect: false,
                      decoration: InputDecoration(
                        focusColor: Colors.white,
                        labelText: 'Email',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5)),
                        prefixIcon: Icon(
                          Icons.arrow_right,
                          color: lock,
                          size: 30,
                        ),
                        suffixIcon: Icon(
                          Icons.arrow_left,
                          color: lock,
                          size: 30,
                        ),
                      ),
                    ),
                  ),ElasticInRight(
                    child: TextField(
                      onChanged: (value) {
                        email = value;
                      },
                      style: TextStyle(fontSize: 18, color: Colors.white),
                      keyboardType: TextInputType.emailAddress,
                      maxLines: 1,
                      textAlign: TextAlign.center,
                      autocorrect: false,
                      decoration: InputDecoration(
                        focusColor: Colors.white,
                        labelText: 'Email',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5)),
                        prefixIcon: Icon(
                          Icons.arrow_right,
                          color: lock,
                          size: 30,
                        ),
                        suffixIcon: Icon(
                          Icons.arrow_left,
                          color: lock,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(child: Image.asset("lib/images/lock2.png"))
          ],
        ),
      ),
    );
  }

  Widget registerScreen() {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBrown,
      body: SafeArea(
        child: manager(),
      ),
    );
  }
}
