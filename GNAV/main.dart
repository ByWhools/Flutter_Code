import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';


class _HomeState extends State<Home> {
  int _selectIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: SafeArea(
          child: GNav(
            rippleColor: Colors.blue,
            hoverColor: Colors.black,
            gap: 8,
            activeColor: Colors.black,
            iconSize: 24,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 9),
            duration: Duration(milliseconds: 400),
            tabBackgroundColor: Colors.black,
            tabs: const [
              GButton(
                icon: Icons.person,
                iconColor: Colors.black,
                iconActiveColor: Colors.white,
                text: 'Profile',
                textColor: Colors.white,
              ),
              GButton(
                icon: Icons.home,
                iconColor: Colors.black,
                iconActiveColor: Colors.white,
                text: 'Home',
                textColor: Colors.white,
              ),
              GButton(
                icon: Icons.tab,
                iconColor: Colors.black,
                iconActiveColor: Colors.white,
                text: 'Tabs',
                textColor: Colors.white,
              ),
              GButton(
                icon: Icons.settings,
                iconColor: Colors.black,
                iconActiveColor: Colors.white,
                text: 'Settings',
                textColor: Colors.white,
              ),
            ],
            selectedIndex: _selectIndex,
            onTabChange: (index) {
              setState(() {
                _selectIndex = index;
              });
            },
          ),
        ),
      ),
      body: Container(
        color: Colors.black,
        child: getSelectedWidget(index: _selectIndex),
      ),
    );
  }
}

Widget getSelectedWidget({required int index}) {
  Widget widget;
  switch (index) {
    case 0:
      widget = Container(
        alignment: Alignment.center,
        color: Colors.red,
        child: Text("Profile"),
      );
      break;
    case 1:
      widget = Container(
        alignment: Alignment.center,
        color: Colors.blue,
        child: Text("Home"),
      );
      break;
    case 2:
      widget = Container(
        alignment: Alignment.center,
        color: Colors.green,
        child: Text("Tabs"),
      );
      break;
    case 3:
      widget = Container(
        alignment: Alignment.center,
        color: Colors.yellow,
        child: Text("Settings"),
      );
      break;
    default:
      widget = Container(
        color: Colors.white,
        child: Text("Settings"),
      );
      break;
  }
  return widget;
}
