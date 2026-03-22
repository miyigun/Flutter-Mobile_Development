import 'package:flutter/material.dart';

class Questions extends StatelessWidget {
  final String handler;

  const Questions({super.key, required this.handler});

  @override
  Widget build(BuildContext context) {
    return Text(
      handler,
      style: const TextStyle(
        color: Colors.red,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }


}