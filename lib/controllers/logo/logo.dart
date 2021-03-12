import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Logo {
  String title;
  String subTitle;
  Map<String, double> size;
  List<Color> colors;

  Widget child;

  Logo ({String title='Mini Plant', String subTitle='ร้านขายต้นไม้เล็ก', Map<String, double> size, List<Color> colors, Widget child}) {
    this.title = title;
    this.subTitle = subTitle;
    this.size = (size != null) ? size : {'width': 360, 'height': 150};
    this.colors = (colors != null) ? colors : <Color> [Colors.green, Colors.white];
    this.child = child;
  }

  Widget build ({Widget child}) {
    this.child = (child != null) ? child : Container();

    return Container(
      width: this.size['width'] + 20,
      height: this.size['height'] + 5,
      child: Stack(
        children: <Widget> [
          Positioned(
            child: Align(
              alignment: Alignment.center,
              child: Container(
                padding: const EdgeInsets.all(10),
                width: this.size['width'] + 20,
                height: this.size['height'] + 5,
                decoration: BoxDecoration(
                  color: this.colors[0].withOpacity(0.4),
                  borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(150), 
                    bottomRight: Radius.circular(10),
                    topRight: Radius.circular(150),
                    topLeft: Radius.circular(10)
                  ),
                ),
              ),
            )
          ),
          Positioned(
            child: Align(
              alignment: Alignment.center,
              child: Container(
                padding: const EdgeInsets.all(10),
                width: this.size['width'],
                height: this.size['height'],
                decoration: BoxDecoration(
                  color: this.colors[0].withOpacity(0.8),
                  borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(150), 
                    bottomRight: Radius.circular(20),
                    topRight: Radius.circular(150),
                    topLeft: Radius.circular(20)
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget> [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget> [
                        Text(
                          this.title,
                          style: TextStyle(
                            fontSize: 48,
                            color: this.colors[1]
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget> [
                        Text(
                          this.subTitle,
                          style: TextStyle(
                            fontSize: 18,
                            color: this.colors[1]
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget> [
                        this.child
                      ],
                    ),
                  ],
                )
              )
            ),
          )
        ],
      ),
    );
  }
}