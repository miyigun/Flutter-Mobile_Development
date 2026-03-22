import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material Banner Example',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Material Banner Example'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(30),
              padding: const EdgeInsets.all(25),
              child: const Text(
                'Click the Button below to show MaterialBanner',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(30),
              padding: const EdgeInsets.all(25),
              child: ElevatedButton(
                  onPressed: () => ScaffoldMessenger.of(context).showMaterialBanner(
                      MaterialBanner(
                          content: const Text(
                            'Hello from Material Banner',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          leading: const Icon(Icons.balcony_outlined),
                          backgroundColor: Colors.amberAccent,
                          actions: [
                            TextButton(
                                onPressed: ()=> ScaffoldMessenger.of(context).hideCurrentMaterialBanner(),
                                child: const Text(
                                  'Dismiss'
                                ),
                            ),
                          ],
                      ),
                  ),
                  child: const Text(
                    'Click Me!',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
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

