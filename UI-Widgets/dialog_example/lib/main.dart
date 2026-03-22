import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller/controller.dart';

final GeneralController controller = Get.put(GeneralController());

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dialog Örneği',
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
        backgroundColor: Colors.blueGrey,
        title: const Text("Dialog Örneği"),
      ),
      body: Column(
        children: [
          Flexible(
              child: Container(
                margin: const EdgeInsets.all(10),
                child: TextField(
                  controller: controller.yaziKontrol,
                  maxLines: 20,
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      hintText: "Mesajınızı yazın",
                      filled: true,
                      fillColor: Colors.lightBlueAccent[100]
                  ),
                ),
              )

          ),

        ElevatedButton(
          onPressed: _dialogGoster,
          child: const Text("SİL",
            style: TextStyle(

                fontSize: 24
            ),
          ),
        ),
        ],
      ),
    );
  }

  _dialogGoster() {
    if (controller.yaziKontrol.text!="") {
      Get.defaultDialog(
          title: "Metni Sil",
          titleStyle: const TextStyle(fontSize: 24, color: Colors.red),
          content: const Text("Metni silmek istediğinizden emin misiniz?"),
          textCancel: "Hayır",
          textConfirm: "Evet",
          confirmTextColor: Colors.red,
          cancelTextColor: Colors.red,
          buttonColor: Colors.white,
          onConfirm: metniSil,
          barrierDismissible: false
      );

    } else {
      Get.defaultDialog(
          title: "Hata",
          titleStyle: const TextStyle(fontSize: 24, color: Colors.red),
          content: const Text("Silinecek bir yazı yok!"),
          textConfirm: "Tamam",
          onConfirm: geri,
          confirmTextColor: Colors.red,
          buttonColor: Colors.white
      );
    }
  }

  void geri() {
    Get.back();
  }

  void metniSil() {
    controller.yaziKontrol.clear();
    Get.back();
  }
}
