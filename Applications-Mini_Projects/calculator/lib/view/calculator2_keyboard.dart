import 'package:calculator/view/calculate_keyboard2_row1.dart';
import 'package:calculator/view/calculate_keyboard2_row2.dart';
import 'package:calculator/view/calculate_keyboard2_row3.dart';
import 'package:calculator/view/calculate_keyboard2_row4.dart';
import 'package:calculator/view/calculate_keyboard2_row5.dart';
import 'package:calculator/view/calculate_keyboard2_row6.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Calculator2Keyboard extends ConsumerWidget {
  const Calculator2Keyboard({super.key});

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
              child: CalculateKeyboard2Row1()
          ),
          Expanded(
              flex: 2,
              child: CalculateKeyboard2Row2()
          ),
          Expanded(
              flex: 2,
              child: CalculateKeyboard2Row3()
          ),
          Expanded(
              flex: 2,
              child: CalculateKeyboard2Row4()
          ),
          Expanded(
              flex: 2,
              child: CalculateKeyboard2Row5()
          ),
          Expanded(
              flex: 2,
              child: CalculateKeyboard2Row6()
          ),
        ],
      ),
    );
  }

}