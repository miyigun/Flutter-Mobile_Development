import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example3/controller/counter.dart';

class CounterHomePage extends StatelessWidget {
  const CounterHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final subtree = ConstantWidget(
        child: const Text(
      "Hello World",
    ));

    final anotherSubTree = _widget();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'A Stateless Counter App',
        ),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("You have pushed the button this many times"),
            Text(
              "${context.watch<Counter>().count}",
              key: const Key("counterState"),
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 50),
            subtree,
            const SizedBox(height: 50),
            anotherSubTree,
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        key: const Key("increment_floatingActionButton"),
        onPressed: () => context.read<Counter>().increment(),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  //Just to test rebuild
  Widget _widget() => const Text('Hi');

  ConstantWidget({required Text child}) {
    //Just to test rebuild
    return const Text('Hello');
  }
}
