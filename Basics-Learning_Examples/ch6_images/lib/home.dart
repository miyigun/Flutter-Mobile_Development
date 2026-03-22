import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                const ImageAndIconWidget(),
                const Divider(),
                const BoxDecoratorsWidget(),
                const Divider(),
                const InputDecoratorsWidget(),
              ],
            ),
          )
        ),
      ),
    );
  }
}

class ImageAndIconWidget extends StatelessWidget {
  const ImageAndIconWidget({Key? key}):super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image(
          image: const AssetImage("assets/images/logo.png"),
        //color: Colors.orange,
          fit: BoxFit.cover,
          width: MediaQuery.of(context).size.width/3,
        ),
        Image.network('https://flutter.io/images/catalog­widget­placeholder.png',
          width: MediaQuery.of(context).size.width/3,
        ),
        const Icon(
          Icons.brush,
          color: Colors.lightBlue,
          size: 48.0,
        ),
      ],
    );
  }
  
}

class BoxDecoratorsWidget extends StatelessWidget {
  const BoxDecoratorsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        height: 100.0,
        width: 100.0,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          color: Colors.orange,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 10.0,
              offset: Offset(0.0,10.0),
            ),
          ],
        ),
      ),
    );
  }
}

class InputDecoratorsWidget extends StatelessWidget {
  const InputDecoratorsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          keyboardType: TextInputType.text,
          style: TextStyle(
            color: Colors.grey.shade800,
            fontSize: 16.0
          ),
          decoration: const InputDecoration(
            labelText: "Notes",
            labelStyle: TextStyle(color: Colors.purple),
            //border: UnderLineInputBorder(),
            //enabledBorder: OutlineInputBorder(borderSide(color: Colors.purple)),
            border: OutlineInputBorder(),
          ),
        ),
        const Divider(
          color: Colors.lightGreen,
          height: 50.0,
        ),
        TextFormField(
          decoration: const InputDecoration(labelText: 'Enter your notes'),
        ),
      ],
    );
  }
}


