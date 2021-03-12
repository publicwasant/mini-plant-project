import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:mp_v1_0/models/shared-data/shared-data.dart';
import 'package:mp_v1_0/controllers/redirect/redirect.dart';

import 'package:mp_v1_0/controllers/logo/logo.dart';
import 'package:mp_v1_0/controllers/spin/spin.dart';
import 'package:mp_v1_0/controllers/text-box/text-box.dart';
import 'package:mp_v1_0/controllers/button/button.dart';

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
  TextBox emailBox;
  TextBox passwordBox;
  Button loginButton;

  _LoginPageState ({dynamic data}) {
    this.data = data;

    this.emailBox = new TextBox(
      label:'อีเมล', 
      icon: Icon(Icons.mail)
    );

    this.passwordBox = new TextBox(
      label: 'รหัสผ่าน', 
      obscure:true, 
      icon: Icon(Icons.https)
    );
    
    this.loginButton = new Button(
      icon: Icons.login,
      text: 'เข้าสู่ระบบ', 
      size: 'medium', 
      colors: [Colors.green, Colors.white],
      onTap: () async {
        Write('login', {
          'email': this.emailBox.controller.text,
          'password' : this.passwordBox.controller.text
        });

        if (!this.loginButton.loading.isBegin) {
          this.loginButton.loading.begin(then: () {
            setState(() {
              Future.delayed(const Duration(milliseconds: 2000), () {
                ClearPage(this.context, '/home');
              });
            });
          });
        }
      }
    );

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
            this.emailBox.build(),
            this.passwordBox.build(),
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
            )
          ],
        ),
      ),
    );
  }
}
