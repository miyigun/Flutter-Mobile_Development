import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: const MyHomePage(title: 'Font Styles'),
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
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            printToScreen("Murat IYIGUN",Colors.blueGrey,FontStyle.italic,FontWeight.normal,"Praise"),
            printToScreen("Murat IYIGUN",Colors.green,FontStyle.normal,FontWeight.bold,"Shizuru"),
            printToScreen("Murat IYIGUN",Colors.deepPurple,FontStyle.italic,FontWeight.normal,"LobsterTwo"),
          ],
        ),
      ),
    );
  }

  printToScreen(String text, MaterialColor textColor, FontStyle textFontStyle,FontWeight textFontWeight, String textFontFamily) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Text(
        text,
        style: TextStyle(
            fontSize: 24,
            color: textColor,
            fontStyle: textFontStyle,
            fontWeight: textFontWeight,
            fontFamily: textFontFamily
        ),),
    );
  }
}
