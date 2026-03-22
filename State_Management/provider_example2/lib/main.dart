import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example2/controller/counting_the_number.dart';
import 'package:provider_example2/controller/first_model_provider.dart';
import 'package:provider_example2/controller/second_model_provider.dart';
import 'package:provider_example2/view/my_home_page.dart';

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
          create: (context) =>SecondModelProvider(),
        ),
      ],
      child: const MyMaterialApp(),
    )
  );
}

class MyMaterialApp extends StatelessWidget {
  const MyMaterialApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: "Provider Example 2"),
    );
  }

}

