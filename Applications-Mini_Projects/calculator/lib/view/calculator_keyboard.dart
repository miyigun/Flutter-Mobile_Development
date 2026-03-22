import 'package:calculator/view/calculate_keyboard_row1.dart';
import 'package:calculator/view/calculate_keyboard_row2.dart';
import 'package:calculator/view/calculate_keyboard_row3.dart';
import 'package:calculator/view/calculate_keyboard_row4.dart';
import 'package:calculator/view/calculate_keyboard_row5.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CalculatorKeyboard extends ConsumerWidget {
  const CalculatorKeyboard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Container(

      alignment:Alignment.centerRight,
      height: MediaQuery.of(context).size.height*0.65,
      decoration: BoxDecoration(
        /*image: const DecorationImage(
          image: AssetImage("assets/images/wood_floor.jpg"),
          fit: BoxFit.cover,
        ), *///DecorationImage
        border: Border.all(
          //color: Colors.green,
          width: 1,
        ), //Border.all
        borderRadius: BorderRadius.circular(15),
      ),
      child: const Column(
        children: [
          Expanded(
            flex: 2,
              child: CalculateKeyboardRow1()
          ),
          Expanded(
              flex: 2,
              child: CalculateKeyboardRow2()
          ),
        Expanded(
              flex: 2,
              child: CalculateKeyboardRow3()
          ),
          Expanded(
              flex: 2,
              child: CalculateKeyboardRow4()
          ),
          Expanded(
              flex: 2,
              child: CalculateKeyboardRow5()
          ),
        ],
      ),
    );
  }

}