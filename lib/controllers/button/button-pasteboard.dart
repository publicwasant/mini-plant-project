import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:mp_v1_0/controllers/button/button-oval.dart';

class ButtonProfile {
  String imgURL;
  String title;
  List<String> subTitles;

  Function then;

  ButtonProfile ({String imgURL='', String title='', List<String> subTitles, Function onTap}) {
    this.imgURL = imgURL;
    this.title = title;
    this.subTitles = (subTitles != null) ? subTitles : [];

    this.then = onTap;
  }

  Widget build () {
    return Container(
      color: Colors.grey.withOpacity(0.16),
      child: InkWell(
        onTap: () {
          if (this.then != null) {
            this.then();
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Stack(
            children: <Widget> [
              Positioned(
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget> [
                      ButtonOval(
                        size: 'small',
                        border: 2.0,
                        imgURL: this.imgURL,
                        imgVisitExcept: true,
                        onTap: () {
                          if (this.then != null) {
                            this.then();
                          }
                        }
                      ).build(),
                      SizedBox(width: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget> [
                          Text(
                            this.title, 
                            style: TextStyle(fontSize: 18)
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: this.subTitles.map((subTitle) => Text(
                              subTitle,
                              style: TextStyle(fontSize: 14)
                            )).toList(),
                          )
                        ]
                      )
                    ],
                  )
                ),
              )
            ],
          )
        )
      )
    );
  }

  Function onTap(Function onTap) {
    this.then = onTap;
  }
}