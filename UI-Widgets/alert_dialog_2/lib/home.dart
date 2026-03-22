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
      body: Center(
        child: ElevatedButton(
          child: const Text("Open Dialog"),
          onPressed: (){
            showDialog(
                context: context,
                builder: (context)=> AlertDialog(
                  title: const Text("My Title"),
                  content: const Text("Önemli olan ne kadar uzun bir hayat yaşadığımız değil, hayatı nasıl yaşadığımızdır."),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context) ,
                      child: const Text("CANCEL"),
                    ),
                    TextButton(
                        onPressed: () => Navigator.pop(context) ,
                        child: const Text("OK"),
                    ),
                  ],
                ),
            );
          },
        ),
      ),
    );
  }
}
