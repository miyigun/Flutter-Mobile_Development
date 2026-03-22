import 'package:flutter/material.dart';

class CountingTheNumber with ChangeNotifier {
  int number = 0;
  void increaseNumber() {
    number++;
    notifyListeners();
  }
}
