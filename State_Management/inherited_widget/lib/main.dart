import 'package:flutter/material.dart';
import 'package:inherited_widget/controller/inherited-widget/widgets-lists/inherited_widget_on_top.dart';

void main() {
  runApp(const OurApp());
}

class OurApp extends StatelessWidget{
  const OurApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Our App',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: InheritedWidgetOnTop()
      ),
    );
  }
}
