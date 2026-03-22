import 'package:drag_and_drop/controller/const.dart';
import 'package:drag_and_drop/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final Controller controller = Get.put(Controller());

class Home extends StatefulWidget {
  const Home({super.key, required this.title});

  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          Obx(()=> IconButton(
              onPressed: () => controller.changePageIndexDecrease(),
              icon: Icon(Icons.arrow_back_ios),
              color: controller.pageNumber.value>0 ? Colors.black : Colors.grey,
            ),
          ),
          Obx(()=>IconButton(
              onPressed: () => controller.changePageIndexIncrease(),
            color: controller.pageNumber.value< (data.length/6-1).toInt()? Colors.black : Colors.grey,
              icon: Icon(Icons.arrow_forward_ios),
            ),
          ),
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: GridView.builder(
            itemCount: 6,
            padding: const EdgeInsets.all(8),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
            ),
            itemBuilder: (context, index) {
              return Draggable(
                feedback: Container(
                  //Taşınabilir Container
                  color: Colors.green,
                  width: 80,
                  height: 80,
                ),
                childWhenDragging: Container(
                  //Tabandaki Container
                  color: Colors.blue,
                  width: 80,
                  height: 80,
                  child: Center(
                      child: Obx(
                    () => Text(
                      data[controller.pageNumber.value * 6 + index]
                          .translateWord,
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  )),
                ),
                child: Container(
                    //İki Container bir aradayken
                    color: Colors.green,
                    width: 80,
                    height: 80,
                    child: Center(
                      child: Obx(
                        () => Text(
                          data[controller.pageNumber.value * 6 + index]
                              .englishWord,
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ),
                    )),
              );
            },
          )),
    );
  }
}
