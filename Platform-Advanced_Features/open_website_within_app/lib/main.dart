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
      title: 'Uygulamanın içinde web sitesi açma',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Uygulamanın içinde web sitesi açma'),
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text("Açmak istediğiniz web sitesinin linkine tıklayın"),
            TextButton(
                onPressed: (){
                  webSitesiniAc("https://www.youtube.com/");
                },
                child: const Text(
                  "https://www.youtube.com/",
                  style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline
                  ),)
            ),
            TextButton(
                onPressed: (){
                  webSitesiniAc("https://pub.dev/");
                },
                child: const Text(
                  "https://pub.dev/",
                  style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline
                  ),)
            ),
            TextButton(
                onPressed: (){
                  webSitesiniAc("https://www.linkedin.com/");
                },
                child: const Text(
                  "https://www.linkedin.com/",
                  style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline
                  ),)
            ),
            TextButton(
                onPressed: (){
                  webSitesiniAc("https://github.com/");
                },
                child: const Text(
                  "https://github.com/",
                  style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline
                  ),)
            ),
          ],
        ),
      ),
    );
  }

  void webSitesiniAc(String url) async{

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw '$url açılamaz';
    }
  }

}
