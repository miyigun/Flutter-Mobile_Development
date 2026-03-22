import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

final GlobalKey<ScaffoldState> scaffoldKey=GlobalKey<ScaffoldState>();

void showSnackBar(BuildContext context, String text){

  SnackBar snackBar=SnackBar(
    content: Text(
      text,
      style: const TextStyle(fontSize: 18),
    ),
    duration: const Duration(seconds: 5),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);

}

void showSnackBar2(BuildContext context, String url){

  SnackBar snackBar=SnackBar(
    content: Image.network(url),
    duration: const Duration(seconds: 2),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);

}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 24,
              color: Colors.white
            ),
          ),
        ),
        body: buildBody(context),
      ),
    );
  }

  buildBody(BuildContext context) {
    return Container(
      color:  Colors.black12,
      padding: const EdgeInsets.all(10),
      child: Center(
        child:
        RichText(
          text: TextSpan(text: 'Özlü Sözler:\n\n\n',
            style: const TextStyle(
              color:  Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            children:[
              TextSpan(text: 'Her şeyi yapabilirsin! Sadece kalk ve yap!\n\n\n\n\n',
                style: const TextStyle(
                  color: Colors.deepOrange,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
                recognizer: TapGestureRecognizer()..onTap=()=> showSnackBar(
                      context, "Yolunu değiştirmeden devam ettiğin sürece, ne kadar yavaş gittiğinin önemi yoktur\n\n Konfüçyus"
                  ),
              ),
              TextSpan(
                text: 'Aşağı bakarsan asla gökkuşağı bulamazsın.\n\n',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
                recognizer: TapGestureRecognizer()..onTap=()=> showSnackBar2(context, 'https://images.pexels.com/photos/757239/pexels-photo-757239.jpeg?auto=compress&cs=tinysrgb&w=600'),
              ),],
          ),
        ),
      ),
    );
  }
}
