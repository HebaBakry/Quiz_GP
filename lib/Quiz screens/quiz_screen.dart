import 'package:flutter/material.dart';
import 'package:quiz_gp/Quiz%20screens/question_screen.dart';

import '../Teacher_Home/room.dart';
import '../Teacher_Home/room_screen.dart';

class QuizScreen extends StatefulWidget {
  final Room room;
  final int index;
  const QuizScreen({super.key,required this.room,required this.index});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         elevation: 0,
         backgroundColor: const Color(0xff140a2d),
        centerTitle: true,
         title: Text(widget.room.name,style: const TextStyle(
           fontSize: 22
         ),),
         leading: IconButton(
           icon: Icon(Icons.arrow_back_rounded),
           onPressed: (){
             Navigator.pop(context);
           },
         ),
       ),
       body:  Container(
       decoration: const BoxDecoration(
          image: DecorationImage(
          image: AssetImage("assets/backgroundstartquiz2.jpg"),
          fit: BoxFit.cover,
          )),
        child:  Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical:0 ),
                 child: Text('let\'s start quiz now!!',style: TextStyle(
                  color: Colors.yellow.shade300,
                  fontSize: 40
              ),
                 textAlign: TextAlign.center,),
               ),
              const SizedBox(height: 200,),
              Container(
                alignment: Alignment.center,
               // margin: const EdgeInsets.only(top: 10),
                width: 250,
                height: 50,
                decoration:  BoxDecoration(
                    border: Border.fromBorderSide(
                        BorderSide(
                            color: Colors.yellow.shade300,
                            width: 2
                        )
                    ),
                    color: Colors.yellow.shade300,
                    borderRadius: const BorderRadius.all(Radius.circular(20))
                ),
                child: TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => QuestionScreen(
                          room: widget.room,
                          index: 0
                        )));
                  },
                  child: const Text('Start', style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),),),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
