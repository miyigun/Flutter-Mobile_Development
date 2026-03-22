import 'dart:math';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final random=Random();

  double boxHeight = 100;

  double boxWidth = 100;

  Color boxColor = Colors.deepPurple;

  BorderRadius borderRadius = BorderRadius.circular(8);

  void changeBoxSize(){
    setState(() {
      boxWidth=random.nextInt(400).toDouble();
      boxHeight=random.nextInt(400).toDouble();
    });
  }

  void changeBoxColor(){
    setState(() {
      boxColor=Color.fromRGBO(random.nextInt(256), random.nextInt(256), random.nextInt(256), 1);
    });
  }

  void changeRadius(){
    setState(() {
      borderRadius=BorderRadius.circular(random.nextInt(80).toDouble());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animated Container"),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(seconds: 1),
          curve: Curves.fastOutSlowIn,
          width: boxWidth,
          height: boxHeight,
          decoration: BoxDecoration(
            color: boxColor,
            borderRadius: borderRadius,
          ),
        ),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                onPressed: changeBoxColor,
                icon: const Icon(Icons.palette),
            ),
            IconButton(
              onPressed: changeRadius,
              icon: const Icon(Icons.interests),
            ),
            IconButton(
              onPressed: changeBoxSize,
              icon: const Icon(Icons.aspect_ratio),
            ),
          ],
      ),
    );
  }
}
