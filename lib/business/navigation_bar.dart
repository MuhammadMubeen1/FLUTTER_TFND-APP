
import 'package:flutter/material.dart';

import '../screens/chat_screen/chat_screen.dart';
import '../screens/event_screen/event_screen.dart';
import '../screens/home_screen.dart';
import '../screens/profile_screen.dart';
import 'Busines_home.dart';


class BussinessNavBar extends StatefulWidget {
  const BussinessNavBar({Key? key}) : super(key: key);

  @override
  State<BussinessNavBar> createState() => _BussinessNavBarState();
}

class _BussinessNavBarState extends State<BussinessNavBar> {
  int _currentIndex = 0;
  final List _pages = [
    const BusinessHome(),
    const ChatScreen(),
    const ProfileScreen(),

  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        selectedItemColor:  const Color(0xfff760b1),
        unselectedItemColor: Colors.grey,
        onTap: (v){
          setState(() {
            _currentIndex = v;
          });
        },
        items:  const [
          BottomNavigationBarItem(icon: Icon(Icons.business_sharp),label: "Business", ),
          BottomNavigationBarItem(icon: Icon(Icons.event),label: "Events"),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline),label: "Profile"),

        ],),
      body: _pages[_currentIndex],
    ),);
  }
}