import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notebook2/view/text_editor.dart';

void main() {
  runApp(
      const ProviderScope(child: MyApp())
  );
}

class MyApp  extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Text Editor',
      debugShowCheckedModeBanner: false,
      home: TextEditor(),
    );
  }
}
