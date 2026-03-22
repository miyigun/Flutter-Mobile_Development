import 'package:flutter/material.dart';
import 'package:provider_example/controller/first_row_widget.dart';
import 'package:provider_example/controller/second_row_widget.dart';
import 'package:provider_example/controller/third_row_widget.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          FirstRowWidget(),
          SecondRowWidget(),
          ThirdRowWidget(),
        ],
      ),
    );
  }
}
