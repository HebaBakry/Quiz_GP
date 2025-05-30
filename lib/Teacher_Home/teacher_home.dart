import 'package:flutter/material.dart';
import 'package:quiz_gp/Teacher_Home/profile.dart';
import 'package:quiz_gp/Teacher_Home/room_screen.dart';

class TeacherHome extends StatefulWidget{
  const TeacherHome({super.key});

  @override
  State<TeacherHome> createState() => _TeacherHomeState();

}

class _TeacherHomeState extends State<TeacherHome> {
  Color color = const Color(0xff82498d);
  int selectIndex = 0;
  List<Widget> screens = [
    RoomScreen(),
    const ProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      body: screens[selectIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey.shade300,
        backgroundColor: color,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.people),label: 'Rooms'),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle),label: 'Profile'),
        ],
        onTap: (index){
          selectIndex = index;
          setState(() {
          });
        },
      ),
    );
  }

}