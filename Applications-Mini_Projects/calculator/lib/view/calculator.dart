import 'package:calculator/controller/controller.dart';
import 'package:calculator/view/calculator_keyboard.dart';
import 'package:calculator/view/calculator_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final controller=ChangeNotifierProvider((ref) => Controller());

class Calculator extends StatelessWidget {
  const Calculator({super.key});

  @override
  Widget build(BuildContext context) {

    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
              CalculatorScreen(),
              SizedBox(height: 10,),
              CalculatorKeyboard(),
            ],
          ),
        ),
      ),
    );
  }

}