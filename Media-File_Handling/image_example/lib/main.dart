import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepOrange).copyWith(secondary: Colors.green),
    ),
    home: Scaffold(
      appBar: AppBar(
        title: Text(
          'Flutter denemelerim',
          style: TextStyle(fontSize: 20.0, color: Colors.white),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(
          Icons.extension,
        ),
      ),
      body: Column(
        children: [
          Text(
            "Image Türleri",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          //Resimleri aynı yükseklikte gösterir
          IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Container(
                    color: Colors.blue[100],
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("Kaktüs"),
                        Image.asset("images/kaktus.webp")
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.pink[200],
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("Network"),
                        Image.network("https://images.pexels.com/photos/7026056/pexels-photo-7026056.jpeg?auto=compress&cs=tinysrgb&h=650&w=940")
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.pink[200],
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("Profil"),
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.purple[300],
                          backgroundImage: NetworkImage("https://images.pexels.com/photos/7026056/pexels-photo-7026056.jpeg?auto=compress&cs=tinysrgb&h=650&w=940"),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  ));
}

