import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdf_example/controller/consts/colors.dart';
import 'package:pdf_example/controller/consts/text_style.dart';
import 'package:pdf_example/controller/controller.dart';
import 'package:pdf_example/view/page_base.dart';
import 'package:pdf_example/view/tools_tab.dart';

Controller controller = Get.find();

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: controller.apkTheme.value=="theme2"
          ? bgDarkColor
          : bgLightColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 30),
        child: SingleChildScrollView(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ExpansionTile(
                leading: Icon(
                    Icons.language,
                    color: controller.apkTheme.value=="theme2"
                        ? yellowColor
                        :whiteColor,
                    size: 30
                ),
                title: Text(
                  "Change Language".tr,
                  style: myStyle(
                      family: bold,
                      color: controller.apkTheme.value=="theme2"
                          ? yellowColor
                          :whiteColor,
                      size: 24),
                ),
                backgroundColor: bgColor,
                trailing: Icon(
                  Icons.arrow_drop_down,
                  color: controller.apkTheme.value=="theme2"
                      ? yellowColor
                      :whiteColor,
                ),
                children: [
                  ListTile(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    tileColor: bgColor,
                    leading: Icon(
                        Icons.arrow_right,
                        color: controller.languageLocale1.value=="en"
                            ? Colors.red
                            : controller.apkTheme.value=="theme2"
                            ? yellowColor
                            :whiteColor,
                        size: 30
                    ),
                    title: Text("English".tr,
                        style: myStyle(
                            family: bold,
                            color: controller.languageLocale1.value=="en"
                                ? Colors.red
                                : controller.apkTheme.value=="theme2"
                                ? yellowColor
                                :whiteColor,
                            size: 24)
                    ),
                    contentPadding: const EdgeInsets.only(left: 50.0),
                    onTap: (){
                      var locale = const Locale('en', 'US');
                      Get.updateLocale(locale);

                      controller.languageLocale1.value = 'en';
                      controller.languageLocale2.value = 'US';

                    },
                  ),
                  ListTile(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    tileColor: bgColor,
                    leading: Icon(
                        Icons.arrow_right,
                        color: controller.languageLocale1.value=="tr"
                            ? Colors.red
                            : controller.apkTheme.value=="theme2"
                            ? yellowColor
                            :whiteColor,
                        size: 30
                    ),
                    title: Text("Turkish".tr,
                      style: myStyle(
                          family: bold,
                          color: controller.languageLocale1.value=="tr"
                              ? Colors.red
                              : controller.apkTheme.value=="theme2"
                              ? yellowColor
                              :whiteColor,
                          size: 24)
                      ,
                    ),
                    contentPadding: const EdgeInsets.only(left: 50.0),
                    onTap: (){
                      var locale = const Locale('tr', 'TR');
                      Get.updateLocale(locale);

                      controller.languageLocale1.value = 'tr';
                      controller.languageLocale2.value = 'TR';

                    },
                  ),
                ],

              ),
              const SizedBox(
                height: 20,
              ),
              ExpansionTile(
                leading: Icon(
                    Icons.color_lens_sharp,
                    color: controller.apkTheme.value=="theme2"
                        ? yellowColor
                        :whiteColor,
                    size: 30),
                title: Text("Change Theme".tr,
                  style: myStyle(family: bold,
                      color : controller.apkTheme.value=="theme2"
                          ? yellowColor
                          :whiteColor,
                      size: 24),
                ),
                backgroundColor: bgColor,
                trailing: Icon(Icons.arrow_drop_down,
                  color: controller.apkTheme.value=="theme2"
                      ? yellowColor
                      :whiteColor,
                ),
                children: [
                  ListTile(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    tileColor: bgColor,
                    leading: Icon(
                        Icons.arrow_right,
                        color: controller.apkTheme.value=="theme1"
                            ? Colors.red
                            : controller.apkTheme.value=="theme2"
                            ? yellowColor
                            :whiteColor,
                        size: 30
                    ),
                    title: Text("Theme 1".tr,
                        style: myStyle(
                            family: bold,
                            color: controller.apkTheme.value=="theme1"
                                ? Colors.red
                                : controller.apkTheme.value=="theme2"
                                ? yellowColor
                                :whiteColor,
                            size: 24)
                    ),
                    contentPadding: const EdgeInsets.only(left: 50.0),
                    onTap: (){
                      controller.apkTheme.value="theme1";

                      Get.to(() => const SettingsTab());

                      controller.currentIndex.value == 2;

                      Get.to(() => const PageBase());

                    },
                  ),
                  ListTile(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    tileColor: bgColor,
                    leading: Icon(
                        Icons.arrow_right,
                        color: controller.apkTheme.value=="theme2"
                            ? Colors.red
                            : controller.apkTheme.value=="theme2"
                            ? yellowColor
                            :whiteColor,
                        size: 30
                    ),
                    title: Text("Theme 2".tr,
                      style: myStyle(
                          family: bold,
                          color: controller.apkTheme.value=="theme2"
                              ? Colors.red
                              : controller.apkTheme.value=="theme2"
                              ? yellowColor
                              :whiteColor,
                          size: 24)
                      ,
                    ),
                    contentPadding: const EdgeInsets.only(left: 50.0),
                    onTap: (){
                      controller.apkTheme.value="theme2";

                      Get.to(() => const ToolsTab());

                      controller.currentIndex.value == 2;

                      Get.to(() => const PageBase());


                      //Get.changeThemeMode(controller.apkTheme.value=="theme1" ? ThemeMode.light : ThemeMode.dark);


                      //Get.changeTheme(darkTheme);


                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}