import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_consumer/controller/counting_the_number.dart';

class ColumnClass extends StatelessWidget {
  const ColumnClass({super.key});

  @override
  Widget build(BuildContext context) {
    /// we're using Consumer widget instead of Provider.of().
    /// we've put our Consumer widget as deep as possible in the tree

    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(5.0),
          child: Consumer<CountingTheNumber>(
            builder: (context, message, child) {
              return Column(
                children: [
                  child!,
                  Text(
                    message.message,
                    style: const TextStyle(fontSize: 25.0),
                  ),
                ],
              );
            },

            ///building a humongous widget tree
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      'First Row',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.blue,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      'Second Row',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.red,
                      ),
                    ),
                    Divider(
                      color: Colors.black,
                      height: 20,
                      thickness: 5,
                      indent: 20,
                      endIndent: 0,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Container(
          margin: const EdgeInsets.all(5.0),
          child: Consumer<CountingTheNumber>(
            builder: (context, message, child) {
              return Column(
                children: [
                  FloatingActionButton(
                    onPressed: () {
                      message.testMessage();
                    },
                    tooltip: 'Increment',
                    child: const Icon(Icons.ac_unit_rounded),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  child! ,
                ],
              );
            },

            ///building another humongous widget tree
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      'First Row',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.blue,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      'Second Row',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
