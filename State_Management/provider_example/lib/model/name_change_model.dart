import 'package:flutter/material.dart';

class NameChangeModel extends ChangeNotifier {
  String _name = 'Murat';

  String get name => _name;

  void changeName() {
    _name = 'Erdem';

    notifyListeners();
  }
}
