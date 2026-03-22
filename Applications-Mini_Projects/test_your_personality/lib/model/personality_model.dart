import 'package:flutter/material.dart';
import 'package:test_your_personality/controller/data.dart';

class PersonalityModel extends ChangeNotifier {
  List<int?> _selectedOption = [];

  bool isChanged=false;
  bool isLoadingData=false;

  int totalPoints=0;

  String personalityState='';

  void getData() {
    if (_selectedOption.isNotEmpty) {
      return;
    }
    _selectedOption = selectOptionList;
    isLoadingData=true;

    notifyListeners();
  }

  List<int?> getSelectedOptionList() {
    return _selectedOption;
  }

  void changeSelectedOption(int value, int index) {
    _selectedOption[index] = value;

    notifyListeners();
  }

  int? showSelectedOption(int index) {
    return _selectedOption[index];
  }

  bool isChangedTrue(){
    isChanged=true;

    return isChanged;
  }

  int getTotalPoints() {
    return totalPoints;

  }

  void addPoints(int point){
    totalPoints+=point;

    notifyListeners();
  }

  void personalityFinalState(){
    if (totalPoints>=0 && totalPoints<=18) {
      personalityState= 'Low Neurotic';
    }
    else if (totalPoints>18 && totalPoints<=36) {
      personalityState=  'Semi Neurotic';
    } else {
      personalityState= 'High Neurotic';
    }

    notifyListeners();
  }
}
