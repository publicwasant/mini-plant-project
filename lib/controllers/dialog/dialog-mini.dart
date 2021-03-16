import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class DialogMini {
  String title;
  String content;

  List<DialogMiniItem> actions;
  Widget child;

  DialogMini ({String title='', String content='', List<DialogMiniItem> actions}) {
    this.title = title;
    this.content = content;
    this.actions = actions;
    this.child = child;
  }

  void show (BuildContext context, {bool dismiss=true, String title='', String content='', List<DialogMiniItem> actions}) async {
    this.title = (title != '') ? title : this.title;
    this.content = (content != '') ? content : this.content;
    this.actions = (actions != null) ? actions : this.actions;
    
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
            )
          ),
          content: Text(this.content),
          actions: this.actions.map((item) => item.build()).toList()     
      );
    });
  }

  void warning (BuildContext context, {bool dismiss=true, String title='', String content='', List<DialogMiniItem> actions}) async {
    this.title = (title != '') ? title : this.title;
    this.content = (content != '') ? content : this.content;
    this.actions = (actions != null) ? actions : this.actions;
    
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
            )
          ),
          content: Text(
            this.content,
            style: TextStyle(
              color: Colors.yellow[900]
            ),
          ),
          actions: this.actions.map((item) => item.build()).toList()     
      );
    });
  }

  void error (BuildContext context, {bool dismiss=true, String title='', String content='', List<DialogMiniItem> actions}) async {
    this.title = (title != '') ? title : this.title;
    this.content = (content != '') ? content : this.content;
    this.actions = (actions != null) ? actions : this.actions;
    
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
            )
          ),
          content: Text(
            this.content,
            style: TextStyle(
              color: Colors.red
            ),
          ),
          actions: this.actions.map((item) => item.build()).toList()     
      );
    });
  }
}


class DialogMiniItem {
  String text;
  Function then;

  DialogMiniItem ({String text='', Function onPressed}) {
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