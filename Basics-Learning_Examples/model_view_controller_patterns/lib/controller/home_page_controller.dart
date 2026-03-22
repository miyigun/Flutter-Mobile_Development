import 'package:flutter/material.dart';
import 'package:model_view_controller_patterns/model/first_model.dart';
import 'package:provider/provider.dart';

Widget textStyleTrajanPro(String trajan) => Text(
      trajan,
      style: const TextStyle(
        fontFamily: 'Trajan Pro',
        fontSize: 35.0,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,
    );

Widget textStyleSacramento(String sacramento) => Text(
      sacramento,
      style: const TextStyle(
        fontFamily: 'Sacramento',
        fontSize: 55.0,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,
    );

Widget changeNameButton() => Container(
      padding: const EdgeInsets.all(30.0),
      child: Consumer<FirstModel>(
        builder: (context, value, child) => Container(
          padding: const EdgeInsets.all(25.0),
          child: ElevatedButton(
            child: const Text(
              'Change Name',
              style: TextStyle(
                fontSize: 35.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () {
              value.changeName();
            },
          ),
        ),
      ),
    );

Widget clearNameButton() => Container(
      padding: const EdgeInsets.all(30.0),
      child: Consumer<FirstModel>(
        builder: (context, value, child) => Container(
          padding: const EdgeInsets.all(25.0),
          child: ElevatedButton(
            child: const Text(
              'Clear Name',
              style: TextStyle(
                fontSize: 35.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () {
              value.clearName();
            },
          ),
        ),
      ),
    );
