import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

Color FontColor = Colors.grey[800];
double FontDetailSize = 12;

class ButtonTile {
  String title;
  String subTitle;
  IconData icon;

  Function then;

  ButtonTile ({String title='', String subTitle='', IconData icon, Function onTap}) {
    this.title = title;
    this.subTitle = subTitle;
    this.icon = icon;

    this.then = onTap;
  }

  Widget build () {
    return Container(
      child: InkWell(
        onTap: () {
          if (this.then != null) {
            this.then();
          }
        },
        child: ListTile(
          leading: Icon(this.icon),
          title: Text(this.title),
          subtitle: Text(
            this.subTitle,
            style: TextStyle(
              fontSize: FontDetailSize,
              color: FontColor
            ),
          ),
        ),
      )
    );
  }

  Function onTap (Function then) {
    this.then = then;
  }
}