import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/model/number_model.dart';

class FirstRowWidget extends StatelessWidget {
  const FirstRowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const Text(
                  'You have pushed this button this time',
                ),
                Text('${context.watch<NumberModel>().counter}'),
                ElevatedButton(
                  onPressed: () =>
                      context.read<NumberModel>().incrementNumberByTwo(),
                  child: const Text('Increment'),
                ),
                FloatingActionButton(
                  onPressed: () =>
                      context.read<NumberModel>().incrementNumberByTwo(),
                  tooltip: 'Increment',
                  child: const Icon(Icons.add),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
