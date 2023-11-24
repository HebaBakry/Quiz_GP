import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quiz_gp/Teacher_Home/room.dart';

import '../Student Home/room_screen_student.dart';

class QuestionScreen extends StatefulWidget {
  final Room room;
  final int index;
   const QuestionScreen({super.key,required this.room,required this.index});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {

  Color trueColor =  Colors.green;
  Color falseColor =  Colors.red;
  bool buttonPressed = false;
  Timer? timer1;
  Timer? timer2;
  int _counter = 30;

  void startTimer1(){
    timer1 = Timer.periodic(
        const Duration(seconds: 30),
            (_) {setState(() {
              widget.index < widget.room.questions.length -1 ?
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => QuestionScreen(
                    room: widget.room,
                    index: widget.index+1,
                  ),
                  )): Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const RoomScreenStudent(),));
            });
        });
  }

  void startTimer2() {
    const oneSec = Duration(seconds: 1);
    timer2 = Timer.periodic(oneSec, (timer) {
      setState(() {
        if (_counter > 0) {
          _counter--;
        } else {
          timer2?.cancel();
        }
      });
    });
  }
  @override
  void initState() {
    startTimer2();
    startTimer1();
    super.initState();
  }

  @override
  void dispose() {
    timer2?.cancel();
    timer1?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: const Color(0xff140a2d),
      body:  SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20,),
             Text('Question ${widget.index+1}/${widget.room.questions.length}\n00:$_counter',style: const TextStyle(fontSize: 30,color: Colors.white),textAlign: TextAlign.center,),
            const Divider(
              indent: 12,
            endIndent: 12,
            color: Colors.white,
              thickness: 2,
          ),
            Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: Text('${widget.room.questions[widget.index].question}',style: const TextStyle(fontSize: 33,color: Colors.white)),
            ),
            for (int i = 0; i < widget.room.questions[widget.index].answers!.length; i++)
              Container(
                width: double.infinity,
                height: 50.0,
                margin: const EdgeInsets.only(bottom: 20, left: 12, right: 12),
                child: RawMaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  fillColor: !buttonPressed? Colors.purple.shade100: (widget.room.questions[widget.index].answers!.values.toList()[i]? trueColor: falseColor),
                  onPressed: () async {
                    setState(() {
                        buttonPressed = true;
                      });
                      await Future.delayed(const Duration(seconds: 1));
                          widget.index < widget.room.questions.length -1 ?
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) => QuestionScreen(room: widget.room, index: widget.index+1,),
                              ))
                              :
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) => RoomScreenStudent(),));

                  },
                  child: Text(widget.room.questions[widget.index].answers!.keys.toList()[i]
                    ,style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                ),
              )
          ],
        ),
      ),
        floatingActionButton: widget.index < widget.room.questions.length -1 ?
      TextButton(
        onPressed: () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => QuestionScreen(
                room: widget.room,
                index: widget.index+1,
              ),
              ));
        },
        child: const Text('Next Question',style: TextStyle(color: Colors.white,fontSize: 18),),
      ):
      TextButton(
        onPressed: () {
        },
        child: const Text('Done',style: TextStyle(color: Colors.white,fontSize: 18),),
      )
    );
  }
}
