import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:mp_v1_0/controllers/theme/theme.dart';
import 'package:mp_v1_0/controllers/loader/loader.dart';
import 'package:mp_v1_0/controllers/image/image-box.dart';

class Button {
  IconData icon;
  String title='';
  String subTitle='';
  List<double> size;
  Map<String, Color> colors=theme.button['defaultColors'];
  String imgURL;
  bool imgVisitExcept;
  double border;
  Loader loading;

  Function then;

  Button ({
    IconData icon, 
    String title='', 
    String subTitle='',
    String size='medium', 
    double border=0.0, 
    Map<String, Color> colors,
    String imgURL='',
    bool imgVisitExcept=false,
    bool loading=false,
    Function onTap
  }) {
    this.icon = icon;
    this.title = title;
    this.subTitle = subTitle;
    this.size = theme.button['defaultSizes'][size];
    this.border = border;
    this.colors = (colors != null) ? colors : theme.button['defaultColors'];
    this.imgURL = imgURL;
    this.imgVisitExcept = imgVisitExcept;
    this.loading = new Loader(color: this.colors['font']);
    this.then = onTap;
  }

  Widget build () {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
        width: this.size[0],
        height: this.size[1],
        decoration: BoxDecoration(
          color: this.colors['background'],
          borderRadius: BorderRadius.all(
            Radius.circular(this.size[1]/2)
          ),
          border: (this.border != 0.0) ? Border.all(
            color: this.colors['border'],
            width: this.border,
          ) : null,
        ),
        child: Container(
          child: Stack(
            children: <Widget> [
              (this.imgURL != '') ? (
                Positioned(
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: this.size[0],
                      height: this.size[1],
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(this.size[1]/2),
                        child: ImageBox(url: this.imgURL, visitExcept: imgVisitExcept).build(),
                      )
                    )
                  )
                )
              ) : Container(),
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
                                    color: this.colors['font']
                                  )
                                )
                              ) : Container(),
                              Text(
                                this.title,
                                style: TextStyle(
                                  color: this.colors['font'], 
                                  fontSize: this.size[2]
                                ),
                              ),
                              (this.subTitle != '') ? (
                                Container(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: Text(
                                    this.subTitle,
                                    style: TextStyle(
                                      color: this.colors[2], 
                                      fontSize: this.size[3]
                                    ),
                                  )
                                )
                              ) : Container(),
                            ]
                          )
                        ) : (
                          this.loading.build()
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