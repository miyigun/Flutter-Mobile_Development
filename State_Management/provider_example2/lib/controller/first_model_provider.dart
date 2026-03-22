import 'package:flutter/cupertino.dart';

class FirstModelProvider with ChangeNotifier {
  String someDate="Some Date";

  void supplyFirstData() {
    someDate="Data Changed!";
    debugPrint(someDate);

    notifyListeners();
  }

  void clearData() {
    someDate="Data Cleared!";
    debugPrint(someDate);

    notifyListeners();
  }
}