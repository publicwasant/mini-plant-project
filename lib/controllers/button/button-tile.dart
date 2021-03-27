import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

Color FontColor = Colors.grey[800];
double FontDetailSize = 12;

class ButtonTile {
  String title;
  String subTitle;
  IconData icon;

  double fontSize;
  Color fontColor;

  Function then;

  ButtonTile ({String title='', String subTitle='', IconData icon, double fontSize=12, Color fontColor, Function onTap}) {
    this.title = title;
    this.subTitle = subTitle;
    this.icon = icon;

    this.fontSize = fontSize;
    this.fontColor = (fontColor != null) ? fontColor : FontColor;

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
              fontSize: this.fontSize,
              color: this.fontColor
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