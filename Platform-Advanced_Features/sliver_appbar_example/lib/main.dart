import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List cities=[
      "İstanbul",
      "Ankara",
      "İzmir",
      "Adana",
      "Gaziantep",
      "Antalya",
      "Trabzon",
      "Diyarbakır",
      "Balıkesir",
      "Kütahya",
      "Bolu",
      "Kayseri",
      "Konya"
    ];

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 200.0,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  title: const Text('SliverAppBar Example'),
                  background: Image.network(
                    'https://cdn.pixabay.com/photo/2023/12/15/14/49/city-8450817_1280.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                    return InkWell(
                      child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            //set border radius more than 50% of height and width to make circle
                          ),
                        child: ListTile(
                          leading: const Icon(Icons.location_city),
                          title: Text(cities[index]),
                        ),
                      ),
                      onTap: (){},
                    );
                  },
                  childCount: cities.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
