import 'package:flutter/material.dart';

class HorizontalSpace extends StatelessWidget {
  const HorizontalSpace({super.key});

  @override
  Widget build(BuildContext context) {
    return const VerticalDivider(
      thickness: 2.0,
      color: Colors.red,
    );
  }
}
