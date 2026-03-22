import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example3/controller/controller.dart';
import 'package:riverpod_example3/controller/horizontal_space.dart';

class ClearNameAndCity extends ConsumerWidget {
  const ClearNameAndCity({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          ElevatedButton(
            onPressed: () => clearName(ref),
            child: const Text(
              'Clear name',
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
          ),
          const HorizontalSpace(),
          ElevatedButton(
            onPressed: () => clearCity(ref),
            child: const Text(
              'Clear City',
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
