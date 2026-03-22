import 'package:flutter/material.dart';

class OwnStateManagingWidget extends StatefulWidget {
  const OwnStateManagingWidget({super.key});

  @override
  OwnStateManagingWidgetState createState() => OwnStateManagingWidgetState();
}

class OwnStateManagingWidgetState extends State<OwnStateManagingWidget>{

  bool _stateChanged=false;

  void _changeState(){
    setState(() {
      _stateChanged=!_stateChanged;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: GestureDetector(
          onTap: _changeState,
          child: Container(
            width: 350.0,
            height: 350.0,
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
                color: _stateChanged ? Colors.green : Colors.red,
            ),
            child: Center(
              child: Text(
                _stateChanged ? 'State Changed' : 'State Unchanged',
                style: const TextStyle(fontSize: 35.0),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

