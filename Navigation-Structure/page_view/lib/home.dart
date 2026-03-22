import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key, required this.title});

  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final controller=PageController(initialPage: 0);

  String? selectedItem="Item 1";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
              onPressed: () => controller.previousPage(
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeInOut,
              ),
              icon: const Icon(
                Icons.keyboard_arrow_left,
              )
          ),
          IconButton(
              onPressed: () => controller.nextPage(
                duration: const Duration(seconds: 1),
                curve: Curves.easeInOut,
              ),
              icon: const Icon(
                Icons.keyboard_arrow_right,
              )
          ),
        ],
      ),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller,
        //scrollDirection: Axis.vertical,
        onPageChanged: (index) {
          debugPrint('Page ${index+1}');
        },
        children: [
          Container(
            color: Colors.red,
            child: const Center(child: Text("Page 1"),),
          ),
          Container(
            color: Colors.indigo,
            child: const Center(child: Text("Page 2"),),
          ),
          Container(
            color: Colors.green,
            child: const Center(child: Text("Page 3"),),
          ),
        ],
      ),
    );
  }
}
