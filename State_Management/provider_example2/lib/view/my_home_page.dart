import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example2/controller/counting_the_number.dart';
import 'package:provider_example2/controller/first_model_provider.dart';
import 'package:provider_example2/controller/second_model_provider.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final counter=Provider.of<CountingTheNumber>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(10),
            children: <Widget>[
              const Text(
                "You have pushed the button this many times",
                style: TextStyle(
                  fontSize: 25,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                '${counter.value}',
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                  height: 10
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: ()=> counter.increaseValue(),
                    child: const Text(
                      'Increase',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      onPressed: ()=> counter.decreaseValue(),
                      child: const Text(
                          'Decrease',
                          style: TextStyle(
                            fontSize: 20,
                          )
                      )
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(10),
                    color: Colors.red,
                    child: Consumer<FirstModelProvider>(
                      builder: (context, firstModelProvider, child) =>
                          ElevatedButton(
                              onPressed: (){
                                firstModelProvider.supplyFirstData();
                              },
                              child: const Text(
                                "Press me!",
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              )
                          ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    color: Colors.white30,
                    child:  Consumer<FirstModelProvider>(
                      builder: (context, firstModelProvider, child)=> Text(
                        firstModelProvider.someDate,
                        style: const TextStyle(
                            fontSize: 40
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    color: Colors.red[200],
                    child: Consumer<FirstModelProvider>(
                      builder: (context,firstModelProvider, child)=>ElevatedButton(
                        onPressed: (){
                          firstModelProvider.clearData();
                        },
                        child: const Text(
                          "Reset",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    color: Colors.white30,
                    child: Consumer<SecondModelProvider>(
                      builder: (context,secondModel, child)=>Text(
                        secondModel.name,
                        style: const TextStyle(
                          fontSize: 40
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    color: Colors.red[200],
                    child: Consumer<SecondModelProvider>(
                      builder: (context, secondModel, child)=> ElevatedButton(
                          onPressed: ()=> secondModel.getFirstName(),
                          child: const Text(
                            'Get First Name',
                            style: TextStyle(
                              fontSize: 20
                            ),
                          )
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        )
    );
  }

}
