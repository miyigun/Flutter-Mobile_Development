import 'package:flutter/material.dart';
import 'package:s_34_quiz_app/pages/answers.dart';
import 'package:s_34_quiz_app/pages/questions.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  FirstPageState createState() => FirstPageState();
}

class FirstPageState extends State<FirstPage>{
  var _questionIndex=0;

  void _answerQuestion(){
    setState(() {
      _questionIndex=_questionIndex+1;
    });

    if (_questionIndex>2) {
      _questionIndex=0;
    }
  }

  final _questions=[
    {
      'questionText': 'What\'s the meaning of Assuetude?',
      'answers': ['kiss', 'insolent', 'habit', 'half'],
    },
    {
      'questionText': 'What\'s the meaning of Disingenuous?',
      'answers': ['guilty', 'jovial', 'jocular', 'insincere'],
    },
    {
      'questionText': 'What\'s the meaning of Afflatus?',
      'answers': ['ghost', 'inspiration', 'lifeless', 'greedy'],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20.0),
        margin: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            children: [
              Questions(
                  handler: _questions[_questionIndex]['questionText'].toString(),
              ),
              ...(_questions[_questionIndex]['answers'] as List<String>)
              .map((answer){
                return Answers(yourAnswer: answer, answerQuestion: _answerQuestion);
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }
}