import 'package:flutter/material.dart';
import 'package:flutter_provider_example/pages/column_class.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Basic Provider Explained to Beginners',
        ),
      ),
      body: const Center(
        child: AVeryDeepWidgetTree(),
      ),
    );
  }
}

class AVeryDeepWidgetTree extends StatelessWidget {
  const AVeryDeepWidgetTree({super.key});

  @override
  Widget build(BuildContext context) {
    // ‘Provider.of’, just like Consumer needs to know the type of the model.
    //We need to specify the model ‘CountingTheNumber’.

    return Container(
      padding: const EdgeInsets.all(20.0),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'This is a simple Text Widget',
            style: TextStyle(
              color: Colors.black,
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          //now we are going to build a very deep widget tree
          ColumnClass(),
        ],
      ),
    );
  }
}
