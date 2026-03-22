import 'package:get/get.dart';
import 'package:flutter/material.dart';

class GeneralController extends GetxController {
  late final userNameController=TextEditingController();
  late final passwordController=TextEditingController();

  @override
  void onInit() { // called immediately after the widget is allocated memory

    super.onInit();

    userNameController.text="";
    passwordController.text="";

  }
/*
  @override
  void onReady() { // called after the widget is rendered on screen

    super.onReady();
  }

  @override
  void onClose() { // called just before the Controller is deleted from memory

    super.onClose();

  }*/


}