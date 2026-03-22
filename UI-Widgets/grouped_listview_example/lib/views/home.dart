import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';

class Home extends StatefulWidget {
  const Home({super.key, required this.title});

  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final elements=[
    {'group': 'Team A', 'name'  : 'Name 1'},
    {'group': 'Team B', 'name'  : 'Name 1'},
    {'group': 'Team C', 'name'  : 'Name 1'},
    {'group': 'Team D', 'name'  : 'Name 1'},
    {'group': 'Team A', 'name'  : 'Name 2'},
    {'group': 'Team B', 'name'  : 'Name 2'},
    {'group': 'Team C', 'name'  : 'Name 2'},
    {'group': 'Team D', 'name'  : 'Name 2'},
    {'group': 'Team A', 'name'  : 'Name 3'},
    {'group': 'Team B', 'name'  : 'Name 3'},
    {'group': 'Team C', 'name'  : 'Name 3'},
    {'group': 'Team D', 'name'  : 'Name 3'},
    {'group': 'Team A', 'name'  : 'Name 4'},
    {'group': 'Team B', 'name'  : 'Name 4'},
    {'group': 'Team C', 'name'  : 'Name 4'},
    {'group': 'Team D', 'name'  : 'Name 4'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: GroupedListView<dynamic,String>(
        useStickyGroupSeparators: true,
        itemComparator: (item1, item2) => item1['name'].compareTo(item2['name']),
        groupComparator: (value1,value2) => value1.compareTo(value2),
        elements: elements,
        groupBy: (element) => element['group'],
        groupSeparatorBuilder: (value) => Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          color: Colors.black,
          child: Text(value, style: const TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),),
        ),
        itemBuilder: (context, element) => Card(
          elevation: 4,
            child: ListTile(
              contentPadding: const EdgeInsets.all(12),
              leading: const Icon(Icons.account_circle, size:32),
              title: Text(element['name']),
            ),
        ),
      ),
    );
  }
}
