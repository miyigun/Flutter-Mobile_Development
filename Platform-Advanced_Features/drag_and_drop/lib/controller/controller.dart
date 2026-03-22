import 'package:drag_and_drop/controller/const.dart';
import 'package:get/get.dart';

class Controller extends GetxController {
  var pageNumber=0.obs;

  void changePageIndexIncrease() {
    if (pageNumber.value<(data.length/6-1).toInt()){
      pageNumber.value=pageNumber.value+1;
    }

    update();
  }

  void changePageIndexDecrease() {
    if (pageNumber.value>0){
      pageNumber.value=pageNumber.value-1;
    }

    update();
  }
}