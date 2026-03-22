import 'package:calculator/view/calculator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CalculateKeyboard2Row4 extends ConsumerWidget {
  const CalculateKeyboard2Row4({super.key});

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
                'tanx',
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
                '4',
                style: TextStyle(
                  fontSize: 50,
                ),
              ),
              onPressed: ()=> read.keyFourFunction(),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child:SizedBox(
            child: TextButton(
              child: const Text(
                '5',
                style: TextStyle(
                  fontSize: 50,
                ),
              ),
              onPressed: ()=> read.keyFiveFunction(),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child:SizedBox(
            child: TextButton(
              child: const Text(
                '6',
                style: TextStyle(
                  fontSize: 50,
                ),
              ),
              onPressed: ()=> read.keySixFunction(),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child:SizedBox(
            child: TextButton(
              child: const Text(
                '-',
                style: TextStyle(
                  fontSize: 50,
                  color: Colors.red,
                ),
              ),
              onPressed: ()=> read.keyMinusFunction(),
            ),
          ),
        ),
      ],
    );
  }

}