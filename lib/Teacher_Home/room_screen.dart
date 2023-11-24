
import 'package:flutter/material.dart';
import 'package:quiz_gp/Teacher_Home/room.dart';

import '../Quiz screens/question_model.dart';
import '../Quiz screens/question_screen.dart';
import '../Quiz screens/quiz_screen.dart';
import 'create_room_screen.dart';
//import 'package:sizer/sizer.dart';

class RoomScreen extends StatefulWidget {
  const RoomScreen({super.key});
  static List<Room> rooms = [Room(
      name: 'Quiz1',
      date: '23/11/2023',
      time: '20:22:33:333',
      password: '1234',
      questions: [
        QuestionModel(question: 'How old are you?', answers: {'1':true,'2':false,'3':false,'4':false},),
        QuestionModel(question: 'How old are you?', answers: {'1':true,'2':false,'3':false,'4':false})
      ]

  ),];
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
                    MaterialPageRoute(builder: (context) =>  const NewRoom())).then((_) => setState(() {}));
              }, icon: const Icon(Icons.add)
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
                          margin: const EdgeInsets.all(5),
                          height: 80,
                          width: double.infinity,
                          child:  ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Colors.purple.shade200,
                              child: Text('${index+1}',
                                style: const TextStyle(color: Colors.white,fontSize: 16),),
                            ),
                            title: Text(RoomScreen.rooms[index].name,style: const TextStyle(fontSize: 20),),
                            subtitle: Text(RoomScreen.rooms[index].date,),
                            trailing: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(RoomScreen.rooms[index].time.substring(0,8),),
                                  InkWell(
                                    child: const Icon(Icons.delete,color: Colors.red,),
                                    onTap: (){
                                      RoomScreen.rooms.removeAt(index);
                                      setState(() {
                                      });
                                    },
                                  )
                        ]
                          ),
                          onTap: (){
                          },),

                        );
                      })
                  )
              ),

            ],
          )),
    );
  }
}

