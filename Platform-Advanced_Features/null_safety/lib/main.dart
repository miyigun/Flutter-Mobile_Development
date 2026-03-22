import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MyApp(title: null));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.title});

  final String? title;

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'It can\'t be NULL',
      debugShowCheckedModeBanner: false,
      home: Home(title: null),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key, required this.title});

  final String? title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title !=null ? 'It\'s not NULL value' : 'It\'s a NULL value',
        ),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Text(
            title !=null ? 'It\'s not NULL value' : 'It\'s a NULL value',
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

