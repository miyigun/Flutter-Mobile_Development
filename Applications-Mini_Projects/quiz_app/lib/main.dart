import 'package:flutter/material.dart';
import 'package:s_34_quiz_app/pages/first_page.dart';

void main() {
  runApp(const QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Quiz App',
      debugShowCheckedModeBanner: false,
      home: FirstPage(),
    );
  }

}
