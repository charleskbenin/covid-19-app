import 'package:covid19_update/main.dart';
import 'package:covid19_update/models/function.dart';
import 'package:covid19_update/screens/statistic_page.dart';
import 'package:flutter/material.dart';

import 'home_screen.dart';

class NavBar extends StatefulWidget {
  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int currentIndex = 0;

  List pages=[
    HomeScreen(),
    MyStatPage()
  ];

  ontap(int selectedItem){
    setState(() {
          currentIndex = selectedItem;
        });
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: pages.length,
      child: Scaffold(
        body: pages[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Color(0xff999FBF),
          iconSize: 30,
          currentIndex: currentIndex,
          onTap: ontap,
          elevation: 0.00,
          items: [
            BottomNavigationBarItem(
              activeIcon: myactiveIcon(Icons.home),
              label: "",
              icon: Icon(Icons.home)
            ),
             BottomNavigationBarItem(
               label: "",
               icon: Icon(Icons.home)),
               BottomNavigationBarItem(label: "", icon: Icon(Icons.home)),
               BottomNavigationBarItem(label: "", icon: Icon(Icons.home))
          ],
        ),
        
      ),
    );
  }
}

