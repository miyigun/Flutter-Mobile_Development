import 'package:flutter/widgets.dart';

class QuestionAndAnswerModel extends ChangeNotifier {
  List<Map<String, Object>> questions = [
    {
      'question': 'What is the synonym of Mendacity?',
      'answers': ['truthfulness', 'daring', 'falsehood', 'enemy'],
    },
    {
      'question': 'What is the synonym of Culpable?',
      'answers': ['gay', 'guilty', 'falsehood', 'enemy'],
    },
    {
      'question': 'What is the synonym of Rapacious?',
      'answers': ['guilty', 'daring', 'falsehood', 'greedy'],
    },
  ];

  int counter = 0;

  String answerChecking = 'Click to check correct answer!';

  void incrementCounter() {
    counter++;

    notifyListeners();

    if (counter > 2) {
      counter = 0;
    }

    checkAnswer();
  }

  void checkAnswer() {
    if (counter == 0) {
      answerChecking = 'Synonym of Rapacious was Greedy.';
    } else if (counter == 1) {
      answerChecking = 'Synonym of Mendacity was Falsehood.';
    } else if (counter == 2) {
      answerChecking = 'Synonym of Culpable was Guilty.';
    } else {
      answerChecking = 'Click to check correct answer!';
    }
  }
}
