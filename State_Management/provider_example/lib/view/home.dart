import 'package:flutter/material.dart';
import 'package:provider_example/view/my_home_page.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider Example'),
      ),
      body: const MyHomePage(),
    );
  }
}
