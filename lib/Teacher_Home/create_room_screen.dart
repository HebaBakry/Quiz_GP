import 'package:flutter/material.dart';
import 'package:quiz_gp/Teacher_Home/room.dart';
import 'package:quiz_gp/Teacher_Home/room_screen.dart';

import '../Quiz screens/question_model.dart';
// import 'package:screen75/Teacher_Home/room.dart';
// import 'Teacher_Home/room_screen.dart';



class NewRoom extends StatefulWidget {
const NewRoom({super.key});

@override
NewRoomState createState() => NewRoomState();
}

class NewRoomState extends State<NewRoom> {
late TextEditingController nameController;
late TextEditingController passController;
List<TextEditingController> questionControllers = [];
List<List<TextEditingController>> choosesControllers = [];
late List<TextEditingController> answerControllers=[];
Color color = const Color(0xff82498d);
List<int> questionsNumber = [1];
int questNum = 1;

@override
  void dispose() {
  nameController.dispose();
  passController.dispose();
  questionControllers.forEach((element) {element.dispose();});
  choosesControllers.forEach((element) {element.forEach((element) {element.dispose();});});
  answerControllers.forEach((element) {element.dispose();});
    super.dispose();
  }


@override
  void initState() {
  nameController= TextEditingController();
  passController = TextEditingController();
    super.initState();
  }
@override
Widget build(BuildContext context) {
  questionsNumber.forEach((_){
    questionControllers.add(TextEditingController());
    choosesControllers.add([
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
      TextEditingController()
    ]);
    answerControllers.add(TextEditingController());
  });
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
          actions: [
            TextButton(onPressed: (){
              questNum++;
              questionsNumber.add(questNum);
              setState(() {
              });
            }, child: const Text('Add\nQuestion',style: TextStyle(color: Colors.white,),textAlign: TextAlign.center,))
          ],
      ),
      body: Padding(
      padding:  const EdgeInsets.fromLTRB(15, 15, 15, 15),
      child: SingleChildScrollView(
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
      const Text('Room Name:',style: TextStyle(fontSize: 24),),
      Padding(
      padding:  const EdgeInsets.only(top:5,bottom: 5),
      child:  TextField(
      controller: nameController,
      decoration:  const InputDecoration(
      enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(5)),
      borderSide: BorderSide(color: Colors.grey,width: 2)
      ),
      ),
      ),
      ),
        const Text('Password: ',style: TextStyle(fontSize: 24),),
        Padding(
          padding:  const EdgeInsets.only(top:5,bottom: 5),
          child:  TextField(
            controller: passController,
            decoration:  const InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  borderSide: BorderSide(color: Colors.grey,width: 2)
              ),
            ),
          ),
        ),
        Column(
        children : questionsNumber.map((e){
          int index = questionsNumber.indexOf(e);
         // print(index);
            return Card(
              elevation: 2,
              shape:  RoundedRectangleBorder(
                side: const BorderSide(
                  color: Colors.black38,
                ),
                borderRadius: BorderRadius.circular(10.0),

              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Text('Question${index+1}: ',style: const TextStyle(fontSize: 24),),
                    Padding(
                      padding:  const EdgeInsets.only(top:5,bottom: 5),
                      child:  TextField(
                        controller: questionControllers[index],
                        decoration:  const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                              borderSide: BorderSide(color: Colors.grey,width: 2)
                          ),
                        ),
                      ),
                    ),
                    const Text('Answer1: ',style: TextStyle(fontSize: 24),),
                    Padding(
                      padding:  const EdgeInsets.only(top:5,bottom: 5),
                      child:  TextField(
                        controller: choosesControllers[index][0],
                        decoration:  const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                              borderSide: BorderSide(color: Colors.grey,width: 2)
                          ),
                        ),
                      ),
                    ),
                    const Text('Answer2: ',style: TextStyle(fontSize: 24),),
                    Padding(
                      padding:  const EdgeInsets.only(top:5,bottom: 5),
                      child:  TextField(
                        controller: choosesControllers[index][1],
                        decoration:  const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                              borderSide: BorderSide(color: Colors.grey,width: 2)
                          ),
                        ),
                      ),
                    ),
                    const Text('Answer3: ',style: TextStyle(fontSize: 24),),
                    Padding(
                      padding:  const EdgeInsets.only(top:5,bottom: 5),
                      child:  TextField(
                        controller: choosesControllers[index][2],
                        decoration:  const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                              borderSide: BorderSide(color: Colors.grey,width: 2)
                          ),
                        ),
                      ),
                    ),
                    const Text('Answer4: ',style: TextStyle(fontSize: 24),),
                    Padding(
                      padding:  const EdgeInsets.only(top:5,bottom: 5),
                      child:  TextField(
                        controller: choosesControllers[index][3],
                        decoration:  const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                              borderSide: BorderSide(color: Colors.grey,width: 2)
                          ),
                        ),
                      ),
                    ),
                    const Text('Correct Answer: ',style: TextStyle(fontSize: 24),),
                    Padding(
                      padding:  const EdgeInsets.only(top:5,bottom: 5),
                      child:  TextField(
                        controller: answerControllers[index],
                        decoration:  const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                              borderSide: BorderSide(color: Colors.grey,width: 2)
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        )

      ]))),
      floatingActionButton:
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton.extended(
            onPressed: () {
              questionsNumber.removeAt(questionsNumber.length-1);
              setState(() {
              });
            },
            backgroundColor: Colors.red,
            label:  const Text('Remove Question',style: TextStyle(color: Colors.white),),
          ),
          FloatingActionButton(
          onPressed: () {
            List<String> dataTime = '${DateTime.now()}'.split(' ');
            List<QuestionModel> questions = [];
            int index = 0;
           questionsNumber.forEach((element) {
             questions.add(
                 QuestionModel(
                     question: questionControllers[index].text
                 , answers: {
                   choosesControllers[index][0].text : choosesControllers[index][0].text == answerControllers[index].text,
                   choosesControllers[index][1].text : choosesControllers[index][1].text == answerControllers[index].text,
                   choosesControllers[index][2].text : choosesControllers[index][2].text == answerControllers[index].text,
                   choosesControllers[index][3].text : choosesControllers[index][3].text == answerControllers[index].text
                 })
             );
             index++;
           });
            RoomScreen.rooms.add(
                Room(
                    name: nameController.text,
                    password: passController.text,
                    date:dataTime[0],
                    time: dataTime[1],
                    questions: questions,
                ),);
          setState(() {
            questionsNumber = [1];
            questNum = 1;
          });
          Navigator.pop(context);
          },
          backgroundColor: color,
          child:  const Text('Done',style: TextStyle(color: Colors.white),),
          ),

        ],
      ),
);
}

}