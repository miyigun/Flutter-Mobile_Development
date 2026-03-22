import 'package:flutter/material.dart';
import 'package:own_state_managing_widget/widgets/own_state_managing_widget.dart';

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
      home: OwnStateManagingWidget(),
    );
  }

}