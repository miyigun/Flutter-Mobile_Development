import 'package:calculator/view/calculator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CalculateKeyboard2Row2 extends ConsumerWidget {
  const CalculateKeyboard2Row2({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var read=ref.read(controller);
    return Row(
      children: [
        Expanded(
          flex: 2,
          child:SizedBox(
            child: TextButton(
              child: const Text(
                'sinx',
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
          flex: 2,
          child:SizedBox(
              child: IconButton(
                icon: Image.asset(
                  "assets/icons/square_icon.png",
                  color: Colors.red,
                  width: 30,
                  height: 30,

                ),
                iconSize: 40,
                onPressed: ()=> read.keyDivideFunction(),
              )
          ),
        ),
        Expanded(
          flex: 2,
          child:SizedBox(
              child: IconButton(
                icon: Image.asset(
                  "assets/icons/power_icon.png",
                  color: Colors.red,
                ),
                iconSize: 40,
                color: Colors.red,
                onPressed: ()=> read.keyBackSpaceFunction(),
              )
          ),
        ),
        Expanded(
          flex: 2,
          child:SizedBox(
            child: TextButton(
              child: const Text(
                '1/x',
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
          flex: 2,
          child:SizedBox(
              child: IconButton(
                icon: Image.asset(
                  "assets/icons/divide_icon.png",
                  color: Colors.red,
                ),
                iconSize: 40,
                onPressed: ()=> read.keyDivideFunction(),
              )
          ),
        ),
      ],
    );
  }

}