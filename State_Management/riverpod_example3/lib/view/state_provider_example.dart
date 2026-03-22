import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example3/controller/change_name_and_city.dart';
import 'package:riverpod_example3/controller/clear_name_and_city.dart';
import 'package:riverpod_example3/controller/counter_widget.dart';
import 'package:riverpod_example3/controller/raise_and_reduce_age_of_little_monk.dart';
import 'package:riverpod_example3/controller/watch_name_and_city.dart';
import 'package:riverpod_example3/model/state_provider_model.dart';

class StateProviderExample extends ConsumerWidget {
  const StateProviderExample({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stateProviderIntegerObject = ref.watch(stateProviderInteger);
    final stateProviderNameObject = ref.watch(stateProviderName);
    final stateProviderCityObject = ref.watch(stateProviderCity);
    final stateProviderInstance = ref.watch(stateProviderClass);

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListView(
        children: [
          const Text(
            'Providers come in many variants, but they all work the same way.'
            ' Let us start with a simple counter then doing some more complex staff',
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CounterWidget(
              stateProviderIntegerObject: stateProviderIntegerObject,
            ),
          ),
          const Space(),
          WatchNameAndCity(
            stateProviderNameObject: stateProviderNameObject,
            stateProviderCityObject: stateProviderCityObject,
          ),
          const ChangeNameAndCity(),
          const ClearNameAndCity(),
          const Space(),
          Text(
            '${stateProviderInstance.littleMonk}.'
            ' I am now ${stateProviderInstance.ageOfLittleMonk} years old!',
            style: const TextStyle(
              fontSize: 30.0,
            ),
          ),
          const RaiseAndReduceAgeOfLittleMonk(),
        ],
      ),
    );
  }
}

class Space extends StatelessWidget {
  const Space({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 10.0,
    );
  }
}
