import 'package:flutter/material.dart';
import 'package:music_player/controller/consts/colors.dart';

//const bold="bold";
//const regular="great_vibes_regular";
const bold="dancing_bold";
const regular="dancing_regular";
const regular2="painter";
const String family="Dancing Script";

myStyle({family=regular, double? size = 14, color=whiteColor}){
  return TextStyle(
      fontSize: size,
      color: color,
      fontFamily: family
  );
}