import 'package:flutter/material.dart';
import 'package:quiz_gp/Student%20Home/room_screen_student.dart';
import 'package:quiz_gp/Teacher_Home/profile.dart';
import 'package:quiz_gp/Teacher_Home/room_screen.dart';

class StudentHome extends StatefulWidget{
  const StudentHome({super.key});

  @override
  State<StudentHome> createState() => _StudentHomeState();

}

class _StudentHomeState extends State<StudentHome> {
  Color color = const Color(0xff82498d);
  int selectIndex = 0;
  List<Widget> screens = [
    const RoomScreenStudent(),
    const ProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      body: screens[selectIndex],
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