import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/controller/elevated_button_widget.dart';
import 'package:riverpod_example/model/provider_model.dart';

class ProviderExampleWidget extends ConsumerWidget {
  const ProviderExampleWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final littleMonk = ref.watch(classTypeProviderModel);
    return Column(
      children: [
        const SizedBox(
          height: 10.0,
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Riverpod Provider example where we watch a String member variable'
            ' that we have passed through a class method.',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              littleMonk.littleMonk,
              style: const TextStyle(fontSize: 30.0),
            ),
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              littleMonk
                  .fetchName('Now we can pass any data to change above data,'
                      ' and watch it!'),
              style: const TextStyle(fontSize: 30.0),
            ),
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        const ElevatedButtonWidget(),
      ],
    );
  }
}
