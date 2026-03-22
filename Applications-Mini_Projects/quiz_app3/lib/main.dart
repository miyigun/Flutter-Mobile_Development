import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app3/model/question_and_answer_model.dart';
import 'package:quiz_app3/view/quiz_app.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => QuestionAndAnswerModel()),
      ],
      child: const QuizApp(),
    ),
  );
}
