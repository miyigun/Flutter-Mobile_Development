import 'package:flutter/material.dart';
import 'package:scratcher/scratcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Scratcher Example',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Scratcher Example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.title,
          style: const TextStyle(
              fontFamily: "The unseen",
              fontWeight: FontWeight.bold,
              fontSize: 22),
        ),
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 30),
            const Text(
              'Start to dig',
              style: TextStyle(
                  fontFamily: "The unseen",
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            Scratcher(
                brushSize: 7,
                color: Colors.purple,
                //Shows how much of the scratch has been scraped in terminal
                onChange: (value) => print(
                      "Scratch progress: $value%",
                    ),
                child: SizedBox(
                  height: 150,
                  width: 150,
                  //color: Colors.black,
                  child: Image.asset("assets/dankey.png"),
                )),
            const SizedBox(height: 30),
            const Text(
              'Dig for luck',
              style: TextStyle(
                  fontFamily: "The unseen",
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            const SizedBox(height: 10),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Scratcher(
                        brushSize: 7,
                        accuracy: ScratchAccuracy.low,
                        image: Image.asset("assets/scratch.png"),
                        child: SizedBox(
                          height: 100,
                          width: 100,
                          child: Image.asset("assets/tryagain.png"),
                        )),
                    Scratcher(
                        brushSize: 7,
                        accuracy: ScratchAccuracy.low,
                        image: Image.asset("assets/scratch.png"),
                        child: SizedBox(
                          height: 100,
                          width: 100,
                          child: Image.asset("assets/dankey.png"),
                        )),
                    Scratcher(
                        brushSize: 7,
                        accuracy: ScratchAccuracy.low,
                        image: Image.asset("assets/scratch.png"),
                        child: SizedBox(
                          height: 100,
                          width: 100,
                          child: Image.asset("assets/rose.png"),
                        )),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Scratcher(
                        brushSize: 7,
                        accuracy: ScratchAccuracy.low,
                        image: Image.asset("assets/scratch.png"),
                        child: SizedBox(
                          height: 100,
                          width: 100,
                          child: Image.asset("assets/rose.png"),
                        )),
                    Scratcher(
                        brushSize: 7,
                        accuracy: ScratchAccuracy.low,
                        image: Image.asset("assets/scratch.png"),
                        child: SizedBox(
                          height: 100,
                          width: 100,
                          child: Image.asset("assets/dankey.png"),
                        )),
                    Scratcher(
                      brushSize: 7,
                      accuracy: ScratchAccuracy.low,
                      image: Image.asset("assets/scratch.png"),
                      child: SizedBox(
                        height: 100,
                        width: 100,
                        child: Image.asset("assets/tryagain.png"),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
