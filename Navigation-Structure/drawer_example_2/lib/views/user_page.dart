import 'package:flutter/material.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tang San'),
      ),
      body: Image.asset(
        "assets/images/tang_san.jpg",
        fit: BoxFit.cover,
      ),
    );
  }
}
