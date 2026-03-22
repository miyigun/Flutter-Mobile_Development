import 'package:flutter/material.dart';

class Controller extends ChangeNotifier {
  bool isBold = false;
  bool isItalic = false;
  bool isUnderline = false;

  bool isAlignLeft = true;
  bool isAlignRight = false;
  bool isAlignJustify = false;

  TextAlign textAlign=TextAlign.start;

  int fontSize=10;

  Color fontColor=Colors.black;

  void changeIsBold() {
    isBold = !isBold;

    notifyListeners();
  }

  void changeIsItalic() {
    isItalic = !isItalic;

    notifyListeners();
  }

  void changeIsUnderline() {
    isUnderline = !isUnderline;

    notifyListeners();
  }

  void changeAlign(String align) {
    if (align == 'left') {
      isAlignLeft=true;
      isAlignJustify=false;
      isAlignRight = false;
      textAlign=TextAlign.start;
    } else if (align == 'justify') {
      isAlignLeft=false;
      isAlignJustify=true;
      isAlignRight = false;
      textAlign=TextAlign.justify;
    } else if (align == 'right') {
      isAlignLeft=false;
      isAlignJustify=false;
      isAlignRight = true;
      textAlign=TextAlign.end;
    }

    notifyListeners();
  }

  void fontDecrease() {
    if (fontSize>1) {
      fontSize--;
    }

    notifyListeners();
  }

  void fontIncrease() {
    if (fontSize<40) {
      fontSize++;
    }

    notifyListeners();
  }

  void changeFontColor(String color){
    if (color=='black'){
      fontColor=Colors.black;
    }
    else if (color=='blue'){
      fontColor=Colors.blue;
    }
    else if (color=='red'){
      fontColor=Colors.red;
    }

    notifyListeners();
  }
}
