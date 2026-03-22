import 'package:flutter/material.dart';

//Koyu Renk Tema
const bgColor=Color(0xff1F212C);
const bgWhiteColor=Colors.white30;
const whiteColor=Color(0xffFFFFFF);
const yellowColor=Colors.yellow;
//const sliderColor=Color(0xff7E70FF);
const sliderColor=Colors.purple;
const buttonColor=Color(0xff60E95D);
const bgDarkColor=Color(0xff070811);

//Açık Renk Tema
const bgColorLight=Colors.white;
const bgWhiteColorLight=Colors.white30;
const whiteColorLight=Color(0xffFFFFFF);
const yellowColorLight=Colors.yellow;
const sliderColorLight=Color(0xff7E70FF);
const buttonColorLight=Color(0xff60E95D);
const bgLightColor=Colors.blueGrey;

ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.amber,
    backgroundColor: Colors.white,
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.amber,
      disabledColor: Colors.grey,
    ));

ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.blue,
      disabledColor: Colors.grey,
    ));