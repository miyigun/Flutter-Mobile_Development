import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Inkwell Örneği',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Inkwell Örneği'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            InkResponse(
              radius:45,
              splashColor: Colors.blue,
              onTap: () async {
                await _dialogGoster("Yazı");
              },
              child: const Text(
                  " Beni Seç ",
                style: TextStyle(fontSize: 24),
              ),
            ),

            InkWell(
              splashColor: Colors.green,
                child: SizedBox(
                  width: 150,
                    height: 150,
                    child: Image.asset("images/butterfly.jpg"),),
              onTap: () async {
                await _dialogGoster("Resim");
              },
            ),

            InkResponse(
              child: const Icon(Icons.star,size:100),
              splashColor: Colors.red,
              radius: 50,
              onTap: () async {
                await _dialogGoster("İkon");
              },
            ),

          ],
        ),
      ),
    );
  }

  Future<void> _dialogGoster(String s) async {
    await Get.defaultDialog(
        title: "Seçilen",
        content: Text(s+" seçildi"),
        actions: [
          ElevatedButton(
            onPressed: (){
              Get.back();
            },
            child: const Text("Tamam"),
          )
        ]
    );
  }
}
