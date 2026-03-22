import 'package:calculator/view/calculator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CalculatorScreen extends ConsumerWidget {
  const CalculatorScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var watch=ref.watch(controller);

    return Container(
      alignment:Alignment.centerRight,
      height: MediaQuery.of(context).size.height*0.26,
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                  watch.equation,
                style: const TextStyle(
                  fontSize: 24
                ),
              ),
              const SizedBox(height: 20,),
              Text(
                '= ${watch.conclusion}',
                style: const TextStyle(
                    fontSize: 24
                ),
              ),
              const SizedBox(height: 20,),
            ],
          ),
          const SizedBox(width: 20,),
        ],
      ),
    );
  }

}