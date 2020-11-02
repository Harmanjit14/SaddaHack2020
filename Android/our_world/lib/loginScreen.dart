import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:our_world/color.dart';

class Screen1 extends StatelessWidget with ColorFile {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Screen1Body(),
    );
  }
}

class Screen1Body extends StatelessWidget with ColorFile {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            // width: MediaQuery.of(context).size.width,
            child: TextLiquidFill(
              boxHeight: 150,
              waveDuration: Duration(milliseconds: 1000),
              loadDuration: Duration(seconds: 5),
              boxWidth: MediaQuery.of(context).size.width,
              text: 'RECYCLER',
              waveColor: myTeal,
              boxBackgroundColor: Colors.white,
              textStyle: TextStyle(
                  fontSize: 70.0,
                  letterSpacing: -2,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            // RichText(
            //   //Don’t throw away, recycle for another day.
            //   maxLines: 4,
            //   text: TextSpan(
            //     text: 'Don\'t ',
            //     style: TextStyle(
            //         fontSize: 25, color: darkBrown, letterSpacing: -0.5),
            //     children: [
            //       TextSpan(
            //           text: 'throw',
            //           style: TextStyle(fontWeight: FontWeight.bold)),
            //       TextSpan(
            //         text: ' recycle for another',
            //       ),
            //       TextSpan(
            //           text: ' Day',
            //           style: TextStyle(fontWeight: FontWeight.bold))
            //     ],
            //   ),
            // ),
          ),
          Expanded(
                      child: Container(
              child: Image.asset(
                'lib/images/pic3.png',
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top:10,bottom: 10),
              margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.topRight,
              child: IconButton(
                  splashColor: orange,
                  color: darkBrown,
                  iconSize: 40,
                  onPressed: () {},
                  icon: Icon(FontAwesomeIcons.chevronRight))),
        ]),
      ),
    );
  }
}
