import 'package:flutter/material.dart';
import 'package:model_view_controller_patterns/controller/mobile_controller.dart';
import 'package:model_view_controller_patterns/controller/home_page_controller.dart';
import 'package:model_view_controller_patterns/model/first_model.dart';
import 'package:provider/provider.dart';

class HomeAppPage extends StatelessWidget {
  const HomeAppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Second Provider Example',
      home: Scaffold(
        body: SafeArea(
          child: ListView(
            children: [
              textStyleSacramento('Provider Examples'),
              Container(
                padding: const EdgeInsets.all(20.0),
                child: Image.asset(
                  'assets/images/book_and_coffee.jpg',
                  width: 300,
                ),
              ),
              textStyleTrajanPro('We can add humongous widget tree below...'),
              const HorizontalLine(),
              changeNameButton(),
              Container(
                padding: const EdgeInsets.all(30.0),
                child: textStyleSacramento(
                  Provider.of<FirstModel>(context, listen: true).name,
                ),
              ),
              clearNameButton(),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  changeColorButtonToPurple(),
                  const VerticalLine(),
                  changeColorButtonRed(),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  restoreOldColorOfFirstMobile(),
                  const VerticalLine(),
                  restoreOldColorOfSecondMobile(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class VerticalLine extends StatelessWidget {
  const VerticalLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.2,
        width: 3,
        color: Colors.black45,
      ),
    );
  }
}

class HorizontalLine extends StatelessWidget {
  const HorizontalLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.height * 0.2,
        height: 3,
        color: Colors.black45,
      ),
    );
  }
}
