import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';

/*
 * sources: https://pub.dev/packages/flutter_spinkit
 */

class Spin {
  bool isBegin;
  Map<String, Widget> options;
  Widget spin;

  Spin ({bool begin=false, Color color}) {
    this.isBegin = begin;
    this.options = {
      'begin' : Container(
        padding: const EdgeInsets.all(5),
        child: SpinKitThreeBounce(        
          color: (color != null) ? color : Colors.lightBlue[800],
          size: 25.0,
        )
      ),
      'end' : Container(
        padding: const EdgeInsets.all(5),
        width: 35,
        height: 35,
      )
    };

    this.spin = (this.isBegin) ? this.options['begin'] : this.options['end'];
  }

  Function begin ({Function then}) {
    this.isBegin = true;
    this.spin = this.options['begin'];

    if (then != null) {
      then();
    }
  }

  Function end ({Function then}) {
    this.isBegin = false;
    this.spin = this.options['end'];
    
    if (then != null) {
      then();
    }
  }
}