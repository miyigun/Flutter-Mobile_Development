import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app3/model/question_and_answer_model.dart';

class QuestionWidget extends StatelessWidget {
  const QuestionWidget(
      {super.key, required this.questions, required this.counter});

  final List<Map<String, Object>> questions;
  final int counter;

  @override
  Widget build(BuildContext context) {
    return Text(
      context
          .watch<QuestionAndAnswerModel>()
          .questions[context.watch<QuestionAndAnswerModel>().counter]
              ['question']
          .toString(),
      style: const TextStyle(
        fontSize: 25.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
