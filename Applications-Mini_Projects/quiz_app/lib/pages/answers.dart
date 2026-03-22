import 'package:flutter/material.dart';

class Answers extends StatelessWidget {
  final String yourAnswer;
  final VoidCallback answerQuestion;

  const Answers({super.key, required this.yourAnswer, required this.answerQuestion});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
        height: 10,
      ),
        ElevatedButton(
          onPressed: answerQuestion,
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              textStyle: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
          child: Text(yourAnswer),
        ),
      ],
    );
  }


}