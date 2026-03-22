import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key, required this.title});

  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Color color=Colors.black;

  @override
  Widget build(BuildContext context) {
    final showDraggable=color==Colors.black;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            DragTarget<Color>(
              onAccept: (data) => setState(() {
                color=data;
              }),
                builder: (context,_,__) => Container(
                  color: color,
                  width: 200,
                  height: 200,
                ),
            ),
            IgnorePointer(
              ignoring: !showDraggable,
              child: Opacity(
                opacity: showDraggable ? 1:0,
                child: Draggable<Color>(
                  data: Colors.green,
                  //İki Container bir aradaykenki Container
                  child: Container(
                    color: Colors.green,
                    width: 200,
                    height: 200,
                  ),
                  //Hareketli Container
                  feedback: Container(
                    color:  Colors.orange,
                    width: 200,
                    height: 200,
                  ),
                  //Tabandeki Container
                  childWhenDragging: Container(
                    color:  Colors.red,
                    width: 200,
                    height: 200,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
