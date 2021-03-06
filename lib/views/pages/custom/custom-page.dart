import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:mp_v1_0/controllers/redirect/redirect.dart';
import 'package:mp_v1_0/controllers/shared-data/shared-data.dart';

Color BackgroundColor = Colors.grey[100];

class CustomPage extends StatefulWidget {
  dynamic data;

  CustomPage ({dynamic data}) {
    this.data = data;
  }

  @override
  State <StatefulWidget> createState() {
    return _CustomPageState(data: this.data);
  }
}

class _CustomPageState extends State<CustomPage> {
  dynamic data;
  dynamic user;
  dynamic page;
  
  _CustomPageState ({dynamic data}) {
    this.data = data;

    if (data['user']['user_status'] == 0) {
      this.page = Toggle('/custom/employee', data: data);
    } else if (data['user']['user_status'] == 1) {
      this.page = Toggle('/custom/customer', data: data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BackgroundColor,
      body: this.page
    );
  }
}
