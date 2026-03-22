import 'package:flutter/material.dart';
import 'package:flutter_provider_example/models/counting_the_number.dart';
import 'package:provider/provider.dart';

class ColumnClass extends StatelessWidget {
  const ColumnClass({super.key});

  @override
  Widget build(BuildContext context) {
    // ‘Provider.of’, just like Consumer needs to know the type of the model.
    // We need to specify the model ‘CountingTheNumber’.
    //this time only this widget will be rebuilt
    final CountingTheNumber counter = Provider.of<CountingTheNumber>(context);

    return Column(
      children: [
        const SizedBox(
          height: 10.0,
        ),
        Text(
          '${counter.number}',
          style: const TextStyle(
            fontSize: 25.0
          ),
        ),
        const SizedBox(
          height: 20.0,
        ),
        FloatingActionButton(
            onPressed: (){
              counter.increaseNumber();
            },
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      ],
    );
  }

}