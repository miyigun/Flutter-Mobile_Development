import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdf_example/controller/consts/colors.dart';
import 'package:pdf_example/controller/consts/text_style.dart';
import 'package:pdf_example/controller/controller.dart';

Controller controller = Get.find();

class PdfInDeviceTab extends StatelessWidget {
  const PdfInDeviceTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: controller.apkTheme.value=="theme2"
          ? bgDarkColor
          : bgLightColor,
      body: Obx(
            ()=> Padding(
          padding: const EdgeInsets.all(8.0),
          child: controller.dataAllList.isNotEmpty
              ? ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: controller.dataAllList.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 4),
                  child: Obx(
                        () =>
                        ListTile(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          tileColor: bgColor,
                          leading: Icon(Icons.edit_document),
                          title: Text(
                            controller.dataAllList[index].name,
                            style:
                            myStyle(
                                family: bold,
                                color: controller.apkTheme.value=="theme2"
                                    ? yellowColor
                                    :whiteColor,
                                size: 15
                            ),
                          ),
                          subtitle: Text(
                            controller.dataAllList[index].size,
                            style: myStyle(
                                family: regular,
                                color: controller.apkTheme.value=="theme2"
                                    ? yellowColor
                                    :whiteColor,
                                size: 12
                            ),
                          ),
                          onTap: () {

                          },
                        ),
                  ),
                );
              })
              : Center(
            child: Text(
              "Pdf not found!".tr,
              style: myStyle(
                color: controller.apkTheme.value=="theme2"
                    ? yellowColor
                    :whiteColor,
                size: 24,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
