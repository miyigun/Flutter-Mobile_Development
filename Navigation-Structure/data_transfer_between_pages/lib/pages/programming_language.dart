import 'package:flutter/material.dart';

class ProgrammingLanguage extends StatefulWidget {
  final int radioGroupValue;

  const ProgrammingLanguage({Key? key, required this.radioGroupValue}) : super(key: key);

  @override
  State<ProgrammingLanguage> createState() => _ProgrammingLanguageState();
}

class _ProgrammingLanguageState extends State<ProgrammingLanguage> {
  final List<String> _programmingLanguageList= [];
  String? _selectedLanguage;
  int? _radioGroupValue;

  @override
  void initState() {
    super.initState();

    _programmingLanguageList
      ..add('Flutter')
      ..add('Python')
      ..add('Java');
    _radioGroupValue = widget.radioGroupValue;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Programming Language'),
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () => Navigator.pop(context, _selectedLanguage),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Radio(
                value: 0,
                groupValue: _radioGroupValue,
                onChanged: (index) => _radioOnChanged(index!),
              ),
              const Text('Flutter'),
              Radio(
                value: 1,
                groupValue: _radioGroupValue,
                onChanged: (index) => _radioOnChanged(index!),
              ),
              const Text('Python'),
              Radio(
                value: 2,
                groupValue: _radioGroupValue,
                onChanged: (index) => _radioOnChanged(index!),
              ),
              const Text('Java'),
            ],
          ),
        ),
      ),
    );
  }

  void _radioOnChanged(int index) {
    setState(() {
      _radioGroupValue = index;
      _selectedLanguage = _programmingLanguageList[index];
      print('_selectedRadioValue $_selectedLanguage');
    });
  }
}
