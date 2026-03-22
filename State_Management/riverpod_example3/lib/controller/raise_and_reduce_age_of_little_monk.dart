import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example3/controller/controller.dart';

class RaiseAndReduceAgeOfLittleMonk extends ConsumerWidget {
  const RaiseAndReduceAgeOfLittleMonk({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () => changeLittleMonk(ref),
            child: const Text(
              'Grow Little Monk',
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
          ),
          const VerticalDivider(),
          ElevatedButton(
            onPressed: () => reverseAgeOfLittleMonk(ref),
            child: const Text(
              'Reverse Age of Little Monk',
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
