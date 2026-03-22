import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example3/controller/controller.dart';
import 'package:riverpod_example3/controller/horizontal_space.dart';

class CounterWidget extends ConsumerWidget {
  const CounterWidget({super.key, required this.stateProviderIntegerObject});

  final int stateProviderIntegerObject;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        Text(
          stateProviderIntegerObject.toString(),
          style: const TextStyle(
            fontSize: 30.0,
          ),
        ),
        const HorizontalSpace(),
        FloatingActionButton(
          onPressed: () => increment(ref),
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
        const HorizontalSpace(),
        Container(
          padding: const EdgeInsets.all(8.0),
          child: const Text(
            'Clicking the button \n will increase \n the number by 1',
            style: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
