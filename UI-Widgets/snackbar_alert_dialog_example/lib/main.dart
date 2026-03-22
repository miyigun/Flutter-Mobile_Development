import 'package:flutter/material.dart';
import 'package:snackbar_alert_dialog_example/view/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        title: "SnackBar & Alert Dialog Example",
        debugShowCheckedModeBanner: false,
        home: Home());
  }
}
