import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:mp_v1_0/controllers/shared-data/shared-data.dart';
import 'package:mp_v1_0/controllers/redirect/redirect.dart';

import 'package:mp_v1_0/controllers/logo/logo.dart';
import 'package:mp_v1_0/controllers/text-box/text-box.dart';
import 'package:mp_v1_0/controllers/button/button.dart';
import 'package:mp_v1_0/controllers/theme/theme.dart';
import 'package:mp_v1_0/controllers/dialog-box/dialog-box.dart';
import 'package:mp_v1_0/controllers/fetch/fetch.dart';


class LoginPage extends StatefulWidget {
  dynamic data;

  LoginPage ({dynamic data}) {
    this.data = data;
  }

  @override
  State <StatefulWidget> createState() {
    return _LoginPageState(data: this.data);
  }
}

class _LoginPageState extends State<LoginPage> {
  dynamic data;
  BuildContext context;

  Logo logo;
  TextBox usernameBox;
  TextBox passwordBox;
  Button loginButton;

  DialogBox fetchDia;

  _LoginPageState ({dynamic data}) {
    this.data = data;

    this.usernameBox = new TextBox(
      label:'ชื่อผู้ใช้/อีเมล', 
      icon: Icon(Icons.mail)
    );

    this.passwordBox = new TextBox(
      label: 'รหัสผ่าน', 
      obscure:true, 
      icon: Icon(Icons.https)
    );
    
    this.loginButton = new Button(
      icon: Icons.login,
      title: 'เข้าสู่ระบบ', 
      size: 'medium', 
      colors: theme.button['loginColors'],
      onTap: () async {
        if (!this.loginButton.loading.isBegin) {
          this.loginButton.loading.begin(then: () async {
            setState(() {});

            Post('http://mini-plant.comsciproject.com/user/login', {
              'username': this.usernameBox.controller.text,
              'password': this.passwordBox.controller.text
            }, then: (dynamic response) {

              Map<String, dynamic> result = jsonDecode(response.body);

              this.loginButton.loading.end(then: () {
                setState(() {});

                if (result['status'] == 1) {
                  Write('user', result['data'], then: () {
                    ClearPage(this.context, '/home', data: {
                      'user': result['data']
                    });
                  });
                } else {
                  this.fetchDia.show(
                    this.context, 
                    content: result['descript']
                  );
                }
              });
            });
          });
        } else {
          this.loginButton.loading.end(then: () {
            setState(() {});
          });
        }
      }
    );

    this.fetchDia = new DialogBox(
      title: 'เข้าสู่ระบบ',
      actions: <DialogBoxItem> [
        DialogBoxItem(
          text: 'ลองอีกครั้ง',
          onPressed: () {
            Navigator.of(this.context, rootNavigator: true).pop();
          }
        )
      ]
    );

    // this.usernameBox.controller.text = 'test@gmail.com';
    this.usernameBox.controller.text = 'test';
    this.passwordBox.controller.text = 'test';
  }

  @override
  Widget build(BuildContext context) {
    this.context = context;

    this.logo = new Logo(
      size: {
        'width': MediaQuery.of(context).size.width*0.80, 
        'height': 150
      }
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('เข้าสู่ระบบ'),
        backgroundColor: Colors.green,
      ),
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
            SizedBox(height: MediaQuery.of(context).size.height*0.24),
            Container(
              padding: EdgeInsets.only(right: 35, left: 35),
              child: Column(
                children: <Widget> [
                  this.usernameBox.build(),
                  this.passwordBox.build(),
                ],
              ),
            ),
            SizedBox(height: 15),
            this.loginButton.build(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget> [
                Container(
                  child: TextButton(
                    child: Text(
                      'ลืมรหัสผ่าน?',
                      style: TextStyle(color: Colors.grey),
                    ),
                    onPressed: () {
                    },
                  )
                )
              ],
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
