import 'package:flutter/material.dart';
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
            //TODO :NowPlayingMini(),
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
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container(
      
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
    return Container(
      
    );
  }
}
class Rules extends StatefulWidget {
  @override
  _RulesState createState() => _RulesState();
}

class _RulesState extends State<Rules> {
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}
