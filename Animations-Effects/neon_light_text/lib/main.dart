import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Neon Light Text',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Neon Light Text'),
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
    Color shadowColor=Colors.red;
    Color backgroundColor=shadowColor.withOpacity(0.7);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Listener(
          onPointerDown: (_)=> setState(() {
            isPressed=true;
          }),
          onPointerUp: (_) => setState(() {
            isPressed = false;
          }),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: isPressed ? backgroundColor : null,
              boxShadow: [
                for (double i=1;i<5;i++)
                  BoxShadow(
                    color: shadowColor,
                    blurRadius: (isPressed ? 5 : 3)*i,
                  ),
                for (double i=1;i<5;i++)
                  BoxShadow(
                    spreadRadius: -1,
                    color: shadowColor,
                    blurRadius: (isPressed ? 5 : 3)*i,
                    blurStyle: BlurStyle.outer,
                  ),
              ],
            ),
            child: TextButton(
              onHover: (hovered) => setState(() {
                isPressed=hovered;
              }),
              style: TextButton.styleFrom(
                side: const BorderSide(color: Colors.white, width:  4),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {},
              child: Text(
                'Flutter',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  shadows: [
                    for (double i=1; i<(isPressed ? 8 : 4); i++)
                      Shadow(
                        color: shadowColor,
                        blurRadius: 3*i,
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
