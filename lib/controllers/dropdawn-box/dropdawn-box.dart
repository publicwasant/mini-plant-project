import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class DropdawnBox extends StatefulWidget {
  String title;
  int current;
  List<String> items;
  IconData icon;
  
  DropdawnBox({String title='default', int current=0, List<String> items, IconData icon}) {
    this.title = title;
    this.current = current;
    this.items = items;
    this.icon = icon;
  }

  @override
  _DropdawnBoxState createState() => _DropdawnBoxState(
    title: this.title,
    current: this.current,
    items: this.items,
    icon: this.icon
  );
}

class _DropdawnBoxState extends State<DropdawnBox> {
  String title;
  int current;
  List<String> items;
  IconData icon;

  _DropdawnBoxState ({String title='default', int current=0, List<String> items, IconData icon}) {
    this.title = title;
    this.current = current;
    this.items = (items != null) ? items : <String> [];
    this.icon = icon;
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width*0.90,
      height: 50,
      child: DropdownButton<String>(
        value: (this.items.length > 0) ? this.items[this.current] : this.title,
        icon: Icon(this.icon),
        iconSize: 24,
        elevation: 16,
        underline: Container(
          height: 2,
          color: Colors.grey[800],
        ),
        onChanged: (value) {
          setState(() {
            this.current = this.items.indexOf(value);
          });
        },
        items: this.items.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}

class DropdawnBoxItem {
  bool current;
  String label;
  dynamic value;
  
  DropdawnBoxItem ({bool current=false, String label='', dynamic value}) {
    this.current = current;
    this.label = label;
    this.value = value;
  }
}