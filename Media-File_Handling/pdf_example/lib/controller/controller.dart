import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdf_example/controller/data.dart';

class Controller extends GetxController {

  var languageLocale1="en".obs;
  var languageLocale2='US'.obs;

  var apkTheme="theme2".obs;

  late TabController tabController;

  var searchTextIsOK=false.obs;

  var sortIsOK=true.obs;

  var currentIndex=0.obs;

  var dataAllList=[].obs;

  void loadInitialData() {
    tableElements.add(titles);
    tableElements.add(tableRow1);
    tableElements.add(tableRow2);
    tableElements.add(tableRow3);
    tableElements.add(tableRow4);
    tableElements.add(tableRow5);
    tableElements.add(tableRow6);
  }

}

