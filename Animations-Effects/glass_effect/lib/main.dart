import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Glass Effect',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Glass Effect'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isPressed=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange.shade300,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "assets/images/background_image.jpg"
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: GestureDetector(
          onTapDown: (_) {
            setState(() {
              isPressed=true;
            });
          },
          onTapUp: (_) {
            setState(() {
              isPressed=false;
            });
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
              child: AnimatedContainer(
                duration: const Duration(microseconds: 200),
                height: 300,
                width:  300,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: NetworkImage(
                      "https://pixabay.com/tr/photos/eski-kitaplar-kitap-eskimi%C5%9F-436498/",
                    ),
                    fit: BoxFit.cover,
                    opacity: 0.05,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 25,
                      spreadRadius: -5,
                    ),
                  ],
                  color: Colors.white.withOpacity(
                    isPressed ? 0.4 : 0.3
                  ),
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomCenter,
                    colors: [Colors.white60, Colors.white10],
                  ),
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(width: 2, color: Colors.white30),
                ),
                child: const Center(
                  child: Text(
                    'Flutter',
                    style: TextStyle(
                      fontSize: 80,
                      color:  Colors.white54,
                    ),
                  ),
                ),

              ),
            ),
          ),
        ),
      ),
    );
  }
}
