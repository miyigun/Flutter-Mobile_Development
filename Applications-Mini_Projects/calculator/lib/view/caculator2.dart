import 'package:calculator/controller/controller.dart';
import 'package:calculator/view/calculator2_screen.dart';
import 'package:calculator/view/calculator2_keyboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final controller=ChangeNotifierProvider((ref) => Controller());

class Calculator2 extends StatelessWidget {
  const Calculator2({super.key});

  @override
  Widget build(BuildContext context) {

    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
              Calculator2Screen(),
              SizedBox(height: 10,),
              Calculator2Keyboard(),
            ],
          ),
        ),
      ),
    );
  }

}