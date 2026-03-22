import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app3/controller/check_and_answer_widget.dart';
import 'package:quiz_app3/controller/elevated_button_widget.dart';
import 'package:quiz_app3/controller/question_widget.dart';
import 'package:quiz_app3/model/question_and_answer_model.dart';

class QuizAppHome extends StatelessWidget {
  const QuizAppHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz App'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Text(
                'Start the Quiz, test your English vocabulary:'
                ' Find the right Synonym!'
                ' Click any button and check your answer!',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20.0),
              QuestionWidget(
                questions:
                    Provider.of<QuestionAndAnswerModel>(context).questions,
                counter: context.watch<QuestionAndAnswerModel>().counter,
              ),
              ...(context.watch<QuestionAndAnswerModel>().questions[context
                      .watch<QuestionAndAnswerModel>()
                      .counter]['answers'] as List<String>)
                  .map(
                    (answer) => ElevatedButtonWidget(
                      answer: answer,
                    ),
                  )
                  .toList(),
              const CheckAnswerWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
