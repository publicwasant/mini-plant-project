import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:mp_v1_0/controllers/spin/spin.dart';

Map<String, List<double>> ButtonSizes = {
  'small': [150.0, 30.0, 16.0],
  'medium': [200.0, 40.0, 16.0],
  'large': [250.0, 50.0, 16.0]
};

class Button {
  IconData icon;
  String text;
  List<double> size;
  double border;
  List<Color> colors;
  Spin loading;

  Function then;

  Button ({IconData icon, String text='', String size='medium', double border=0.0, List<Color> colors, Function onTap}) {
    this.icon = icon;
    this.text = text;
    this.size = ButtonSizes[size];
    this.border = border;
    this.colors = (colors != null) ? colors: [Colors.lightBlue[800], Colors.white, Colors.black54];
    this.loading = new Spin(color: this.colors[1]);
    this.then = onTap;
  }

  Widget build () {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
        width: this.size[0],
        height: this.size[1],
        decoration: BoxDecoration(
          color: this.colors[0],
          borderRadius: BorderRadius.all(
            Radius.circular(this.size[1]/2)
          ),
          border: (this.border != 0.0) ? Border.all(
            color: (this.colors[2] != null) ? this.colors[2] : Colors.black54,
            width: this.border,
          ) : null,
        ),
        child: Container(
          child: Stack(
            children: <Widget> [
              Positioned(
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: this.size[0],
                    height: this.size[1],
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(this.size[1]/2),
                      ),
                      child: Container(
                        child: (!this.loading.isBegin) ? (
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget> [
                              (this.icon != null) ? (
                                Container(
                                  padding: const EdgeInsets.only(right: 5),
                                  child: Icon(
                                    this.icon, 
                                    size: this.size[1]/2, 
                                    color: this.colors[1]
                                  )
                                )
                              ) : Container(),
                              Text(
                                this.text,
                                style: TextStyle(
                                  color: this.colors[1], 
                                  fontSize: this.size[2]
                                ),
                              ),
                            ]
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
          )
        ),
      ),
    );
  }

  void onTap (Function then) {
    this.then = then;
  }
}