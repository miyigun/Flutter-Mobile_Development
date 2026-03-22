import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notebook2/controller/controller.dart';
import 'package:notebook2/view/console.dart';
import 'package:notebook2/view/page_screen.dart';

final controller = ChangeNotifierProvider((ref) => Controller());

class TextEditor extends StatelessWidget {
  const TextEditor({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: const [
            Console(),
            PageScreen(),
          ],
        ),
      ),
    );
  }
}
