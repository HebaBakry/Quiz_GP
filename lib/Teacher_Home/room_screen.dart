import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quiz_gp/Teacher_Home/room.dart';

import 'create_room_screen.dart';
//import 'package:sizer/sizer.dart';



class RoomScreen extends StatefulWidget {
  const RoomScreen({super.key});
  static List<Room> rooms = [];
  @override
  State<RoomScreen> createState() => _RoomScreenState();

}



class _RoomScreenState extends State<RoomScreen> {
  Color color = const Color(0xff82498d);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color,
        //leading: const Icon(Icons.settings,color: Colors.white,),
        centerTitle: true,
        title: const Text('Rooms',style: TextStyle(color: Colors.white,fontSize: 25,
        ),),
        actions: [
          IconButton(
            tooltip: 'Add new room',
              onPressed: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) =>  const NewRoom())).then((_) => setState(() {}));;

              }, icon: Icon(Icons.add)
          )
        ],
        //backgroundColor: Colors.grey.shade900,
      ),
      body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Text('My Rooms',
                style:  TextStyle(
                  fontSize: 25,color: color,

                ),
                textAlign:TextAlign.start,),
              Expanded(
                  child: ListView(
                      children: List.generate(RoomScreen.rooms.length, (index) {
                        return Container(

                          margin: const EdgeInsets.all(10),
                          height: 80,
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            color: Colors.red,
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: ListTile(
                          ),
                        );
                      })
                  )
              ),

            ],
          )),
    );
  }
}

