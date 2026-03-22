import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NameNotifier extends ChangeNotifier {
  final List<String> listOfNames = [];

  void addNames(String names) {
    listOfNames.add(names);

    notifyListeners();
  }
}

final nameChangeNotifier =
    ChangeNotifierProvider.autoDispose<NameNotifier>((ref) {
  return NameNotifier();
});
