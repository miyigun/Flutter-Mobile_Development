import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key, required this.title});

  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> items=[
    "Item 1", "Item 2","Item 3","Item 4"
  ];

  String? selectedItem="Item 1";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: SizedBox(
          width: 240,
          child: DropdownButton<String>(
            value: selectedItem,
            items: items.map((item) =>
                DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: const TextStyle(fontSize: 24),
                    ),
                ),
            ).toList(),
            onChanged: (item) => setState(() {
              selectedItem=item;
            }),

          ),
        ),
      ),
    );
  }
}
