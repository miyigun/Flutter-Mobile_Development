import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final keyCounter = GlobalKey<CounterWidgetState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Global Key Example'),
        centerTitle: true,
      ),
      body: Center(
        child: CounterWidget(key: keyCounter),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          final state = keyCounter.currentState!;

          //method
          state.increment();

          //state
          debugPrint(state.counter.toString());
        },
      ),
    );
  }
}

class CounterWidget extends StatefulWidget {
  const CounterWidget({super.key});

  @override
  State<CounterWidget> createState() => CounterWidgetState();
}

class CounterWidgetState extends State<CounterWidget> {
  int counter = 0;

  void increment() {
    setState(() => counter += 5);
  }

  @override
  Widget build(BuildContext context) {
    return Text('Counter: $counter');
  }
}
