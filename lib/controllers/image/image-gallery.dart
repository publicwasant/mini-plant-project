import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:mp_v1_0/controllers/image/image-box.dart';
import 'package:mp_v1_0/controllers/button/button-image.dart';
import 'package:mp_v1_0/controllers/theme/theme.dart';

class ImageGallery {
  int column;
  String butImgSize;
  List<double> imgSize;
  List<String> imgsURL;

  Function then;
  Function longThen;

  ImageGallery ({int column=4, String imgSize='small', List<String> imgsURL, Function onTap(ButtonImage item), Function onLongTap(ButtonImage item)}) {
    this.column = column;
    this.butImgSize = imgSize;
    this.imgSize = theme.buttonImage['defaultSizes'][imgSize];
    this.imgsURL = (imgsURL != null) ? imgsURL : [];

    this.then = onTap;
    this.longThen = onLongTap;
  }

  Widget build ({BuildContext context}) {
    this.column = (context != null) ? (
      (MediaQuery.of(context).size.width*0.90) ~/ this.imgSize[0]
    ) : this.column;

    List<Widget> fitImgs = <Widget> [];
    bool aoBut = true;

    for (int i = 0; i < this.imgsURL.length; i += this.column) {
      List<Widget> fitRow = <Widget> [];

      for (int j = i; j < this.column+i; j++) {
        if ((j <= this.imgsURL.length-1)) {

          ButtonImage butImg = new ButtonImage(
            size: butImgSize,
            border: 1.0,
            imgURL: this.imgsURL[j],
          );

          butImg.onTap(() {
            if (this.then != null) {
              this.then(butImg);
            }
          });

          butImg.onLongTap(() {
            if (this.longThen != null) {
              this.longThen(butImg);
            }
          });

          fitRow.add(
            Container(
              margin: EdgeInsets.all(2.5),
              child: butImg.build()
            )
          );
        } else {
          if (aoBut) {
            ButtonImage addBut = new ButtonImage(
              size: butImgSize,
              border: 1.0,
              child: Icon(
                Icons.add_circle_outline, 
                color: Colors.grey,
                size: 25
              )
            );
            
            fitRow.add(
              Container(
                margin: EdgeInsets.all(2.5),
                child: addBut.build()
              )
            );

            aoBut = false;
            continue;
          }

          fitRow.add(
            Container(
              width: this.imgSize[0],
              height: this.imgSize[1],
              margin: EdgeInsets.all(2.5),
            )
          );
        }
      }

      fitImgs.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: fitRow
        )
      );
    }

    return Container(
      child: Column(
        children: fitImgs
      )
    );
  }
}