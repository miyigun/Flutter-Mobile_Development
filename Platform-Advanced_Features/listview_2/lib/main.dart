import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ListView',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("ListView"),
        ),
        body: ListViewBody(),
      ),
    );
  }
}

class ListViewBody extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return _myListView(context);
  }
}

Widget _myListView(BuildContext context){
  //Resimlerle ListView
  return ListView.builder(
    itemCount: 5,
    itemBuilder: (context,index){
      return ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage("images/"+(index+1).toString()+".jpg"),
        ),
        title: Text((index+1).toString()+".Resim"),
        subtitle: Text("Avatar-"+(index+1).toString()+" gösterildi"),
        onTap: (){
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("Tıklandı!"),
                  content: Text((index+1).toString()+".seçenek seçildi"),
                  actions: [
                    TextButton(
                        onPressed: (){
                          Navigator.pop(context);
                        },
                        child: Text("Tamam"),
                    )
                  ],
                );
              }
          );
        },
      );
    },
  );
    //Iconlu ListView
    /*ListView(
    children: [
      ListTile(
        leading: Icon(Icons.wb_sunny),
        title: Text("Flutter"),
        trailing: Icon(Icons.keyboard_arrow_right),
      ),
      ListTile(
          leading: Icon(Icons.brightness_3),
          title: Text("Python"),
          trailing: Icon(Icons.keyboard_arrow_right),
      ),
      ListTile(
          leading: Icon(Icons.star),
          title: Text("Java"),
          trailing: Icon(Icons.keyboard_arrow_right),
      ),
      ListTile(
          leading: Icon(Icons.local_florist),
          title: Text("Pascal"),
          trailing: Icon(Icons.keyboard_arrow_right),
      ),
    ],
  );*/
  // horizontal ListView
  /*return ListView.builder(
    scrollDirection: Axis.horizontal,
      itemBuilder: (context,index){
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 1.0),
          color: Colors.tealAccent,
          child: Text('$index'),
        );
      }
  );*/
}