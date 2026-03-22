import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    var _overlayController=OverlayPortalController();

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ElevatedButton(
        onPressed: _overlayController.toggle,
        child: OverlayPortal(
          controller: _overlayController,
          overlayChildBuilder: (BuildContext context) {
            return const Positioned(
              top:  150,
              right:  150,
              child: Text("I'm an overlay!"),
            );
          },
          child: const Text("Press Me!"),
        ),
      ),
    );
  }

}
