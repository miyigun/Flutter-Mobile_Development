import 'package:flutter/material.dart';
import 'package:navigation_example/view/categories_screen.dart';
import 'package:navigation_example/view/category_news_screen.dart';
import 'package:navigation_example/view/news_detail_screen.dart';
import 'package:navigation_example/view/tabs_view.dart';

class NewsApp extends StatelessWidget {
  const NewsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Daily News',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
        primaryColor: Colors.amber,
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyMedium: const TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            bodyLarge: const TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            titleLarge: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            )),
      ),
      initialRoute: '/', // default is '/'
      routes: {
        '/': (ctx) => const TabsView(),
        CategoryNewsScreen.routeName: (ctx) => const CategoryNewsScreen(),
        NewsDetailScreen.routeName: (ctx) => const NewsDetailScreen(),
      },

      /// onGenerateRoute works as a fallback if any navigation fails
      onGenerateRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => const CategoriesScreen());
      },

      /// if onGenerateRoute isn't dfined as a fallback onUnknownRoute
      /// takes its place and works fine if any navigation fails

      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (ctx) => const CategoriesScreen(),
        );
      },
    );
  }
}