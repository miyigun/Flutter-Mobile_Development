import 'package:calculator/view/calculator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CalculateKeyboardRow3 extends ConsumerWidget {
  const CalculateKeyboardRow3({super.key});

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