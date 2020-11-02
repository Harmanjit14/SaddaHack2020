import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:our_world/color.dart';
import 'package:our_world/loginScreen.dart';

int i = 0;
String email;
String password;

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> with ColorFile {
  // ignore: missing_return
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20),
                  child: IconButton(
                    splashColor: orange,
                    iconSize: 30,
                    icon: Icon(
                      FontAwesomeIcons.chevronLeft,
                      color: lock,
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => Screen1()));
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(20),
                  child: Text(
                    "Login Here!",
                    style: TextStyle(
                        fontSize: 40,
                        color: lock,
                        letterSpacing: -2,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                children: [
                  ElasticInLeft(
                    child: TextField(
                      onChanged: (value) {
                        email = value;
                      },
                      style: TextStyle(fontSize: 18, color: darkBrown),
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
                  SizedBox(
                    height: 15,
                  ),
                  ElasticInLeft(
                    child: TextField(
                      onChanged: (value) {
                        email = value;
                      },
                      style: TextStyle(fontSize: 18, color: darkBrown),
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      obscuringCharacter: '*',
                      maxLines: 1,
                      textAlign: TextAlign.center,
                      autocorrect: false,
                      decoration: InputDecoration(
                        // focusCoharlor: Colors.white,
                        labelText: 'Password',
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
            Container(
              width: 200,
              margin: EdgeInsets.only(left: 20, right: 20, bottom: 5, top: 10),
              child: OutlineButton(
                borderSide: BorderSide(width: 2, color: darkBrown),
                padding: EdgeInsets.only(top: 15, bottom: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Lets Go",
                      style: TextStyle(
                          color: darkBrown,
                          fontWeight: FontWeight.bold,
                          fontSize: 23),
                    ),
                    SizedBox(width: 7),
                    Icon(FontAwesomeIcons.arrowRight),
                  ],
                ),
                splashColor: orange,
                highlightedBorderColor: darkBrown,
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => Login()));
                },
              ),
            ),
            Container(
                width: MediaQuery.of(context).size.width,
                child: Image.asset("lib/images/tree.gif")),
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
      backgroundColor: Colors.white,
      body: SafeArea(
        child: manager(),
      ),
    );
  }
}
