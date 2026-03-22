import 'package:flutter/material.dart';
import 'package:list_to_map_example2/controller/data.dart';
import 'package:list_to_map_example2/view/all_page.dart';

Widget buildIcons(BuildContext context, int index) {
  final List x = students.asMap().entries.map((e) => e.key).toList();
  final int y = x.length;

  return GestureDetector(
    onTap: () {
      Navigator.of(context).pushNamed(
        AllPage.routename,
        arguments: [y, index],
      );
    },
    child: Container(
      margin: const EdgeInsets.all(8.0),
      width: 80,
      height: 40,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.red,
            blurRadius: 4,
            spreadRadius: 2,
          ),
        ],
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Colors.yellow,
            Colors.white,
          ],
        ),
      ),
      child: Text('$index',
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 25,
            fontFamily: 'Trajan Pro',
            fontWeight: FontWeight.bold,
          )),
    ),
  );
}
