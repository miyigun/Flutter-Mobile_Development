import 'package:flutter/material.dart';
import 'package:list_to_map_example2/controller/controller.dart';

class AllPage extends StatelessWidget {
  const AllPage({super.key});

  static const routename = "/all-page";

  @override
  Widget build(BuildContext context) {
    final length = ModalRoute.of(context)!.settings.arguments as List<int>;

    Controller controller = Controller();

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Pressed to ${length[1]}",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "Length of List: ${length[0]}",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "${controller.map1}",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "${controller.map2}",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "${controller.map3}",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "${controller.map3.toList().length}",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
