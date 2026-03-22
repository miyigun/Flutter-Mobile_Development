import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example2/model/name_notifier.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameChangeNotifierProvider = ref.watch(nameChangeNotifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Riverpod Example',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Center(
          child: ListView.builder(
            itemCount: nameChangeNotifierProvider.listOfNames.length,
            itemBuilder: (context, index) {
              return Text(
                nameChangeNotifierProvider.listOfNames[index].toString(),
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
        onPressed: () => nameChangeNotifierProvider.addNames('Now you can '
            'add as many names using ChangeNotifierProvider as you want!'),
        child: const Icon(Icons.add),
      ),
    );
  }
}
