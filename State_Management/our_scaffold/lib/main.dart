
import 'package:flutter/material.dart';

void main() {
  runApp(const OurApp());
}

class OurApp extends StatelessWidget {
  const OurApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Our App',
      debugShowCheckedModeBanner: false,
      home: OurScaffold(),
    );
  }
}

class OurScaffold extends StatelessWidget {
  const OurScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 50.0,
              padding: const EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                border: Border.all(),
                color: Colors.blue,
              ),
              child: const Text(
                  'Title',
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.white
                ),
            )),
            const Expanded(
              child: Center(
                child: Text(
                  'Hello World!',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.redAccent,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
