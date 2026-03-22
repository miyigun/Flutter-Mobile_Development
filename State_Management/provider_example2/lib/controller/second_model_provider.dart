import 'package:flutter/cupertino.dart';

class SecondModelProvider with ChangeNotifier {
  String name="Some name";
  int age=0;

  void getFirstName(){
    name="Json";
    debugPrint(name);

    notifyListeners();
  }

}