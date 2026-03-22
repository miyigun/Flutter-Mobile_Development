import 'package:flutter/material.dart';

class MobileModel with ChangeNotifier {
  String backgroundColorOfFirst = 'Background';
  String mobileColorOfFirst = 'Mobile';
  String backgroundColorOfSecond = 'Background';
  String mobileColorOfSecond = 'Mobile';

  List<Color> selection = [
    Colors.yellow,
    Colors.blue,
    Colors.orange,
    Colors.pinkAccent,
    Colors.green,
    Colors.limeAccent,
  ];

  void changeColorToPurple() {
    backgroundColorOfFirst = 'Background\nPurple';
    mobileColorOfFirst = 'Mobile\nWhite.';

    selection[0] = Colors.purple;
    selection[4] = Colors.white;

    notifyListeners();
  }

  void changeColorToRed() {
    backgroundColorOfSecond = 'Background\nBlack';
    mobileColorOfSecond = 'Mobile\nRed.';

    selection[1] = Colors.black;
    selection[5] = Colors.red;

    notifyListeners();
  }

  void restoreOldColorOfFirstMobile() {
    backgroundColorOfFirst = 'Background\nYellow';
    mobileColorOfFirst = 'Mobile\nGreen.';

    selection[0] = Colors.yellow;
    selection[4] = Colors.green;

    notifyListeners();
  }

  void restoreOldColorOfSecondMobile() {
    backgroundColorOfSecond = 'Background\nBlue';
    mobileColorOfSecond = 'Mobile\nLimeaccent.';

    selection[1] = Colors.blue;
    selection[5] = Colors.limeAccent;

    notifyListeners();
  }
}
