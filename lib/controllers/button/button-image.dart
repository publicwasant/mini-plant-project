import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:mp_v1_0/controllers/button/button.dart';
import 'package:mp_v1_0/controllers/image/image-box.dart';
import 'package:mp_v1_0/controllers/theme/theme.dart';

class ButtonImage {
  String imgURL;
  List<double> size;
  double border;
  double margin;

  Function then;
  Function longThen;

  Widget child;

  ButtonImage({String imgURL='', String size='small', double border=0.0, double margin=0.0, Function onTap, Function onLongTap, Widget child}) {
    this.imgURL = imgURL;
    this.size = theme.buttonImage['defaultSizes'][size];
    this.border = border;
    this.margin = margin;

    this.then = onTap;
    this.longThen = onLongTap;

    this.child = child;
  }

  Widget build () {
    return Container(
      width: this.size[0],
      height: this.size[1],
      margin: EdgeInsets.all(this.margin),
      child: Stack(
        children: <Widget> [
          Positioned(
            child: Align(
              alignment: Alignment.center,
              child: ImageBox(url: this.imgURL).build(),
            )
          ),
          Positioned(
            child: Align(
              alignment: Alignment.center,
              child: (this.child != null) ? this.child : Container(),
            )
          ),
          Positioned(
            child: Align(
              alignment: Alignment.center,
              child: FlatButton(
                child: Container(),
                onPressed: () {
                  if (this.then != null) {
                    this.then();
                  }
                },
                onLongPress: () {
                  if (this.longThen != null) {
                    this.longThen();
                  }
                },
              ),
            )
          ),
        ],
      ),
      decoration: BoxDecoration(
        border: (this.border != 0.0) ? (
          Border.all(
            color: Colors.grey,
            width: this.border
          )
        ) : null
      )
    );
  }

  void onTap (Function onTap) {
    this.then = onTap;
  }

  void onLongTap (Function onLongTap) {
    this.longThen = onLongTap;
  }
}