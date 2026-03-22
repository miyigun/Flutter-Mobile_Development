import 'package:flutter/material.dart';

class NameClearModel extends ChangeNotifier {
  String _name = ' ';

  String get name => _name;

  void clearName() {
    _name = 'Murat';

    notifyListeners();
  }
}
