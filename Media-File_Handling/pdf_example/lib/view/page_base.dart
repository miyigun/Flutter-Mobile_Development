import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdf_example/controller/consts/colors.dart';
import 'package:pdf_example/controller/consts/text_style.dart';
import 'package:pdf_example/controller/controller.dart';
import 'package:pdf_example/view/pdf_in_device_tab.dart';
import 'package:pdf_example/view/settings_tab.dart';
import 'package:pdf_example/view/tools_tab.dart';

var controller = Get.put(Controller());

class PageBase extends StatefulWidget {
  const PageBase({super.key});

  @override
  State<PageBase> createState() => _PageBaseState();
}

class _PageBaseState extends State<PageBase> with TickerProviderStateMixin {

  @override
  void initState() {
    super.initState();
    controller.tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    controller.tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        backgroundColor: controller.apkTheme.value=="theme2"
          ? bgDarkColor
          : bgLightColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: controller.apkTheme.value=="theme2"
              ? bgColor
              : bgWhiteColorLight,
          centerTitle: true,
          title: Text(
            "Pdf App".tr,
            style: myStyle(
                family: regular2,
                color: controller.apkTheme.value=="theme2"
                    ? yellowColor
                    :whiteColor,
              size: 30
            ),
          ),
          bottom: TabBar(
            controller: controller.tabController,
            //isScrollable: true,
            dividerColor: bgDarkColor,
            labelColor: controller.apkTheme.value=="theme2"
                ? yellowColor
                  :whiteColor,
            labelStyle: myStyle(
              size: 16
            ),
            tabs: [
              Tab(
                icon: const Icon(Icons.edit_document),
                text: 'Device'.tr,
              ),
              Tab(
                  icon: const Icon(Icons.construction),
                  text: 'Tools'.tr
              ),
              Tab(
                  icon: const Icon(Icons.settings),
                  text: 'Settings'.tr
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: TabBarView(
            controller: controller.tabController,
            children: const <Widget>[
              PdfInDeviceTab(),
              ToolsTab(),
              SettingsTab(),
            ],
          ),
        ),
      ),
    );
  }
}
