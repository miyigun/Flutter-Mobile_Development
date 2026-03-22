import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example4/controller/name_notifier.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameStateNotifierProviderWatch = ref.watch(nameNotifierProvider);
    final nameStateNotifierProviderRead =
        ref.read(nameNotifierProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Riverpod Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Center(
          child: ListView.builder(
            itemCount: nameStateNotifierProviderWatch.length,
            itemBuilder: (context, index) {
              return Text(
                nameStateNotifierProviderWatch[index].toString(),
                style: const TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => nameStateNotifierProviderRead
            .addNames('Now you can add as many names as you want!'),
        child: const Icon(Icons.add),
      ),
    );
  }
}
