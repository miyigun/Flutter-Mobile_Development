import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_your_personality/controller/data.dart';
import 'package:test_your_personality/view/test_screen.dart';

class QuestionAndOptionsWidget extends ConsumerWidget {
  const QuestionAndOptionsWidget({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var read = ref.read(controller);
    var watch = ref.watch(controller);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.8,
          child: Text('${index + 1}- ${questions[index]}'),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (int radioIndex = 1; radioIndex < 7; radioIndex++)
              SizedBox(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Radio(
                        value: radioIndex,
                        groupValue: watch.showSelectedOption(index),
                        activeColor: Colors.red,
                        onChanged: (int? value) {
                          read.changeSelectedOption(value!, index);
                          read.isChangedTrue();
                        }),
                    Text('${radioIndex - 1}'),
                  ],
                ),
              ),
          ],
        ),
        const Divider(
          thickness: 5.0,
        ),
      ],
    );
  }
}
