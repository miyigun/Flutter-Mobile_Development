import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app3/model/question_and_answer_model.dart';

class CheckAnswerWidget extends StatelessWidget {
  const CheckAnswerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      context.watch<QuestionAndAnswerModel>().answerChecking,
      style: const TextStyle(
        fontSize: 20.0,
      ),
    );
  }
}
