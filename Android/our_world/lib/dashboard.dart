import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:our_world/color.dart';
import 'package:our_world/firebase.dart';
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
    getPoints();
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
          child: ListView(
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
                  // margin: EdgeInsets.fromLTRB(20, 5, 20, 0),
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemBuilder: (BuildContext context, int index) {
                        // print(pics[0]);
                        // TODO: PICS LGAANE HAI EK BAAR

                        return Row(
                          children: [
                            Container(
                              // child: Image.network(pics[1]),
                              child: Center(
                                child: Text("Bio-Waste Points : $bio"),
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: myTeal,
                              ),
                              height: 300,
                              width: MediaQuery.of(context).size.width * 0.85,
                            ),
                            SizedBox(width: 10),
                          ],
                        );
                      }),
                ),
              ]),
        ),
      ),
    );
  }
}

class ActiveOffers extends StatefulWidget {
  @override
  _ActiveOffersState createState() => _ActiveOffersState();
}

class _ActiveOffersState extends State<ActiveOffers> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text("Here")),
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
