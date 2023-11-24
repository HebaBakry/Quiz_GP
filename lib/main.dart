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
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:quiz_gp/Quiz%20screens/question_model.dart';
import 'Quiz screens/question_screen.dart';
import 'Student Home/student_home.dart';
import 'Teacher_Home/create_room_screen.dart';
import 'Teacher_Home/room.dart';
import 'Teacher_Home/room_screen.dart';
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
    FlutterNativeSplash.remove();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return   MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
          debugShowCheckedModeBanner: false,
          home:  const StudentHome()
        ); // MaterialApp
  }
}
