import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example5/controller/countering.dart';

final counterProvider= StateNotifierProvider<Countering, int>((ref) => Countering(0));
//Yukarıdaki tanımlamayı şu kodlarla da yapabiliriz:
//final referenceValue=StateProvider((ref) => 0);

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counterWatch=ref.watch(counterProvider);
    final counterRead=ref.read(counterProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 24,
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(20),
              child: Text(
                '$counterWatch',
                style: const TextStyle(
                  fontSize: 100,
                  fontFamily: 'Allison',
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: ()=> counterRead.increment(),
                child: const Text(
                  'Press to Increment',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                  ),
                ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: ()=> counterRead.decrease(),
              child: const Text(
                'Press to decrease',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            backgroundColor: Colors.deepOrange,
            tooltip: 'Press to decrease',
            onPressed: ()=> counterRead.decrease(),
            child: const Icon(Icons.remove),
          ),
          const SizedBox(width: 20,),
          FloatingActionButton(
            backgroundColor: Colors.deepOrange,
            tooltip: 'Press to increment',
            onPressed: ()=> counterRead.increment(),
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
