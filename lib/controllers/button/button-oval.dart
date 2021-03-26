import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:mp_v1_0/controllers/theme/theme.dart';
import 'package:mp_v1_0/controllers/loader/loader.dart';
import 'package:mp_v1_0/controllers/button/button.dart';

class ButtonOval extends Button {
  ButtonOval ({
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
    this.size = theme.buttonOval['defaultSizes'][size];
    this.border = border;
    this.colors = (colors != null) ? colors : theme.buttonOval['defaultColors'];
    this.imgURL = imgURL;
    this.imgVisitExcept = imgVisitExcept;
    this.loading = new Loader(color: this.colors['font']);
    this.then = onTap;
  }
}