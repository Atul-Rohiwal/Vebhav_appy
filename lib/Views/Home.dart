import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/Products/Cart_Details.dart';
import 'package:untitled2/Providers/User.dart';
import 'package:untitled2/Views/Chats.dart';
import 'package:untitled2/Views/Favourite_Screen.dart';
import 'package:untitled2/Products/Home_screen.dart';
import 'package:untitled2/Products/Home_screen.dart';
import 'package:untitled2/Views/Drawer.dart';
import 'package:untitled2/Views/Profile/Profile_screen.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  GlobalKey<ScaffoldState> Scaffoldkey = GlobalKey<ScaffoldState>();
  var _currentIndex = 0;
  List Screens = [
    Home_Screen(),
    Search_Screen(),
    Chats(),
    Profile(),

  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<User>(builder: (context, User, _) {
      return Scaffold(

        body: Screens[_currentIndex], // Use the selected screen based on the current index
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.red,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
              backgroundColor: Colors.red,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              label: 'Chats',
              backgroundColor: Colors.red
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
              backgroundColor: Colors.red
            ),
          ],
        ),

      );
    });
  }
}
