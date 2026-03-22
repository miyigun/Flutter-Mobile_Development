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
      title: 'Toggle Button Example',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Toggle Button Example'),
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
  final List<bool> _selections = List.generate(3, (_)=>false );

  var txtBold   = FontWeight.normal;
  var txtItalic = FontStyle.normal;
  var txtUnder  = TextDecoration.none;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            ToggleButtons(
              isSelected:_selections,
              onPressed:(int index){
                setState(() {
                  _selections[index]=!_selections[index];

                  if(index==0 && _selections[index]){
                    txtBold=FontWeight.bold;
                  }
                  else if(index==0 && !_selections[index]){
                    txtBold=FontWeight.normal;
                  }

                  if(index==1 && _selections[index]){
                    txtItalic=FontStyle.italic;
                  }
                  else if(index==1 && !_selections[index]){
                    txtItalic=FontStyle.normal;
                  }

                  if(index==2 && _selections[index]){
                    txtUnder=TextDecoration.underline;
                  }
                  else if(index==2 && !_selections[index]){
                    txtUnder=TextDecoration.none;
                  }

                });
              },
              color:Colors.teal,
              fillColor:Colors.deepPurple,
              children: const <Widget>[
                Icon(Icons.format_bold),
                Icon(Icons.format_italic),
                Icon(Icons.format_underlined),
              ],
            ),
            Text(
              "This Is A Simple Text,Press Buttons Up And See What Gonna Happen",
              style:TextStyle(
                fontWeight:txtBold,
                fontStyle:txtItalic,
                decoration:txtUnder,
              ),
            )
          ],
        ),
      ),
    );
  }
}
