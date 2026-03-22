import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key, required this.title});

  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final items=[
    'Item 1','Item 2','Item 3','Item 4'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ReorderableListView(
        onReorder: (oldIndex, newIndex){
          setState(() {
            if (newIndex>oldIndex) newIndex--;

            final item=items.removeAt(oldIndex);
            items.insert(newIndex, item);
          });
        },
        children: [
          for (final item in items)
            ListTile(
              key: ValueKey(item), //identity each item
              title: Text(item),
            ),
        ],
      )
    );
  }
}
