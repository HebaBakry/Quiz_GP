import 'package:flutter/material.dart';
import 'package:quiz_gp/Teacher_Home/room.dart';
import 'package:quiz_gp/Teacher_Home/room_screen.dart';
// import 'package:screen75/Teacher_Home/room.dart';
// import 'Teacher_Home/room_screen.dart';



class NewRoom extends StatefulWidget {
const NewRoom({super.key});

@override
NewRoomState createState() => NewRoomState();
}

class NewRoomState extends State<NewRoom> {
TextEditingController nameController = TextEditingController();
Color color = const Color(0xff82498d);

@override
Widget build(BuildContext context) {
  return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Create Room'),
          backgroundColor: color,
          leading: InkWell(
           child: const Icon(Icons.arrow_back_ios),
           onTap: (){
           Navigator.pop(context);},
          ),
      ),
      body: Padding(
      padding:  const EdgeInsets.fromLTRB(15, 15, 15, 15),
      child: SingleChildScrollView(
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
      const Text('Name',style: TextStyle(fontSize: 30),),
      Padding(
      padding:  const EdgeInsets.fromLTRB(0, 15, 0, 15),
      child:  TextField(
      controller: nameController,
      decoration:  const InputDecoration(
      enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(color: Colors.grey,width: 2)
      ),
      ),
      ),
      ),
      ]))),
      floatingActionButton: FloatingActionButton(
      onPressed: () {
        RoomScreen.rooms.add(Room(name: nameController.text,date: '${DateTime. now()}'));
      setState(() {
      });
      Navigator.pop(context);
      },
      backgroundColor: color,
      child:  const Text('Done',style: TextStyle(color: Colors.white),),
      ),
);
}

}