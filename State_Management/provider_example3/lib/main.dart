import 'package:flutter/material.dart';
import 'package:provider_example3/controller/counter.dart';
import 'package:provider_example3/view/counter_app.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => Counter()),
    ],
    child: const CounterApp(),
  ));
}
