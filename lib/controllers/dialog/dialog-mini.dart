import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class DialogMini {
  String title;
  Widget content;
  List<Widget> actions;
  Function before;

  DialogMini ({String title: 'Title', Widget content, List<Widget> actions, Function before}) {
    this.title = title;
    this.content = content;
    this.actions = actions;
    this.before = before;
  }

  Future<dynamic> show (BuildContext context, {bool dismiss=true}) async {
    if (this.before != null) {
      this.before();
    }

    return showDialog(
      context: context,
      barrierDismissible: dismiss,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            this.title,
            style: TextStyle(
              fontSize: 22,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.bold
            )
          ),
          content: this.content,
          actions: this.actions
        );
      },
    );
  }
}