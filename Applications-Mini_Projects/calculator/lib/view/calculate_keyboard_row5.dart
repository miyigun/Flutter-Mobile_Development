import 'package:calculator/view/calculator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CalculateKeyboardRow5 extends ConsumerWidget {
  const CalculateKeyboardRow5({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var read=ref.read(controller);
    return Row(
      children: [
        Expanded(
          flex: 3,
          child:SizedBox(
              child: IconButton(
                icon: Image.asset(
                    "assets/icons/function_icon.png",
                  color: Colors.red,
                ),
                iconSize: 40,
                onPressed: ()=> read.keyFunFunction(context),
              )
          ),
        ),
        Expanded(
          flex: 3,
          child:SizedBox(
            child: TextButton(
              child: const Text(
                '0',
                style: TextStyle(
                  fontSize: 50,
                ),
              ),
              onPressed: () => read.keyZeroFunction(),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child:SizedBox(
            child: TextButton(
              child: const Text(
                '.',
                style: TextStyle(
                  fontSize: 50,
                ),
              ),
              onPressed: () => read.keyCommaFunction(),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child:SizedBox(
            child: TextButton(
              child: const Text(
                '=',
                style: TextStyle(
                  fontSize: 50,
                  color: Colors.red,
                ),
              ),
              onPressed: ()=> read.keyEqualFunction(),
            ),
          ),
        ),
      ],
    );
  }

}