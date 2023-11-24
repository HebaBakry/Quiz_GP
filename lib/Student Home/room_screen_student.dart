
import 'package:flutter/material.dart';
import 'package:quiz_gp/Teacher_Home/room.dart';

import '../Quiz screens/question_model.dart';
import '../Quiz screens/question_screen.dart';
import '../Quiz screens/quiz_screen.dart';
import '../Teacher_Home/room_screen.dart';
//import 'package:sizer/sizer.dart';



class RoomScreenStudent extends StatefulWidget {
  const RoomScreenStudent({super.key});
  static List<Room> rooms = [];
  @override
  State<RoomScreenStudent> createState() => _RoomScreenStudentState();

}



class _RoomScreenStudentState extends State<RoomScreenStudent> {
  late TextEditingController nameController;
  late TextEditingController passController;
  Color color = const Color(0xff82498d);

  @override
  void initState() {
    nameController= TextEditingController();
    passController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
   nameController.dispose();
   passController.dispose();
    super.dispose();
  }

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
              tooltip: 'Enter to new room',
              onPressed: (){
                showAlertDialogNewRoom(context);
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
                      children: List.generate(RoomScreenStudent.rooms.length, (index) {
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
                            title: Text(RoomScreenStudent.rooms[index].name,style: const TextStyle(fontSize: 20),),
                            subtitle: Text(RoomScreenStudent.rooms[index].date,),
                            trailing: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(RoomScreenStudent.rooms[index].time.substring(0,8),),
                                  InkWell(
                                    child: const Icon(Icons.delete,color: Colors.red,),
                                    onTap: (){
                                      RoomScreenStudent.rooms.removeAt(index);
                                      setState(() {
                                      });
                                    },
                                  )
                                ]
                            ),
                            onTap: (){
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => QuizScreen(
                                    room: RoomScreen.rooms[index],
                                    index: 0,
                                  )));
                            },),

                        );
                      })
                  )
              ),
            ],
          )
      ),
    );
  }

  showAlertDialogNewRoom(BuildContext context) {
    showDialog(context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.purple.shade700,
            icon: const Icon(Icons.add_alert,size: 40,),
            iconColor: Colors.white,
            title: const Text('Enter to Quiz'),
            titleTextStyle: const TextStyle(color: Colors.white,fontSize: 20),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Please enter room name and password.'
                  ,style: TextStyle(color: Colors.white,fontSize: 20),),
            Padding(
              padding:  const EdgeInsets.only(top:5,bottom: 5),
              child:  TextField(
                controller: nameController,
                decoration:  const InputDecoration(
                  fillColor: Colors.white,
                  hintText: 'Enter Room Name',
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      borderSide: BorderSide(color: Colors.white,width: 2)
                  ),
                ),
              ),
            ),
            Padding(
              padding:  const EdgeInsets.only(top:5,bottom: 5),
              child:  TextField(
                controller: passController,
                decoration:  const InputDecoration(
                  hintText: 'Enter Room Password',
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      borderSide: BorderSide(color: Colors.white,width: 2)
                  ),
                ),
              ),
            )]),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    shape:  MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ))),
                child: const Text(
                  'Cancel', style: TextStyle(fontSize: 20, color: Colors.purple),
                ),
              ),
              TextButton(
                onPressed: () {
                  bool notFound = true;
                  for(int i =0; i < RoomScreen.rooms.length;i++){
                    if(RoomScreen.rooms[i].name == nameController.text){
                      if(RoomScreen.rooms[i].password == passController.text) {
                        notFound = false;
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => QuizScreen(
                              room: RoomScreen.rooms[i],
                              index: 0,
                            )));
                      }
                    }
                  }
                 // Navigator.pop(context);
                  if(notFound) showAlertDialogError(context);
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    shape:  MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ))),
                child: const Text(
                  'Enter', style: TextStyle(fontSize: 20, color: Colors.purple),
                ),
              )
            ],
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15))
            ),
          );
        });
  }

  showAlertDialogError(BuildContext context) {
    showDialog(context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            icon: const Icon(Icons.error,size: 40,),
            iconColor: Colors.red,
            title: const Text('Room Not Found'),
            titleTextStyle: const TextStyle(color: Colors.red,fontSize: 20),
            content: const Text('Please enter correct room name or password.'
              ,style: TextStyle(color: Colors.black,fontSize: 20),),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.purple),
                    shape:  MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ))),
                child: const Text(
                  'ok', style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              )
            ],
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15))
            ),
          );
        });
  }
}

