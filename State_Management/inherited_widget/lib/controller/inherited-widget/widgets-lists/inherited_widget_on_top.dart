import 'package:flutter/material.dart';

import 'widgets_lists.dart';

class InheritedWidgetOnTop extends StatefulWidget {
  const InheritedWidgetOnTop({super.key});

  @override
  InheritedWidgetOnTopState createState() => InheritedWidgetOnTopState();
}

class InheritedWidgetOnTopState extends State<InheritedWidgetOnTop>{
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(30.0),
      children: [
        EyeColor(
          color: Colors.deepOrange,
          child: Builder(builder: (BuildContext innerContext){
            return const GrandParent();
          },)
        ),
        const SizedBox(
          height: 10.0,
        ),
        ChangingAge(
          age: ChangeAge(age: 25),
          child: Builder(builder: (BuildContext textContext){
            return const UncleClasses();
          },)
        )
      ],
    );
  }
}