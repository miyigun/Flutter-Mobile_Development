import 'package:flutter/material.dart';

class FirstModel with ChangeNotifier {
  String name = 'name';

  void changeName() {
    name = 'Name Changed!';
    debugPrint(name);

    notifyListeners();
  }

  void clearName() {
    name = ' ';
    debugPrint(name);

    notifyListeners();
  }
}
