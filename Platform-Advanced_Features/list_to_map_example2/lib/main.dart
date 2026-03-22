import 'package:flutter/material.dart';
import 'package:list_to_map_example2/controller/data.dart';
import 'package:list_to_map_example2/view/all_page.dart';
import 'package:list_to_map_example2/view/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'List to Map Example',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'List to Map Example'),
      routes: {
        AllPage.routename: (context) => const AllPage(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Wrap(
          children: students
              .asMap()
              .entries
              .map((MapEntry map) => buildIcons(context, map.key))
              .toList(),
        ),
      ),
    );
  }
}
