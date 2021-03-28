import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class DropdawnBox {
  int current;
  List<String> items;
  IconData icon;

  Function then;

  DropdawnBox ({
    int current=0, 
    List<String> items, 
    IconData icon,
    Function onChanged(int current, String value)
  }) {
    this.current = current;
    this.items = (items != null) ? items : <String> [];
    this.icon = icon;

    this.then = onChanged;
  }
  
  Widget build() {
    return StatefulBuilder(
      builder: (context, setState) {
        return Container(
          child: DropdownButton<String>(
            value: (this.items.length > 0) ? this.items[this.current] : 'default',
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

                if (this.then != null) {
                  this.then(this.current, value);
                }
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
      },
    );
  }

  

  Function onChanged (Function onChanged(int current, String value)) {
    this.then = onChanged;
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