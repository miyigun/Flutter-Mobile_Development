import 'package:flutter/material.dart';
import 'package:model_view_controller_patterns/model/mobile_model.dart';
import 'package:provider/provider.dart';

Widget changeColorButtonToPurple() => Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10.0),
          child: Consumer<MobileModel>(
            builder: (context, value, child) => Container(
              padding: const EdgeInsets.all(15.0),
              child: FloatingActionButton(
                backgroundColor: value.selection[0],
                onPressed: () {
                  value.changeColorToPurple();
                },
                child: Icon(
                  Icons.mobile_screen_share,
                  color: value.selection[4],
                ),
              ),
            ),
          ),
        ),
        const Divider(
          thickness: 2.0,
        ),
        Consumer<MobileModel>(
          builder: (context, value, _) => Text(
            value.backgroundColorOfFirst,
            style: const TextStyle(
              fontFamily: 'Trajan Pro',
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const Divider(
          thickness: 2.0,
        ),
        Consumer<MobileModel>(
          builder: (context, value, _) => Text(
            value.mobileColorOfFirst,
            style: const TextStyle(
              fontFamily: 'Trajan Pro',
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );

Widget changeColorButtonRed() => Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10.0),
          child: Consumer<MobileModel>(
            builder: (context, value, child) => Container(
              padding: const EdgeInsets.all(15.0),
              child: FloatingActionButton(
                backgroundColor: value.selection[1],
                onPressed: () {
                  value.changeColorToRed();
                },
                child: Icon(
                  Icons.mobile_screen_share,
                  color: value.selection[5],
                ),
              ),
            ),
          ),
        ),
        const Divider(
          thickness: 2.0,
        ),
        Consumer<MobileModel>(
          builder: (context, value, _) => Text(
            value.backgroundColorOfSecond,
            style: const TextStyle(
              fontFamily: 'Trajan Pro',
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const Divider(
          thickness: 2.0,
        ),
        Consumer<MobileModel>(
          builder: (context, value, _) => Text(
            value.mobileColorOfSecond,
            style: const TextStyle(
              fontFamily: 'Trajan Pro',
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );

Widget restoreOldColorOfFirstMobile() => Container(
      padding: const EdgeInsets.all(10.0),
      child: Consumer<MobileModel>(
        builder: (context, value, child) => Container(
          padding: const EdgeInsets.all(10.0),
          child: ElevatedButton(
            onPressed: () => value.restoreOldColorOfFirstMobile(),
            child: const Text(
              'Restore',
              style: TextStyle(
                fontFamily: 'Sacramento',
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );

Widget restoreOldColorOfSecondMobile() => Container(
      padding: const EdgeInsets.all(10.0),
      child: Consumer<MobileModel>(
        builder: (context, value, child) => Container(
          padding: const EdgeInsets.all(10.0),
          child: ElevatedButton(
            onPressed: () => value.restoreOldColorOfSecondMobile(),
            child: const Text(
              'Restore',
              style: TextStyle(
                fontFamily: 'Sacramento',
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
