import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key, required this.title});

  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isChecked=false;
  bool isChecked2=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Theme(
                data: Theme.of(context).copyWith(
                  unselectedWidgetColor: Colors.red,
                ),
                child: Checkbox(
                  value: isChecked,
                  onChanged: (value){
                    setState(() {
                      isChecked=value!;
                    });
                  },
                  activeColor: Colors.red,
                  checkColor: Colors.white,
                ),

            ),
            Theme(
              data: Theme.of(context).copyWith(
                unselectedWidgetColor: Colors.red,
              ),
              child: CheckboxListTile(
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.red,
                checkColor: Colors.white,
                title: const Text("CheckBox"),
                subtitle: const Text("Subtitle"),
                value: isChecked2,
                onChanged: (value){
                  setState(() {
                    isChecked2=value!;
                  });

                },
              )
            ),
          ],
        ),
      ),
    );
  }
}
