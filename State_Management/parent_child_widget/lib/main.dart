import 'package:flutter/material.dart';
import 'package:parent_child_widget/widgets/parent_widget.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Own State Managing Widget',
      debugShowCheckedModeBanner: false,
      home: ParentWidget(),
    );
  }

}