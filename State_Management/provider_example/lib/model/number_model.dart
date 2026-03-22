import 'package:flutter/material.dart';

class NumberModel extends ChangeNotifier {
  int _counter = 0;

  int get counter => _counter;

  void incrementNumberByTwo() {
    _counter += 2;

    notifyListeners();
  }
}
