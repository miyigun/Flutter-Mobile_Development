import 'package:flutter/cupertino.dart';

class CountingTheNumber with ChangeNotifier {
  int value=0;

  void increaseValue() {
    value++;

    notifyListeners();
  }

  void decreaseValue() {
    value--;

    notifyListeners();
  }
}