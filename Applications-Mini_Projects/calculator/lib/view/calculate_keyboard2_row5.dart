import 'package:calculator/view/calculator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CalculateKeyboard2Row5 extends ConsumerWidget {
  const CalculateKeyboard2Row5({super.key});

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
                'cotx',
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
                '1',
                style: TextStyle(
                  fontSize: 50,
                ),
              ),
              onPressed: () => read.keyOneFunction(),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child:SizedBox(
            child: TextButton(
              child: const Text(
                '2',
                style: TextStyle(
                  fontSize: 50,
                ),
              ),
              onPressed: () => read.keyTwoFunction(),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child:SizedBox(
            child: TextButton(
              child: const Text(
                '3',
                style: TextStyle(
                  fontSize: 50,
                ),
              ),
              onPressed: () => read.keyThreeFunction(),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child:SizedBox(
            child: TextButton(
              child: const Text(
                '+',
                style: TextStyle(
                  fontSize: 50,
                  color: Colors.red,
                ),
              ),
              onPressed: ()=> read.keyPlusFunction(),
            ),
          ),
        ),
      ],
    );
  }

}