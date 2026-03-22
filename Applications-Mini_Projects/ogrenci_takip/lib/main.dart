import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Öğrenci Takip',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Öğrenci Takip'),
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
      backgroundColor: const Color.fromRGBO(255, 170, 170, 0.86),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 50.0),
        child: Column(
            mainAxisAlignment : MainAxisAlignment.center,
            crossAxisAlignment : CrossAxisAlignment.start,
            children: <Widget>[
              TextButton(
                  onPressed: dersProgramim,
                  child: const Text("Ders Programım", style: TextStyle(fontSize: 24.0))
              ),
              const SizedBox(
                  height: 10.0
              ),
              TextButton(
                  onPressed: siniflarim,
                  child: const Text("Sınıflarım", style: TextStyle(fontSize: 24.0))
              ),
              const SizedBox(
                  height: 10.0
              ),
              TextButton(
                  onPressed: yillikPlanlarim,
                  child: const Text("Yıllık Planlarım", style: TextStyle(fontSize: 24.0))
              ),
              SizedBox(
                height: 50.0,
              ),
              Row(
                children: [
                  IconButton(
                      icon: Icon(Icons.facebook),
                      iconSize: 36.0,
                      onPressed: (){
                      }
                  ),
                  IconButton(
                      icon: Icon(Icons.mail),
                      iconSize: 36.0,
                      onPressed: (){
                      }
                  ),
                  IconButton(
                      icon: Icon(Icons.add_a_photo),
                      iconSize: 36.0,
                      onPressed: (){
                      }
                  ),
                ]
              ),
            ]
        ),
      ),

      // floatingActionButton: FloatingActionButton(
      //   onPressed: yeniListe,
      //   tooltip: 'Yeni Liste',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void dersProgramim() {
  }

  void siniflarim() {
  }

  void yillikPlanlarim() {
  }
}
