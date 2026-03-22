import 'package:flutter/material.dart';
import 'package:quiz_app2/controller/question_widget.dart';
import 'package:quiz_app2/model/list_of_questions.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });

    if (_counter > 2) {
      _counter = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    var questions = questionList;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            QuestionWidget(questions: questions, counter: _counter),
            ...(questions[_counter]['answers'] as List<String>)
                .map(
                  (answer) => buildElevatedButton(answer),
                )
                .toList(),
          ],
        ),
      ),
    );
  }

  ElevatedButton buildElevatedButton(String answer) {
    return ElevatedButton(
      onPressed: _incrementCounter,
      child: Text(
        answer,
        style: const TextStyle(
          fontSize: 30.0,
        ),
      ),
    );
  }
}
