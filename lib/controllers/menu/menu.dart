import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Menu {
  int current;
  List<String> label;
  Function then;

  List<BottomNavigationBarItem> items;

  Menu({List<dynamic> options, int current}) {
    this.current = current;
    this.items = [];

    if (options != null) {
      for (int i = 0; i < options.length; i++) {
        this.items.add(BottomNavigationBarItem(label: options[i][0], icon: options[i][1]));
      }
    }
  }

  Widget build() {
    return BottomNavigationBar(
      onTap: this._toWork,
      currentIndex: this.current,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.lightBlue[800],
      items: this.items
    );
  }

  void onTap (Function then) {
    this.then = then;
  }

  void _toWork (int index) {
    this.current = index;

    if (this.then != null) {
      this.then();
    }
  }
}