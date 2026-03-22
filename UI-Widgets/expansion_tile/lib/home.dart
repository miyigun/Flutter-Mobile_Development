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
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ExpansionTile(
        leading: const Icon(Icons.flag),
        title: const Text(
            "Sports",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold
          ),
        ),
        children: [
          ListTile(
            leading: Image.asset("assets/chess.png"),
              title: const Text(
                  "Chess",
                style: TextStyle(
                    color: Colors.blue,
                ),
              ),
          ),
          const ListTile(
            leading: Icon(Icons.sports_basketball),
            title: Text(
              "Basketball",
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
          ),
          const ListTile(
            leading: Icon(Icons.sports_football),
            title: Text(
              "Football",
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
          ),
          const ListTile(
            leading: Icon(Icons.sports_volleyball),
            title: Text(
              "Voleyball",
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
          ),
        ],
        onExpansionChanged: (isExpanded){
          debugPrint("Expanded: $isExpanded");
        },
      ),
    );
  }
}
