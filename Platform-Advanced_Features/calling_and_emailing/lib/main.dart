import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Redirect to call and e-mail screen',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const MyHomePage(title: 'Redirect to call and e-mail screen'),
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

  void customLaunch(command) async{
    if (!await launch(command)){
      SnackBar(
        content: command+ "did not found"
      );

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text("Contact us"),

            SizedBox(height: MediaQuery.of(context).size.height/20,),

            InkWell(
              onTap: (){
                customLaunch("mailto:miyigun2017@gmail.com");
              },
              child: Container(
                width: MediaQuery.of(context).size.width/2.4,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0,3)
                    ),
                  ]
                ),
                child: const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text("e-mail",
                  textAlign: TextAlign.center,)
                ),
              ),
            ),

            SizedBox(height: MediaQuery.of(context).size.height/20,),

            InkWell(
              onTap: (){
                customLaunch("tel:05554443322");
              },
              child: Container(
                width: MediaQuery.of(context).size.width/2.4,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0,3)
                      ),
                    ]
                ),
                child: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text("Tel",
                      textAlign: TextAlign.center,)
                ),
              ),
            ),
          ],
        ),
      ),
   // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
