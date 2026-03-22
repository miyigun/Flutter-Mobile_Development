import 'package:calculator/view/calculator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CalculateKeyboard2Row1 extends ConsumerWidget {
  const CalculateKeyboard2Row1({super.key});

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
                'C',
                style: TextStyle(
                    fontSize: 40,
                    color: Colors.red
                ),
              ),
              onPressed: () => read.keyCFunction(),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child:SizedBox(
              child: IconButton(
                icon: const Icon(Icons.backspace_outlined),
                iconSize: 30,
                color: Colors.red,
                onPressed: ()=> read.keyBackSpaceFunction(),
              )
          ),
        ),
        Expanded(
          flex: 3,
          child:SizedBox(
            child: IconButton(
              icon: Image.asset(
                "assets/icons/square_root_icon.png",
                color: Colors.red,
              ),
              iconSize: 40,
              color: Colors.red,
              onPressed: ()=> read.keyPercentageFunction(),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child:SizedBox(
              child: IconButton(
                icon: Image.asset(
                  "assets/icons/root_icon.png",
                  color: Colors.red,
                ),
                iconSize: 40,
                onPressed: ()=> read.keyDivideFunction(),
              )
          ),
        ),
        Expanded(
          flex: 3,
          child:SizedBox(
            child: IconButton(
              icon: const Icon(Icons.percent_rounded),
              iconSize: 40,
              color: Colors.red,
              onPressed: ()=> read.keyPercentageFunction(),
            ),
          ),
        ),
      ],
    );
  }

}