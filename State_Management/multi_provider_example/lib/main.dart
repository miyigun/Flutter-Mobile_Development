import 'package:flutter/material.dart';
import 'package:multi_provider_example/models/providers/counting_the_number.dart';
import 'package:multi_provider_example/models/providers/first_model_provider.dart';
import 'package:multi_provider_example/models/providers/second_model_provider.dart';
import 'package:multi_provider_example/view/my_home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CountingTheNumber(),
        ),
        ChangeNotifierProvider(
          create: (context) => FirstModelProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SecondModelProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final String title = 'Using Multi Provider Example';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Using Multi Provider Example',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: title),
    );
  }
}
