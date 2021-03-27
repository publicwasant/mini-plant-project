import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class TextBox {
  String label, hint;
  bool autoFocus;
  bool obscure;
  int maxLines;
  TextInputType keyboardType;
  Icon icon;
  TextEditingController controller;

  TextBox ({String label='', String hint='', bool autoFocus=false, bool obscure=false, int maxLines=1, TextInputType keyboardType, Icon icon}) {
    this.label = label;
    this.hint = hint;
    this.autoFocus= autoFocus;
    this.obscure = obscure;
    this.maxLines = maxLines;
    this.icon = icon;
    this.controller = new TextEditingController();
  }

  Widget build () {
    return Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 5),
      child: TextField(
        autofocus: this.autoFocus,
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