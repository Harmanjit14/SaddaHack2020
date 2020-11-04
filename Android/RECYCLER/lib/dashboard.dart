// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'dart:js';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:RECYCLER/color.dart';
import 'package:RECYCLER/firebase.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

enum _SelectedTab { home, likes, search, profile }

class _DashboardState extends State<Dashboard> {
  var _selectedTab = _SelectedTab.home;
  int index = 0;
  Widget changeState() {
    switch (index) {
      case 0:
        {
          return Home();
        }
        break;
      case 1:
        {
          return ActiveOffers();
        }
        break;
      case 2:
        {
          return Rules();
        }
        break;
      case 3:
        {
          return Profile();
        }
        break;
      default:
        {
          return Home();
        }
    }
  }

  void _handleIndexChanged(int i) {
    setState(() {
      _selectedTab = _SelectedTab.values[i];
      setState(() {
        index = i;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        //height: 100,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SalomonBottomBar(
              currentIndex: _SelectedTab.values.indexOf(_selectedTab),
              onTap: _handleIndexChanged,
              items: [
                /// Home
                SalomonBottomBarItem(
                  icon: Icon(Icons.home_outlined),
                  title: Text("Home"),
                  selectedColor: Colors.blue[700],
                ),

                /// Likes
                SalomonBottomBarItem(
                  icon: Icon(Icons.list_alt_outlined),
                  title: Text("Active Offers"),
                  selectedColor: Colors.pink,
                ),

                /// Search
                SalomonBottomBarItem(
                  icon: Icon(Icons.info),
                  title: Text("Information"),
                  selectedColor: Colors.orange,
                ),

                /// Profile
                SalomonBottomBarItem(
                  icon: Icon(Icons.person),
                  title: Text("Profile"),
                  selectedColor: Colors.teal,
                ),
              ],
            ),
          ],
        ),
      ),
      body: changeState(),
    );
  }
}

class Home extends StatefulWidget with FirebaseClass {
  Home() {
    // getWastePics();
  }
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with ColorFile, FirebaseClass {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                // width: MediaQuery.of(context).size.width,
                alignment: Alignment.centerLeft,
                child: Text(
                  "Welcome Back",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.normal,
                    letterSpacing: -1.5,
                    color: Colors.black,
                  ),
                ),
              ),
              Container(
                // width: MediaQuery.of(context).size.width,
                alignment: Alignment.centerLeft,
                child: Text(
                  name,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                height: 300,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  children: [
                    Row(
                      children: [
                        Stack(
                          children: [
                            Container(
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: Image.network(
                                    "https://images.newindianexpress.com/uploads/user/imagelibrary/2019/12/28/w1200X800/Now_.jpg",
                                    fit: BoxFit.cover,
                                  )),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: myTeal,
                              ),
                              height: 300,
                              width: MediaQuery.of(context).size.width * 0.85,
                            ),
                            Container(
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "My Bio-Waste Points",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: -1,
                                          fontSize: 30),
                                    ),
                                    SizedBox(height: 7),
                                    Text(
                                      bio.toString(),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: -1,
                                          fontSize: 30),
                                    ),
                                  ]),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Color(0xff0EA8A8).withOpacity(0.6),
                              ),
                              height: 300,
                              width: MediaQuery.of(context).size.width * 0.85,
                            ),
                          ],
                        ),
                        SizedBox(width: 10),
                      ],
                    ),
                    Row(
                      children: [
                        Stack(
                          children: [
                            Container(
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: Image.network(
                                    "https://www.scidev.net/objects_store/thumbnail/71201187C8802D88C35733675E169F6B.jpg",
                                    fit: BoxFit.cover,
                                  )),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: myTeal,
                              ),
                              height: 300,
                              width: MediaQuery.of(context).size.width * 0.85,
                            ),
                            Container(
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "My Non Bio-Waste Points",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: -1,
                                          fontSize: 30),
                                    ),
                                    SizedBox(height: 7),
                                    Text(
                                      nonBio.toString(),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: -1,
                                          fontSize: 30),
                                    ),
                                  ]),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Color(0xff0EA8A8).withOpacity(0.6),
                              ),
                              height: 300,
                              width: MediaQuery.of(context).size.width * 0.85,
                            ),
                          ],
                        ),
                        SizedBox(width: 10),
                      ],
                    ),
                    Row(
                      children: [
                        Stack(
                          children: [
                            Container(
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: Image.network(
                                    "https://previews.123rf.com/images/terra2024/terra20241402/terra2024140200075/25925687-bio-waste-for-compost-earth.jpg",
                                    fit: BoxFit.cover,
                                  )),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: myTeal,
                              ),
                              height: 300,
                              width: MediaQuery.of(context).size.width * 0.85,
                            ),
                            Container(
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "My Other-Waste Points",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: -1,
                                          fontSize: 30),
                                    ),
                                    SizedBox(height: 7),
                                    Text(
                                      other.toString(),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: -1,
                                          fontSize: 30),
                                    ),
                                  ]),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Color(0xff0EA8A8).withOpacity(0.6),
                              ),
                              height: 300,
                              width: MediaQuery.of(context).size.width * 0.85,
                            ),
                          ],
                        ),
                        SizedBox(width: 10),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "My Active Offers",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 15),
              Container(
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection("transactions")
                      .where("email", isEqualTo: "$email")
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final text = snapshot.data.docs;

                      List<Widget> allUserOff = [];
                      for (var confession in text) {
                        final name = confession.get('name');
                        final quantity = confession.get('quantity');
                        final type = confession.get('type');
                        final describe = confession.get('describe');
                        final time = confession.get('time');
                        final messageWid =
                            singleOffer(name, quantity, type, describe, time);
                        allUserOff.add(messageWid);
                      }
                      return Expanded(
                        child: ListView(
                          addRepaintBoundaries: true,
                          shrinkWrap: true,
                          children: allUserOff,
                        ),
                      );
                    } else
                      return Container(
                        child: Text("Loading..."),
                      );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget singleOffer(String name, String kg, String type, String des, int time) {
  return Container(
    height: 100,
    child: Card(
      elevation: 0,
      color: Colors.teal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(15),
                child: Image.asset("lib/images/money.png"),
              ),
              Text(name),
              SizedBox(width: 10),
              Text(type),
              SizedBox(width: 10),
              Text(kg),
              SizedBox(width: 10),
            ],
          ),
          Container(
            width: 70,
              margin: EdgeInsets.only(left: 20),
              child: IconButton(
                  icon: Icon(FontAwesomeIcons.times), onPressed: () {}))
        ],
      ),
    ),
  );
}

