import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdf_example/controller/consts/text_style.dart';
import 'package:pdf_example/controller/translation.dart';
import 'package:pdf_example/view/page_base.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Pdf Example',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: regular,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        //colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      translations: Messages(), // your translations
      locale: const Locale('en', 'US'),
      home: const PageBase(),
    );
  }
}

