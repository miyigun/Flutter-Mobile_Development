import 'package:flutter/material.dart';

class QuestionWidget extends StatelessWidget {
  const QuestionWidget(
      {super.key, required this.questions, required int counter})
      : _counter = counter;

  final List<Map<String, Object>> questions;
  final int _counter;

  @override
  Widget build(BuildContext context) {
    return Text(
      questions[_counter]['question'].toString(),
      style: const TextStyle(
        fontSize: 25.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
