import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<FormState> _formStateKey=GlobalKey<FormState>();

  //Order to Save
  final Order _order=Order();

  String? _validateItemRequired(String value){
    return value.isEmpty ? 'Item Required' : null;
  }

  String? _validateItemCount(String value){
    //Check if value is not null and convert to integer
    int? _valueAsInteger=value.isEmpty ? 0 : int.tryParse(value);
    return _valueAsInteger==0 ? 'At least one Item is Required' : null;
  }

  void _submitOrder() {
    if (_formStateKey.currentState!.validate()){
      _formStateKey.currentState?.save();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Form(
              key: _formStateKey,
              autovalidateMode: AutovalidateMode.always,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Espresso',
                        labelText: 'Item',
                      ),
                      validator: (value) => _validateItemRequired(value!),
                      onSaved: (value) => _order.item=value!,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: '3',
                        labelText: 'Quantity',
                      ),
                      validator: (value) => _validateItemCount(value!),
                      onSaved: (value) => _order.quantity=int.tryParse(value!)!,
                    ),

                    const Divider(height: 32.0,),
                    ElevatedButton(
                        onPressed: () => _submitOrder(),
                        child: const Text('Save'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Order {
  late String item;
  late int quantity;
}


