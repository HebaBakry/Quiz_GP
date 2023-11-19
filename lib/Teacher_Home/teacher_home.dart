import 'package:flutter/material.dart';
import 'package:quiz_gp/Teacher_Home/profile.dart';
import 'package:quiz_gp/Teacher_Home/room_screen.dart';

class Home extends StatefulWidget{
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();

}

class _HomeState extends State<Home> {
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
      // bottomNavigationBar: BottomAppBar(
      //   //height: 60,
      //   shape: const CircularNotchedRectangle(),
      //   color: Colors.teal,
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceAround,
      //     children: [
      //       IconButton(
      //           color:selectIndex ==0? Colors.white: Colors.grey.shade400,
      //           tooltip: 'Relatives',
      //           onPressed:(){
      //             setState(() {
      //               selectIndex = 0;
      //             });
      //           },
      //           icon:  const Icon(Icons.people,)
      //       ),
      //       IconButton(
      //           color: selectIndex ==1? Colors.white: Colors.grey.shade400,
      //           focusColor: Colors.white,
      //           tooltip: 'Profile',
      //           onPressed:(){
      //             setState(() {
      //               selectIndex = 1;
      //             });
      //           },
      //           icon: const Icon(Icons.account_circle)
      //       ),
      //     ],
      //   ),
      // ),
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