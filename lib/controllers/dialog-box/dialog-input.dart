import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:mp_v1_0/controllers/text-box/text-box.dart';

class DialogInput {
  IconData icon;
  String title;
  double size;
  List<TextBox> content;

  List<DialogBoxItem> actions;
  Widget child;

  DialogInput ({IconData icon, String title='', double size=400.0, List<TextBox> content, List<DialogBoxItem> actions}) {
    this.icon = icon;
    this.title = title;
    this.size = size;
    this.content = (content != null) ? content : <TextBox> [];
    this.actions = actions;
    this.child = child;
  }

  void show (BuildContext context, {bool dismiss=true, IconData icon, String title='', double size=400.0, List<TextBox> content, List<DialogBoxItem> actions}) async {
    this.icon = (icon != null) ? icon : this.icon;
    this.title = (title != '') ? title : this.title;
    this.size = (size != 400.0) ? size : this.size;
    this.content = (content != null) ? content : this.content;
    this.actions = (actions != null) ? actions : this.actions;

    return showDialog(
      context: context,
      barrierDismissible: dismiss,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            children: <Widget> [
              (this.icon != null) ? (
                Row(
                  children: <Widget> [
                    Icon(this.icon),
                    SizedBox(width: 5)
                  ],
                )
              ) : Container(),
              Text(
                this.title,
                style: TextStyle(
                  fontSize: 22,
                  fontStyle: FontStyle.normal,
                )
              )
            ],
          ),
          content: new Row(
            children: this.content.map((textBox) => Expanded(
              child: Container(
                width: this.size,
                child: textBox.build(),
              )
            )).toList(),
          ),
          actions: this.actions.map((item) => item.build()).toList()     
      );
    });
  }
}

class DialogBoxItem {
  String text;
  Function then;

  DialogBoxItem ({String text='', Function onPressed}) {
    this.text = text;
    this.then = onPressed;
  }

  Widget build () {
    return TextButton(
      child: Text(this.text),
      onPressed: () {
        if (this.then != null) {
          this.then();
        }
      },
    );
  }
}

DialogBoxItem ActionItem ({String name='default', Function onTap}) {
  return DialogBoxItem(
    text: name,
    onPressed: () {
      if (onTap != null) onTap();
    }
  );
}