Widget allOffer(String name, String kg, String type, String des, int time) {
  return Container(
    height: 100,
    child: Card(
      elevation: 0,
      color: Colors.pink.withOpacity(0.6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(15),
                child: Image.asset("lib/images/money.png"),
              ),
              Text(name),
              SizedBox(width: 10),
              Text(type),
              SizedBox(width: 10),
              Text(kg),
              SizedBox(width: 10),
            ],
          ),
          Container(
            width: 70,
            alignment: Alignment.center,
              margin: EdgeInsets.only(left: 20),
              child: IconButton(
                  icon: Icon(FontAwesomeIcons.times), onPressed: () {}))
        ],
      ),
    ),
  );
}

class ActiveOffers extends StatefulWidget {
  @override
  _ActiveOffersState createState() => _ActiveOffersState();
}

class _ActiveOffersState extends State<ActiveOffers> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.all(20),
            child: Text(
              "All Active Offers",
              style: TextStyle(
                  fontSize: 30, fontWeight: FontWeight.bold, letterSpacing: -1),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection("transactions")
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final text = snapshot.data.docs;

                  List<Widget> allUserOff = [];
                  for (var confession in text) {
                    final name = confession.get('name');
                    final quantity = confession.get('quantity');
                    final type = confession.get('type');
                    final describe = confession.get('describe');
                    final time = confession.get('time');
                    final messageWid =
                        allOffer(name, quantity, type, describe, time);
                    allUserOff.add(messageWid);
                  }
                  return Expanded(
                    child: ListView(
                      addRepaintBoundaries: true,
                      shrinkWrap: true,
                      children: allUserOff,
                    ),
                  );
                } else
                  return Container(
                    child: Text("Loading..."),
                  );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      margin: EdgeInsets.all(20),
      child: Column(
        children: [
          Container(
            child: Text(
              "PROFILE",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                letterSpacing: -1.5,
                color: Colors.black,
              ),
            ),
          )
        ],
      ),
    ));
  }
}

class Rules extends StatefulWidget {
  @override
  _RulesState createState() => _RulesState();
}

class _RulesState extends State<Rules> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
