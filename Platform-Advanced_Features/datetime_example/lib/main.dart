import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

void main() => runApp(const MyApp());


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DateTime Example',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const MyHomePage(title: 'DateTime Example'),
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

  var dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(widget.title),
      ),
      body: Container(
        color: Colors.grey[200],
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 50.0),
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: const Center(
                      child: Text(
                        "Date Time's feature",
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),

                ElevatedButton(
                  child: const Text(
                    "What is the date and the time?",
                    style: TextStyle(
                        color: Colors.white
                    ),
                  ),
                  onPressed: (){

                    var todaysDateTime = DateFormat('dd/MM/yyyy HH:MM:ss').format(dateTime);

                    Fluttertoast.showToast(
                        msg: todaysDateTime,
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0
                    );

                  },
                ),

                ElevatedButton(
                  child: const Text(
                    "What day is it?",
                    style: TextStyle(
                        color: Colors.white
                    ),
                  ),
                  onPressed: (){

                    var day = DateFormat('EEEE').format(dateTime);

                    Fluttertoast.showToast(
                        msg: day,
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0
                    );
                  },
                ),

                ElevatedButton(
                  child:  const Text(
                    "What is the date?",
                    style: TextStyle(
                        color: Colors.white
                    ),
                  ),
                  onPressed: (){

                    var date = DateFormat('dd MMMM yyyy , EEEE').format(dateTime);

                    Fluttertoast.showToast(
                        msg: date,
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0
                    );
                  },
                ),

                ElevatedButton(
                  child: const Text(
                    "What time is it?",
                    style: TextStyle(
                        color: Colors.white
                    ),
                  ),
                  onPressed: (){

                    var time = DateFormat('hh:mm a').format(dateTime);

                    Fluttertoast.showToast(
                        msg: time,
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
