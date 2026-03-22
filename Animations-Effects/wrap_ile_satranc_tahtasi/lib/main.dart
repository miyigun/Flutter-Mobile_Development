import 'package:flutter/material.dart';

var harf=['a','b','c','d','e','f','g','h'];

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Satranç Tahtası',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Satranç Tahtası'),
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
        child: Wrap(
          direction: Axis.horizontal,
          alignment: WrapAlignment.spaceEvenly,
          runAlignment: WrapAlignment.start,
          spacing: 2,
          runSpacing: 2,
          children: <Widget>[
            for (int i=0;i<8;i++)
              Wrap(
                children: [
                  const SizedBox(width: 15,),
                  Text(harf[i],style: const TextStyle(fontSize: 20)),
                  const SizedBox(width: 5,),
                ],
              ),
            for (int yatayKareler = 1; yatayKareler <= 8; yatayKareler++)
              yatayKareler % 2 != 0
                  ? Wrap(
                      children: [
                        Text((9-yatayKareler).toString(),style: const TextStyle(fontSize: 20),),
                        const SizedBox(width: 5),
                        for (int dikeyKareler = 1;
                            dikeyKareler <= 4;
                            dikeyKareler++)
                          Wrap(
                            children: [
                              Container(
                                color: Colors.grey,
                                width: 45,
                                height: 45,
                              ),
                              const SizedBox(width: 2),
                              Container(
                                color: Colors.black,
                                width: 45,
                                height: 45,
                              ),
                            ],
                          ),
                      ],
                    )
                  : Wrap(
                      children: [
                        Text((9-yatayKareler).toString(),style: const TextStyle(fontSize: 20),),
                        const SizedBox(width: 5),
                        for (int dikeyKareler = 1;
                            dikeyKareler <= 4;
                            dikeyKareler++)
                          Wrap(
                            children: [
                              Container(
                                color: Colors.black,
                                width: 45,
                                height: 45,
                              ),
                              const SizedBox(width: 2),
                              Container(
                                color: Colors.grey,
                                width: 45,
                                height: 45,
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
