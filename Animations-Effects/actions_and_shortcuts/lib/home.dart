import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class IncrementIntent extends Intent {
  const IncrementIntent();
}

class DecrementIntent extends Intent {
  const DecrementIntent();
}

class Home extends StatefulWidget {
  const Home({super.key,required this.title});

  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int count=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Shortcuts(
          shortcuts: const<ShortcutActivator, Intent>{
            SingleActivator(LogicalKeyboardKey.arrowUp): IncrementIntent(),
            SingleActivator(LogicalKeyboardKey.arrowDown): DecrementIntent(),
          },
          child: Actions(
            actions: {
              IncrementIntent: CallbackAction<IncrementIntent> (
                onInvoke: (intent) => setState((){
                  count++;
                }),
              ),
              DecrementIntent: CallbackAction<DecrementIntent> (
                onInvoke: (intent) => setState((){
                  count--;
                }),
              )
            },
            child: Focus(
              autofocus: true,
              child: Column(
                children: [
                  const Text("Add the counter by pressing the up arrow key"),
                  const SizedBox(height: 30,),
                  const Text("And"),
                  const SizedBox(height: 30),
                  const Text("Subtract the counter by pressing the down arrow key"),
                  const SizedBox(height: 50),
                  Text(
                    'count: $count',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
