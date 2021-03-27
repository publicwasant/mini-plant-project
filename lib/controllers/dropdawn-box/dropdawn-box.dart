import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class DropdawnBox extends StatefulWidget {
  DropdawnBox() {
  }

  @override
  _DropdawnBoxState createState() => _DropdawnBoxState();
}

class _DropdawnBoxState extends State<DropdawnBox> {
  String dropdownValue = 'One';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (value) {
        setState(() {
          dropdownValue = value;
        });
      },
      items: <String>['One', 'Two', 'Free', 'Four']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
