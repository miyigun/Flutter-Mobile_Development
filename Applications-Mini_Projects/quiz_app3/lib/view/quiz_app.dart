import 'package:flutter/material.dart';
import 'package:quiz_app3/view/quiz_app_home.dart';

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: QuizAppHome(),
    );
  }
}
