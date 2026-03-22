import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Search Bar',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home:const MyHomePage(title: 'Search Bar Example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController controller = TextEditingController();

  final itemsList = List<String>.generate(1000, (i) => "Item $i");
  var items = <String>[];

  @override
  void initState() {
    items.addAll(itemsList);
    super.initState();
  }

  void search(String query) {
    List<String> searchList = <String>[];
    searchList.addAll(itemsList);
    if(query.isNotEmpty) {
      List<String> searchListData = <String>[];
      for (var item in searchList) {
        if(item.contains(query)) {
          searchListData.add(item);
        }
      }
      setState(() {
        items.clear();
        items.addAll(searchListData);
      });
      return;
    } else {
      setState(() {
        items.clear();
        items.addAll(itemsList);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title:  Text(widget.title),
      ),
      body: Column(
        children: <Widget>[

          const SizedBox(height: 10),

          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              onChanged: (value) {
                search(value);
              },
              controller: controller,
              decoration: const InputDecoration(
                  labelText: "Search the item",
                  hintText: "Write the number of item",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)))),
            ),
          ),

          const SizedBox(height: 10),

          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(items[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}