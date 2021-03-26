import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:mp_v1_0/controllers/redirect/redirect.dart';
import 'package:mp_v1_0/controllers/theme/theme.dart';
import 'package:mp_v1_0/controllers/button/button.dart';
import 'package:mp_v1_0/controllers/logo/logo.dart';
import 'package:mp_v1_0/controllers/loader/loader.dart';

class GetStartedPage extends StatefulWidget {
  dynamic data;

  GetStartedPage ({dynamic data}) {
    this.data = data;
  }

  @override
  State <StatefulWidget> createState() {
    return _GetStartedPageState(data: this.data);
  }
}

class _GetStartedPageState extends State<GetStartedPage> {
  dynamic data;
  BuildContext context;

  Loader loadingSpin;
  Logo logo;

  Button loginBut;
  Button registerBut;
  Button notNowBut;


  _GetStartedPageState ({dynamic data}) {
    this.data = data;

    this.loadingSpin = new Loader();
    this.logo = Logo();

    this.loginBut = new Button(
      title: 'เข้าสู่ระบบ',
      size: 'medium',
      colors: theme.button['loginColors'],
      onTap: () async {
        Redirect(this.context, '/get-started/login');
      }
    );

    this.registerBut = new Button(
      title: 'สมัครสมาชิก',
      size: 'medium',
      onTap: () async {
        Redirect(this.context, '/get-started/register');
      }
    );

    this.notNowBut = new Button(
      title: 'ไม่ใช่ตอนนี้',
      size: 'small',
      colors: theme.button['notNowColors'],
      onTap: () {
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    this.context = context;

    this.logo = Logo(
      size: {
        'width': MediaQuery.of(context).size.width*0.80, 
        'height': 150
      }
    );

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget> [
            SizedBox(height: MediaQuery.of(context).size.height*0.10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget> [
                this.logo.build()
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.36),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget> [
                Container(
                  child: this.loginBut.build()
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget> [
                Container(
                  child: this.registerBut.build()
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget> [
                Container(
                  child: TextButton(
                    child: Text(
                      'ไม่ใช่ตอนนี้',
                      style: TextStyle(color: Colors.grey),
                    ),
                    onPressed: () {
                    },
                  )
                )
              ],
            )
          ],
        ),
      )
    );
  }
}
