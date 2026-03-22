import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdf_example/controller/consts/colors.dart';
import 'package:pdf_example/controller/consts/text_style.dart';
import 'package:pdf_example/controller/controller.dart';

Controller controller = Get.find();

class ToolsTab extends StatelessWidget {
  const ToolsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: controller.apkTheme.value=="theme2"
          ? bgDarkColor
          : bgLightColor,
      body:Padding(
        padding: EdgeInsets.symmetric(vertical: Get.height/4),
        child: Center(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceAround,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: bgColor, // Background color
                ),
                onPressed: (){},
                child: Text(
                  "Create Pdf".tr,
                  style: myStyle(
                    size: 24,
                    color: controller.apkTheme.value=="theme2"
                        ? yellowColor
                        :whiteColor,

                  ),
                ),
              ),
              SizedBox(height: 30,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: bgColor, // Background color
                ),
                onPressed: (){},
                child: Text(
                  "Edit Pdf".tr,
                  style: myStyle(
                    size: 24,
                    color: controller.apkTheme.value=="theme2"
                        ? yellowColor
                        :whiteColor,

                  ),
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}