// import 'package:flutter/material.dart';
// void main() => runApp(const MyApp());
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(primarySwatch: Colors.amber),
//       home: const MyHome(),
//     );
//   }
// }
//
// class MyHome extends StatefulWidget {
//   const MyHome({super.key});
//
//   @override
//   State<MyHome> createState() => _MyHomeState();
// }
//
// class Step {
//   late String title;
//   late String body;
//   late bool isExpended;
//   Step({required this.title,required this.body,this.isExpended = false});
// }
//
//
// late int index = 0;
// class _MyHomeState extends State<MyHome>{
//   String value = 'Expend All';
//   List<Step> steps = [
//     Step(title: 'Step ${index++}: Contact us', body: 'Contact Simplife EG on\nsimplife.eg@gmail.com'),
//     Step(title: 'Step ${index++}: Sea a Course', body: 'Ask about all courses and select a one'),
//     Step(title: 'Step ${index++}: Reserve', body: 'Conform your reservation and get your group number'),
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//         appBar: AppBar(
//           centerTitle: true,
//           title:  const Text( 'Extension Panel',
//             style: TextStyle(
//                 fontSize: 25,color: Colors.amber
//             ),
//           ),
//           backgroundColor: Colors.black,
//           toolbarHeight: 70,
//         ),
//         backgroundColor: Colors.white,
//         body: SingleChildScrollView(
//           child:Column(
//             children: [
//               Padding(
//                   padding: const EdgeInsets.all(10),
//                   child:ElevatedButton(
//                     onPressed: (){
//                       for (var element in steps) {value == 'Expend All'? element.isExpended = true:element.isExpended = false;}
//                       setState(() {
//                         value == 'Expend All'?  value = 'Collapse All' : value = 'Expend All';
//                       });
//                     },
//                     style:  ButtonStyle(
//                       //padding: MaterialStateProperty.all(const EdgeInsets.all(10)),
//                         backgroundColor: MaterialStateProperty.all(Colors.black)
//                     ), child:  Text(value,style: const TextStyle(color: Colors.amber,fontSize: 20),),
//                   )),
//               ExpansionPanelList(
//                   expansionCallback: (int index,bool isExpended) {
//                     steps[index].isExpended = !isExpended;
//                     setState(() {});
//                   },
//                   children: steps.map<ExpansionPanel>((Step s){
//                     return ExpansionPanel(
//                         canTapOnHeader: true,
//                         headerBuilder: (BuildContext context, bool isExpanded) =>
//                             Padding(
//                                 padding: const EdgeInsets.all(10),
//                                 child: Text(s.title,style: const TextStyle(fontSize: 25,fontWeight: FontWeight.w500),)),
//                         body: Padding(
//                             padding: const EdgeInsets.all(10),
//                             child: Text('${s.body}\n',style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w400),textAlign: TextAlign.start,)
//                         ),
//                         backgroundColor: Colors.amber,
//                         isExpanded: s.isExpended
//
//                     );
//
//                   }).toList()
//               ),
//             ],
//           ) ,)
//
//     );
//   }
//
// }

import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'signup_screen.dart';
import 'type_of_account_screen.dart';
//import 'package:flutter_localizations/flutter_localizations.dart';
import 'Teacher_Home/teacher_home.dart';
import 'login_screen.dart';

void main() async{
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
  runApp(const MyApp());

}


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    initialization();
  }

  void initialization() async {
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {

    return   MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.purple),
        home: const Home()
    );
  }
}


//
//
//

