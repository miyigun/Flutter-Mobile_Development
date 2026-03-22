import 'package:checkbox_example/controller/controller.dart';
import 'package:checkbox_example/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'core/constant.dart';

final GeneralController controller = Get.put(GeneralController());

var height = Get.height;
var width = Get.width;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Checkbox Example',
      debugShowCheckedModeBanner: false,
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
        title: const Text("CheckBox Örneği"),
        actions: const [
          IconButton(
            onPressed: kaydet,
            icon: Icon(Icons.save),
          ),
        ],
      ),
      body: _buildBody(),
    );
  }

  _buildBody() {
    return Obx(
      () => SafeArea(
        child: _buildBody2(),
      ),
    );
  }

  _buildBody2() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.all(10),
          child: TextField(
            controller: controller.ad,
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              hintText: "Adınızı yazınız",
            ),
            onSubmitted: (eklenecekKarakter) {
              controller.nick.value = eklenecekKarakter;
            },
          ),
        ),
        const SizedBox(
          height: 10,
        ),

        Container(
          margin: const EdgeInsets.only(left: 10),
          child: const Text("Koşu yapılacak günleri seçiniz:",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Flexible(
            child:
            SizedBox(
                height: 400,
                 child: ListView.builder(
              itemCount: GUNLER.length,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    Checkbox(
                        value: check[index],
                        onChanged: (bool? value) {
                          //setState(() {
                            check[index] = !check[index];
                            controller.secilenGunler.value = "";
                          // });
                            var ekle="";
                            for (int i = 0; i < check.length; i++) {
                              if (check[i] == true) {
                                ekle+=GUNLER[i]+' ';
                              }
                            }
                            //setState(() {
                              controller.secilenGunler.value=ekle;
                            //});


                        }),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: Text(GUNLER[index]),
                    ),
                  ],
                );
              }),
        )),

        const Divider(
          height: 10,
        ),

        Flexible(
            child: Obx(() =>
                Text(controller.nick.value + " 'ın seçtiği günler: ",
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ))),

        Text(controller.secilenGunler.value.toString(),
        style: const TextStyle(fontSize: 18),
        )

      ],
    );
  }
}
