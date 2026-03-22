import 'package:flutter/material.dart';

class EyeColor extends InheritedWidget {
  const EyeColor({super.key,
    required this.color,
    required Widget child
  }) : super(child: child);

  final Color color;

  static EyeColor? of(BuildContext context){
    return context.dependOnInheritedWidgetOfExactType<EyeColor>();
  }

  @override
  bool updateShouldNotify(EyeColor oldWidget) => color != oldWidget.color;
}

class ChangingAge extends InheritedWidget {
  const ChangingAge({super.key,
    required this.age,
    required Widget child,
}) : super( child: child);

  final ChangeAge age;

  static ChangingAge? of(BuildContext context){
    return context.dependOnInheritedWidgetOfExactType<ChangingAge>();
  }

  @override
  bool updateShouldNotify(ChangingAge oldWidget) => age != oldWidget.age;
}

class ChangeAge {
  int age;
  ChangeAge({required this.age});
  void changeAge(){
    age +=5;
  }
}

class GrandParent extends StatelessWidget {
  const GrandParent({super.key});

  @override
  Widget build(BuildContext context) {
    final eyeColor=EyeColor.of(context)?.color;
    return Column(
      children: [
        Text(
          'I am the Grandparent, although I am a Ghost now!I had two sons.',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25.0,
            color: eyeColor,
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        const FatherClass(),
      ],
    );
  }

}

class FatherClass extends StatelessWidget {
  const FatherClass({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'I am the Father. I have two brothers.',
          style: TextStyle(
            color: EyeColor.of(context)?.color,
            fontSize: 30.0,
            fontWeight: FontWeight.bold
          ),
        ),
      ],
    );
  }
}

class UncleClasses extends StatelessWidget {
  const UncleClasses({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text(
          'This is a list of Uncles with different states.',
          style: TextStyle(
            color: Colors.black45,
            fontSize: 25.0,
            fontWeight: FontWeight.bold
          ),
        ),
        SizedBox(
          height: 5.0,
        ),
        FirstUncleClass(),
        SizedBox(
          height: 5.0,
        ),
        UncleClass(),
      ],
    );
  }
}

class UncleClass extends StatefulWidget {
  const UncleClass({super.key});

  @override
  UncleClassState createState() => UncleClassState();
}

class UncleClassState extends State<UncleClass>{
  var uncleAge = ChangeAge(age: 35);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'I am First Uncle, ${uncleAge.age} years old, change my age by add button below.',
          style: const TextStyle(
            fontSize: 30.0,
            color: Colors.lightGreenAccent,
            backgroundColor: Colors.black,
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        FloatingActionButton(
          onPressed: (){
            setState(() {
              uncleAge.changeAge();
            });
          },
          backgroundColor: Colors.blue,
          child: const Icon(Icons.add),
        ),
      ],
    );
  }
}

class FirstUncleClass extends StatefulWidget {
  const FirstUncleClass({super.key});

  @override
  FirstUncleClassState createState() => FirstUncleClassState();
}

class FirstUncleClassState extends State<FirstUncleClass>{
  var firstUncleAge = ChangeAge(age: 35);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'I am First Uncle, ${firstUncleAge.age} years old, change my age by add button below.',
          style: const TextStyle(
            fontSize: 30.0,
            color: Colors.lightGreenAccent,
            backgroundColor: Colors.black,
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        FloatingActionButton(
            onPressed: (){
              setState(() {
                firstUncleAge.changeAge();
              });
            },
          backgroundColor: Colors.blue,
            child: const Icon(Icons.add),
        ),
      ],
    );
  }
}

