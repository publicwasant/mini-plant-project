import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:mp_v1_0/controllers/spin/spin.dart';

Map<String, List<double>> ButtonSizes = {
  'small': [400, 30.0, 14.0, 12.0],
  'medium': [400, 60.0, 16.0, 14.0],
  'large': [400, 90.0, 18.0, 16.0],
};

class ButtonPanel {
  IconData icon;
  String title;
  String subTitle;
  List<double> size;
  double border;
  List<Color> colors;
  Spin loading;

  Function then;

  ButtonPanel ({IconData icon, String title='', String subTitle='', String size='medium', double border=1.0, List<Color> colors, Function onTap}) {
    this.icon = icon;
    this.title = title;
    this.subTitle = subTitle;
    this.size = ButtonSizes[size];
    this.border = border;
    this.colors = (colors != null) ? colors: [Colors.white, Colors.grey[800], Colors.grey[300]];
    this.loading = new Spin(color: this.colors[1]);
    this.then = onTap;
  }

  Widget build ({double width, double height}) {

    double resWidth = (width != null) ? width : this.size[0];
    double resHeight = (height != null) ? height : this.size[1];
    double resFontSize = this.size[2];
    double resFontSubSize = this.size[3];

    return Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
        width: resWidth,
        height: resHeight,
        decoration: BoxDecoration(
          color: this.colors[0],
          borderRadius: BorderRadius.all(
            Radius.circular(resHeight/2)
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
                    width: resWidth,
                    height: resHeight,
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(resHeight/2),
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
                                    size: resHeight/2, 
                                    color: this.colors[1]
                                  )
                                )
                              ) : Container(),
                              Text(
                                this.title,
                                style: TextStyle(
                                  color: this.colors[1], 
                                  fontSize: resFontSize
                                ),
                              ),
                              (this.subTitle != '') ? (
                                Container(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: Text(
                                    this.subTitle,
                                    style: TextStyle(
                                      color: this.colors[1], 
                                      fontSize: resFontSubSize
                                    ),
                                  )
                                )
                              ) : Container(),
                            ],
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