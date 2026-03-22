import 'package:flutter/material.dart';

class ChildWidget extends StatelessWidget {
  const ChildWidget({super.key, this.inActive=true, required this.notifyParent});
  final bool inActive;

  final ValueChanged<bool> notifyParent;
  void manageState(){
    notifyParent(!inActive);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: manageState,
      child: Container(
        width: 250.0,
        height: 250.0,
        decoration: BoxDecoration(color: inActive ? Colors.red : Colors.green),
        child: Center(
          child: Text(
            inActive ? 'Inactive' : 'Active',
            style: const TextStyle(
              fontSize: 25.0,
              color: Colors.white
            ),
          ),
        ),
      ),
    );
  }

}