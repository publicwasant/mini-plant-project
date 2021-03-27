import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:mp_v1_0/controllers/image/image-box.dart';

/*
 * sources: https://pub.dev/packages/carousel_slider
 */

class ImageSlider {
  String title;
  double fontSize;
  Color fontColor;
  
  int current;
  Color backgroundColor;
  List<String> imgsURL;

  Function then;

  ImageSlider ({String title='', double fontSize=18, Color fontColor, int current=0, Color backgroundColor, List<String> imgsURL, void onPageChanged(int index)}) {
    this.title = title;
    this.fontSize = fontSize;
    this.fontColor = (fontColor != null) ? fontColor : Colors.grey[800];
    
    this.current = current;
    this.backgroundColor = (backgroundColor != null) ? backgroundColor : Colors.grey.withOpacity(0.16);
    this.imgsURL = imgsURL;
    this.then = onPageChanged;
  }

  Widget build ({BuildContext context, dynamic state}) {
    return Container(
      color: this.backgroundColor.withOpacity(0.16),
      child: Column(
        children: <Widget> [
          (this.title != '') ? (
            Text(
              this.title,
              style: TextStyle(
                fontSize: this.fontSize,
                color: this.fontColor
              )
            )
          ) : Container(),
          SizedBox(height: 10,),
          CarouselSlider(
            items: this.imgsURL.map((item) => Container(
              child: Container(
                margin: EdgeInsets.all(5.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  child: Stack(
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width*0.90,
                        child: ImageBox(url: item, visitExcept: true).build(),
                      ),
                    ],
                  )
                ),
              ),
            )).toList(),
            options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true,
              aspectRatio: 2.0,
              onPageChanged: (index, reason) {
                this.current = index;

                if (this.then != null) {
                  this.then(index);
                }
              }
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: this.imgsURL.map((url) {
              int index = this.imgsURL.indexOf(url);
              return Container(
                width: 8.0,
                height: 8.0,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: this.current == index
                    ? Color.fromRGBO(0, 0, 0, 0.9)
                    : Color.fromRGBO(0, 0, 0, 0.4),
                ),
              );
            }).toList(),
          ),
        ],
      )
    );
  }
}

