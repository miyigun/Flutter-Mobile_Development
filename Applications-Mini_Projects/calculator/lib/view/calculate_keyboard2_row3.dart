import 'package:calculator/view/calculator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CalculateKeyboard2Row3 extends ConsumerWidget {
  const CalculateKeyboard2Row3({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var read=ref.read(controller);
    return Row(
      children: [
        Expanded(
          flex: 3,
          child:SizedBox(
            child: TextButton(
              child: const Text(
                'cosx',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.red,
                ),
              ),
              onPressed: ()=> read.keyMultipleFunction(),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child:SizedBox(
            child: TextButton(
              child: const Text(
                '7',
                style: TextStyle(
                  fontSize: 50,
                ),
              ),
              onPressed: ()=> read.keySevenFunction(),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child:SizedBox(
            child: TextButton(
              child: const Text(
                '8',
                style: TextStyle(
                  fontSize: 50,
                ),
              ),
              onPressed: ()=> read.keyEightFunction(),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child:SizedBox(
            child: TextButton(
              child: const Text(
                '9',
                style: TextStyle(
                  fontSize: 50,
                ),
              ),
              onPressed: ()=> read.keyNineFunction(),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child:SizedBox(
            child: TextButton(
              child: const Text(
                'x',
                style: TextStyle(
                  fontSize: 50,
                  color: Colors.red,
                ),
              ),
              onPressed: ()=> read.keyMultipleFunction(),
            ),
          ),
        ),
      ],
    );
  }

}