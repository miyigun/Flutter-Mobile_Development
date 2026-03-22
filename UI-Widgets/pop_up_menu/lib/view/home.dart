import 'package:flutter/material.dart';
import 'package:pop_up_menu/view/item_page.dart';

enum MenuItem { item1, item2, item3, item4 }

class Home extends StatefulWidget {
  const Home({super.key, required this.title});

  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
            actions: [
              PopupMenuButton<MenuItem>(
                  onSelected: (value) {
                    if (value == MenuItem.item1) {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            ItemPage(item: MenuItem.item1.toString()),
                      ));
                    } else if (value == MenuItem.item2) {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            ItemPage(item: MenuItem.item2.toString()),
                      ));
                    } else if (value == MenuItem.item3) {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            ItemPage(item: MenuItem.item3.toString()),
                      ));
                    } else if (value == MenuItem.item4) {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            ItemPage(item: MenuItem.item4.toString()),
                      ));
                    }
                  },
                  itemBuilder: (context) => [
                        const PopupMenuItem(
                          value: MenuItem.item1,
                          child: Text("Item 1"),
                        ),
                        const PopupMenuItem(
                          value: MenuItem.item2,
                          child: Text("Item 2"),
                        ),
                        const PopupMenuItem(
                          value: MenuItem.item3,
                          child: Text("Item 3"),
                        ),
                        const PopupMenuItem(
                          value: MenuItem.item4,
                          child: Text("Item 4"),
                        ),
                      ]),
            ],
          ),
          body: const Center()),
    );
  }
}
