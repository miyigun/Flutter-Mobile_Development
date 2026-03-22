import 'package:flutter/material.dart';
import 'package:provider_consumer/pages/column_class.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Provider Consumer"),
      ),
      body: const Center(
        child: ColumnClass(),
      ),
    );
  }
}
