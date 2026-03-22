
import 'package:data_transfer_between_pages/pages/info.dart';
import 'package:data_transfer_between_pages/pages/programming_language.dart';
import 'package:flutter/material.dart';

void main() => runApp(const Home());

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Data Transfer Between Pages',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? _mySelectedProgrammingLanguage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Programming Language'),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outlined),
            onPressed: () => _openPageInfo(context, fullscreenDialog: true),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Programming language: $_mySelectedProgrammingLanguage',
            style: const TextStyle(fontSize: 20.0),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openProgrammingLanguageSelection(context),
        tooltip: 'Select',
        child: const Icon(Icons.code_sharp),
      ),
    );
  }

  void _openPageInfo(BuildContext context, {bool fullscreenDialog = false}) {
    Navigator.push(
        context,
        MaterialPageRoute(
          fullscreenDialog: fullscreenDialog,
          builder: (context) => const Info(),
        ));
  }

  void _openProgrammingLanguageSelection(BuildContext context,
      {bool fullscreenDialog = false}) async {
    String? _programmingLanguageResponse = await Navigator.push(
        context,
        MaterialPageRoute(
          fullscreenDialog: fullscreenDialog,
          builder: (context) => const ProgrammingLanguage(
            radioGroupValue: -1,
          ),
        ));
    setState(() {
      _mySelectedProgrammingLanguage = _programmingLanguageResponse ?? '';
    });
  }
}
