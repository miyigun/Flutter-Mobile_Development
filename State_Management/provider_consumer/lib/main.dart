import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_consumer/controller/counting_the_number.dart';
import 'package:provider_consumer/pages/my_home_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CountingTheNumber(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Provider Consumer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}
