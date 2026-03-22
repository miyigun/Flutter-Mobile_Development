import 'package:flutter/material.dart';
import 'package:parent_child_widget/widgets/child_widget.dart';

class ParentWidget extends StatefulWidget {
  const ParentWidget({super.key});

  @override
  ParentWidgetState createState() => ParentWidgetState();
}

class ParentWidgetState extends State<ParentWidget>{
  bool _inActive=true;

  void _manageStateForChildWidget(bool newValue){
    setState(() {
      _inActive=newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChildWidget(
      inActive: _inActive,
      notifyParent: _manageStateForChildWidget
    );
  }
}