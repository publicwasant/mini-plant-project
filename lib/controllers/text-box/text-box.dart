import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class TextBox {
  String label, hint;
  bool obscure;
  Icon icon;
  TextEditingController controller;

  TextBox ({String label='', String hint='', bool obscure=false, Icon icon}) {
    this.label = label;
    this.hint = hint;
    this.obscure = obscure;
    this.icon = icon;
    this.controller = new TextEditingController();
  }

  Widget build () {
    return Padding(
      padding: const EdgeInsets.only(left: 35, right: 35, top: 5, bottom: 5),
      child: TextField(
        obscureText: this.obscure,
        decoration: InputDecoration (
          prefixIcon: this.icon,
          border: OutlineInputBorder(),
          labelText: this.label,
          hintText: this.hint
        ),
        controller: this.controller,
      ),
    );
  }
}