import 'package:flutter/material.dart';

class WatchNameAndCity extends StatelessWidget {
  const WatchNameAndCity(
      {super.key,
      required this.stateProviderNameObject,
      required this.stateProviderCityObject});

  final String stateProviderNameObject;
  final String stateProviderCityObject;

  @override
  Widget build(BuildContext context) {
    return Text(
      '$stateProviderNameObject from $stateProviderCityObject',
      style: const TextStyle(
        fontSize: 30.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
