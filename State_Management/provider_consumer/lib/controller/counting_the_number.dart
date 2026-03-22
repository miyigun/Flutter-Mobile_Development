import 'package:flutter/material.dart';

class CountingTheNumber with ChangeNotifier {
  int number = 0;
  String message = 'Murat Iyigun';

  void increaseNumber(int number) {
    number++;

    notifyListeners();
  }

  void testMessage() {
    message.startsWith('M')
        ? message = 'Hi Murat'
        : message = 'First letter is not M';

    notifyListeners();
  }
}
