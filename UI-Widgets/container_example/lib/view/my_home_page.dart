import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget{
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(context),
    );
  }

  buildBody(BuildContext context) {
    Color color=Colors.redAccent;

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: 350,
              height: 350,
              transform: Matrix4.rotationZ(0.1),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      color.withOpacity(0.7),
                      color
                    ],
                    begin: Alignment.topLeft,
                    end:  Alignment.bottomRight
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              alignment: Alignment.center,
              child: Image.asset(
                  "assets/images/fon1.jpg",
                fit: BoxFit.cover,
              )
            ),
            const SizedBox(height: 10,),
            Container(
              width: 350,
              height: 350,
              transform: Matrix4.rotationZ(-0.5),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(40)),
                color:  Colors.blue,
                border: Border.all(
                  color: Colors.red,
                  width: 2,
                  style: BorderStyle.solid,
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black54,
                    blurRadius: 20,
                    spreadRadius: 20,
                  ),
                ],
                gradient: const LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Colors.red,
                      Colors.white,
                    ]
                ),
              ),
              alignment: Alignment.center,
              child: Image.asset(
                "assets/images/fon2.jpg",
                fit: BoxFit.cover,
              )
            ),
          ],
        ),
      ),
    );
  }
}