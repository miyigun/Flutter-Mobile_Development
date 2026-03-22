import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import '../main.dart';

var alertStyle = AlertStyle(
  animationType: AnimationType.grow,
  isCloseButton: false,
  isOverlayTapDismiss: false,
  descStyle: TextStyle(fontSize: 18,color: Colors.black),
  descTextAlign: TextAlign.left,
  animationDuration: Duration(milliseconds: 400),
  alertBorder: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10.0),
    side: BorderSide(
      color: Colors.grey,
    ),
  ),
  titleStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,
      color: Colors.black
  ),
  alertAlignment: Alignment.center,
);

class Araclar extends StatefulWidget {
  const Araclar({Key? key}) : super(key: key);

  @override
  _AraclarState createState() => _AraclarState();
}

class _AraclarState extends State<Araclar> {
  Controller _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color.fromRGBO(200, 240, 240, 1.0),
      appBar: AppBar(
      backgroundColor: Colors.cyan,
      ),
        body: Center(
          child: Text('Bu bölüm geliştirme aşamasındadır'),
        )
    );
  }
}