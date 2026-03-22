import 'package:flutter/material.dart';
import 'package:navigation_example/controller/category_item.dart';
import 'package:navigation_example/controller/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        padding: const EdgeInsets.all(25),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 1.5,
          crossAxisSpacing: 30,
          mainAxisSpacing: 30,
        ),

        /// the first page displays CategoryItem controller
        children: dummyCategories
            .map(
              (catData) => CategoryItem(
            id: catData.id,
            title: catData.title,
            color: catData.color,
          ),
        )
            .toList(),
      ),
    );
  }
}