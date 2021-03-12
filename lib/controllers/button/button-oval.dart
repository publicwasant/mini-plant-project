import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:mp_v1_0/controllers/image/image-mini.dart';
import 'package:mp_v1_0/controllers/spin/spin.dart';

class ButtonOval {
  String text;
  double size;
  double border;
  List<Color> colors;
  String image;
  bool imageVisitExcept;
  Spin loading;

  Function then;

  Map<String, double> sizes = {
    'very-small': 50,
    'small': 75,
    'medium': 100,
    'large': 150,
    'very-large': 200
  };

  ButtonOval ({String text='', String size='medium', double border=0.0, List<Color> colors, String image, bool imageVisitExcept=false, Function onTap}) {
    this.text = text;
    this.size = (this.sizes[size] != null) ? this.sizes[size] : this.sizes['medium'];
    this.border = border;
    this.colors = (colors != null) ? colors : [Colors.grey[300], Colors.white, Colors.grey[800]];
    this.image = image;
    this.imageVisitExcept = imageVisitExcept;
    this.loading = new Spin(color: this.colors[1]);
    this.then = onTap;
  }

  Widget build () {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
        width: this.size,
        height: this.size,
        decoration: BoxDecoration(
          color: (this.colors[2] != null) ? this.colors[2] : Colors.black54,
          borderRadius: BorderRadius.all(
            Radius.circular(this.size/2)
          ),
          border: (this.border != 0.0) ? Border.all(
            color: this.colors[2],
            width: this.border
          ) : null,
        ),
        child: Container(
          child: Stack(
            children: <Widget> [
              Positioned(
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: this.size,
                    height: this.size,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(this.size/2),
                      child: ImageMini(url: this.image, visitExcept: this.imageVisitExcept).build(),
                    )
                  )
                )
              ),
              Positioned(
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: this.size,
                    height: this.size,
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(this.size/2),
                      ),
                      child: Container(
                        child: (!this.loading.isBegin) ? (
                          Text(
                            this.text,
                            style: TextStyle(
                              color: this.colors[1], 
                            ),
                          )
                        ) : (
                          this.loading.spin
                        ),
                      ),
                      onPressed: () {
                        if (this.then != null) {
                          this.then();
                        }
                      },
                    ),
                  )
                )
              )
            ],
          ),
        ),
      ),
    );
  }

  void onTap (Function then) {
    this.then = then;
  }
}