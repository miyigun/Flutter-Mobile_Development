import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/model/name_change_model.dart';
import 'package:provider_example/model/name_clear_model.dart';
import 'package:provider_example/model/number_model.dart';
import 'package:provider_example/view/my_app.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NumberModel()),
        ChangeNotifierProvider(create: (_) => NameChangeModel()),
        ChangeNotifierProvider(create: (_) => NameClearModel()),
      ],
      child: MyApp(),
    ),
  );
}
