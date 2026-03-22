import 'package:flutter/foundation.dart';

class CountingTheNumber with ChangeNotifier {
  int value = 0;

  void increaseValue() {
    value++;

    notifyListeners();
  }

  void decreaseValue() {
    if (value > 0) {
      value--;
    }

    notifyListeners();
  }

  void resetValue() {
    value = 0;

    notifyListeners();
  }
}
