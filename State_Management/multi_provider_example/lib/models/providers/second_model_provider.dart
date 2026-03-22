import 'package:flutter/material.dart';

class SecondModelProvider with ChangeNotifier {
  String name = 'Some Name';
  int age = 0;

  void getFirstName() {
    name = 'Murat';
    debugPrint(name);

    notifyListeners();
  }

  void clearData() {
    name = 'Some Name';
    debugPrint(name);

    notifyListeners();
  }
}
