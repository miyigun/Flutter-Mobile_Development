import 'package:flutter/material.dart';

final GlobalKey<ScaffoldState> scaffoldKey=GlobalKey<ScaffoldState>();

const SnackBar snackBarOne=SnackBar(
  content: Text(
    'Alert has been pressed!',
    style: TextStyle(fontSize: 30),
  ),
  duration: Duration(seconds: 2),
);

const SnackBar snackBarTwo=SnackBar(
  content: Text(
    'Search has been pressed!',
    style: TextStyle(fontSize: 30),
  ),
);

const SnackBar snackBarThree=SnackBar(
  content: Text(
    'Navigation has been pressed!',
    style: TextStyle(fontSize: 30),
  ),
);

Future<void> _dialogBuilder(BuildContext context, String content) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: true,
    useSafeArea: true,
    useRootNavigator: true,
    builder: (context){
      return AlertDialog(
        icon: const Icon(
            Icons.warning,
          size: 60,
          color: Colors.red,
        ),
        title: const Text("Beware!"),
        content: Text(content),
        actions: [
          ElevatedButton(
            onPressed: (){
              Navigator.pop(context);
            },
            child: const Text('OK'),
          ),
        ],
      );
    },
  );
}


void clickNextPage(BuildContext context){
  Navigator.push(
      context,
      MaterialPageRoute(
          builder: (BuildContext context){
            return Scaffold(
              appBar: AppBar(
                title: const Text('Know yourself...'),
              ),
              body: const Center(
                child: Text(
                  'Dig deep into every layer of your mind to find yourself...',
                  style: TextStyle(
                    fontSize: 34,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }
      )
  );
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: (){
                ScaffoldMessenger.of(context).showSnackBar(snackBarOne);
              },
              icon: const Icon(Icons.add_alert),
            tooltip: 'Show SnackBar',
          ),
          IconButton(
            onPressed: (){
              ScaffoldMessenger.of(context).showSnackBar(snackBarTwo);
            },
            icon: const Icon(Icons.search),
            tooltip: 'Search',
          ),
          IconButton(
            onPressed: (){
              clickNextPage(context);
            },
            icon: const Icon(Icons.navigate_next),
            tooltip: 'Search',
          ),
        ],
        leading: IconButton(
          onPressed: (){
            ScaffoldMessenger.of(context).showSnackBar(snackBarThree);
          },
          icon: const Icon(Icons.menu),
          tooltip: 'Navigation Menu',
        ),
        title: const Text(
          'Knowledge Test',
          style: TextStyle(
            fontSize: 25,
            fontStyle: FontStyle.normal,
          ),
        ),
        backgroundColor: Colors.redAccent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text(
              'Answer a few questions and know your level...',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 25,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 15,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 1,
              ),
            ),
            padding: const EdgeInsets.all(10),
            width: 350,
            child: Card(
              elevation: 20,
              color: Colors.red,
              child: ElevatedButton(
                child: const Text(
                  'You have chosen answer 1',
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                  ),
                ),
                onPressed: () =>  _dialogBuilder(context,'You have chosen answer 1'),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 15,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 1,
              ),
            ),
            padding: const EdgeInsets.all(10),
            width: 350,
            child: Card(
              elevation: 20,
              color: Colors.red,
              child: ElevatedButton(
                child: const Text(
                  'You have chosen answer 2',
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                  ),
                ),
                onPressed: () =>  _dialogBuilder(context,'You have chosen answer 2'),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 15,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 1,
              ),
            ),
            padding: const EdgeInsets.all(10),
            width: 350,
            child: Card(
              elevation: 20,
              color: Colors.red,
              child: ElevatedButton(
                child: const Text(
                  'You have chosen answer 3',
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                  ),
                ),
                onPressed: () =>  _dialogBuilder(context,'You have chosen answer 3'),


              ),
            ),
          ),
        ],
      )

    );
  }

}

