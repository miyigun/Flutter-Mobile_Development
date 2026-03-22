import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_your_personality/view/test_screen.dart';

void main() {
  runApp(const ProviderScope(child: TestScreen()));
}
