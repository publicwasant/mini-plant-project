import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class SideMenu {
  int current;

  String title;
  Function then;

  List<dynamic> pages;
  List<Widget> items;

  SideMenu({String title, List<dynamic> options, Function onTap}) {
    this.title = title;
    this.pages = [];
    this.then = onTap;

    this.items = [
      DrawerHeader(
        child: Text(
          title,
          style: TextStyle(fontSize: 28, color: Colors.white),
          ),
          decoration: BoxDecoration(
          color: Colors.lightBlue[800]
        ),
      ),
    ];

    if (options != null) {
      for (int i = 0; i < options.length; i++) {
        this.pages.add(options[i][1]);
        this.items.add(
          ListTile(
            title: Text(options[i][0]),
            leading: options[i][2],  
            onTap: () {this._toWork(i);}
          )
        );
      }
    }
  }

  Widget biuld () {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: this.items
      ),
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
