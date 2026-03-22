import 'package:flutter/material.dart';

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
          bottom: const TabBar(
            tabs: [
              Tab(
                  text: 'Tab 1',
                  icon: Icon(Icons.home),
              ),
              Tab(
                text: 'Tab 2',
                icon: Icon(Icons.star),
              ),
              Tab(
                text: 'Tab 3',
                icon: Icon(Icons.person),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Center(
              child: Text(
                  "Page 1",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
              ),
            ),
            Center(
              child: Text(
                "Page 2",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ),Center(
              child: Text(
                "Page 3",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
