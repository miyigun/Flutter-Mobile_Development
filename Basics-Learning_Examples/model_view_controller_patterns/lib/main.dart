import 'package:flutter/material.dart';
import 'package:model_view_controller_patterns/model/first_model.dart';
import 'package:model_view_controller_patterns/model/mobile_model.dart';
import 'package:model_view_controller_patterns/view/home_app.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => FirstModel()),
        ChangeNotifierProvider(create: (context) => MobileModel()),
      ],
      child: const HomeAppPage(),
    ),
  );
}
