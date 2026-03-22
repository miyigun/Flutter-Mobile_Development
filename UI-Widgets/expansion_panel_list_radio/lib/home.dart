import 'package:expansion_panel/controller/const/const.dart';
import 'package:flutter/material.dart';

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
      ),
      body: SingleChildScrollView(
        child:
        ExpansionPanelList.radio(
          children: items.map((item) => ExpansionPanelRadio(
            canTapOnHeader: true,
            value: item.header,
            headerBuilder: (context, isExpanded) => ListTile(
              title: Text(
                item.header,
                style: const TextStyle(fontSize: 20),
              ),
            ),
            body: ListTile(
              title: Text(
                item.body,
                style: const TextStyle(fontSize: 18),
              ),
            ),
          )).toList(),
        ),
      ),
    );
  }
}
