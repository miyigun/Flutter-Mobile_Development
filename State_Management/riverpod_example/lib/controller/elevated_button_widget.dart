import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:riverpod_example/model/provider_model.dart';

class ElevatedButtonWidget extends StatelessWidget {
  const ElevatedButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProviderModel>(
      create: (context) => ProviderModel(),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            color: Colors.blue[200],
            child: Consumer<ProviderModel>(
              builder: (context, myModel, child) {
                return FloatingActionButton(
                  onPressed: () => myModel.changeName(),
                  tooltip: 'Change Name',
                  child: const Icon(Icons.add),
                );
              },
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Container(
            padding: const EdgeInsets.all(15),
            color: Colors.redAccent,
            child: Consumer<ProviderModel>(
              builder: (context, myModel, child) {
                return Text(myModel.littleMonk);
              },
            ),
          ),
        ],
      ),
    );
  }
}