// import 'package:flutter/material.dart';
// import 'quiz_store.dart';
// import 'package:rflutter_alert/rflutter_alert.dart';
//
// //we made global variable of QuizStore bcz we can access it in main anywhere like classes, functions, expanded widgets etc
// QuizStore quizStore = QuizStore();
//
// void main() => runApp(Quizzler());
//
// class Quizzler extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         backgroundColor: Colors.transparent,
//         appBar: AppBar(
//           centerTitle: true,
//           backgroundColor: Colors.purpleAccent.shade700,
//           title: Text(
//             'Quiz App',
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: 25.0,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//         body: SafeArea(
//           //TODO background image container
//           child: Container(
//             padding: EdgeInsets.symmetric(horizontal: 10.0),
//             decoration: BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage("images/Pic.jpg"),
//                 fit: BoxFit.cover,
//               ),
//             ),
//             child: Padding(
//               padding: EdgeInsets.symmetric(horizontal: 10.0),
//               child: QuizPage(),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class QuizPage extends StatefulWidget {
//   @override
//   _QuizPageState createState() => _QuizPageState();
// }
//
// class _QuizPageState extends State<QuizPage> {
//   int right = 0;
//   int wrong = 0;
//   int score = 0;
//   //we create list of icon bcz we don't create multiple Icons widgets for every questions
//   List<Icon> scoreKeeper = [];
//
//   //TODO here we made function that check answer is either true or false
//   void checkAnswer(bool userPickedAnswer) {
//     bool? correctAnswer = quizStore.getCorrectAnswer();
//     setState(() {
//       if (quizStore.isFinished() == true) {
//         //TODO below if else will check last question when it return then display alert message
//         if (userPickedAnswer == correctAnswer) {
//           right++;
//           score += 10; //assignment addition operator use
//           scoreKeeper.add(
//             Icon(
//               Icons.check,
//               color: Colors.green,
//             ),
//           );
//         } else {
//           wrong++;
//           scoreKeeper.add(
//             Icon(
//               Icons.close,
//               color: Colors.red,
//             ),
//           );
//         }
//         //we write context because we run it in this same class
//         Alert(
//           context: context,
//           title: 'Quiz Finished',
//           desc: 'Correct is: $right | Wrong is: $wrong\nScore is: $score/130',
//         ).show();
//         quizStore.reset();
//         scoreKeeper = [];
//         right = 0;
//         wrong = 0;
//         score = 0;
//       } else {
//         if (userPickedAnswer == correctAnswer) {
//           right++;
//           score += 10; //assignment addition operator use
//           scoreKeeper.add(
//             Icon(
//               Icons.check,
//               color: Colors.green,
//             ),
//           );
//         } else {
//           wrong++;
//           scoreKeeper.add(
//             Icon(
//               Icons.close,
//               color: Colors.red,
//             ),
//           );
//         }
//         quizStore.nextQuestion();
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       crossAxisAlignment: CrossAxisAlignment.stretch,
//       children: [
//         //TODO total questions and marks
//         Expanded(
//           child: Padding(
//             padding: EdgeInsets.all(10.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   'Total questions are 13 ... Each has 10 marks',
//                   style: TextStyle(
//                     fontSize: 15.0,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         //TODO right and wrong
//         Expanded(
//           child: Padding(
//             padding: EdgeInsets.all(10.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   'Right: $right',
//                   style: TextStyle(
//                     fontSize: 25.0,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.greenAccent.shade700,
//                   ),
//                 ),
//                 SizedBox(
//                   width: 10.0,
//                 ),
//                 Text(
//                   'Wrong: $wrong',
//                   style: TextStyle(
//                     fontSize: 25.0,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.redAccent.shade700,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         Row(
//           children: scoreKeeper,
//         ),
//         //TODO get text
//         Expanded(
//           flex: 5,
//           child: Padding(
//             padding: EdgeInsets.all(10.0),
//             child: Center(
//               child: Text(
//                 quizStore.getQuestionText()!,
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   fontSize: 25.0,
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//           ),
//         ),
//         //TODO true and false button
//         Row(
//           children: [
//             Expanded(
//               child: Padding(
//                 padding: EdgeInsets.all(30.0),
//                 child:ElevatedButton(
//                   // color: Colors.purpleAccent.shade700,
//                   // splashColor: Colors.greenAccent.shade700,
//                   child: Text(
//                     'True',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 20.0,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   onPressed: () {
//                     checkAnswer(true);
//                     //The user picked true.
//                   },
//                 ),
//               ),
//             ),
//             Expanded(
//               child: Padding(
//                 padding: EdgeInsets.all(30.0),
//                 child: ElevatedButton(
//                   // color: Colors.purpleAccent.shade700,
//                   // splashColor: Colors.redAccent.shade700,
//                   child: Text(
//                     'False',
//                     style: TextStyle(
//                       fontSize: 20.0,
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   onPressed: () {
//                     checkAnswer(false);
//                     //The user picked false.
//                   },
//                 ),
//               ),
//             ),
//           ],
//         )
//       ],
//     );
//   }
// }

