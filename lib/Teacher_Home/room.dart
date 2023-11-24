import '../Quiz screens/question_model.dart';

class Room{
  String name;
  String date;
  String time;
  String password;
  List<QuestionModel> questions;


  Room({
    required this.name,
    required this.date,
    required this.time,
    required this.password,
    required this.questions,
  });
}