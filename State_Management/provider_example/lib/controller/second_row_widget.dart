import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/model/name_change_model.dart';
import 'package:provider_example/model/number_model.dart';

class SecondRowWidget extends StatelessWidget {
  const SecondRowWidget({super.key});

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
                Text(context.watch<NameChangeModel>().name),
                ElevatedButton(
                  onPressed: () =>
                      context.read<NumberModel>().incrementNumberByTwo(),
                  child: const Text('Increment'),
                ),
                FloatingActionButton(
                  onPressed: () => context.read<NameChangeModel>().changeName(),
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
