import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class TextBox {
  String label, hint;
  bool obscure;
  int maxLines;
  Icon icon;
  TextEditingController controller;

  TextBox ({String label='', String hint='', bool obscure=false, int maxLines=1, Icon icon}) {
    this.label = label;
    this.hint = hint;
    this.obscure = obscure;
    this.maxLines = maxLines;
    this.icon = icon;
    this.controller = new TextEditingController();
  }

  Widget build () {
    return Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 5),
      child: TextField(
        obscureText: (this.maxLines <= 1) ? this.obscure : false,
        keyboardType: TextInputType.multiline,
        maxLines: this.maxLines,
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