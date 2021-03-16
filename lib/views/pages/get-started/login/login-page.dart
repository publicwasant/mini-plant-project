import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:mp_v1_0/models/shared-data/shared-data.dart';
import 'package:mp_v1_0/controllers/redirect/redirect.dart';

import 'package:mp_v1_0/controllers/logo/logo.dart';
import 'package:mp_v1_0/controllers/text-box/text-box.dart';
import 'package:mp_v1_0/controllers/button/button.dart';
import 'package:mp_v1_0/controllers/theme/theme.dart';
import 'package:mp_v1_0/controllers/dialog/dialog-mini.dart';

import 'package:http/http.dart' as http;


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

  DialogMini fetchDia;

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
      title: 'เข้าสู่ระบบ', 
      size: 'medium', 
      colors: theme.button['loginColors'],
      onTap: () async {
        if (!this.loginButton.loading.isBegin) {
          this.loginButton.loading.begin(then: () async {
            setState(() {});

            Map<String, dynamic> body = {
              'cus_email': this.emailBox.controller.text,
              'cus_password': this.passwordBox.controller.text
            };

            dynamic response = await http.post(
              Uri.http('mini-plant.comsciproject.com', '/user/login'),
              headers: {'Content-Type': 'application/json'},
              body: jsonEncode(body),
              encoding: Encoding.getByName('utf-8')
            );

            dynamic result = jsonDecode(response.body);

            this.loginButton.loading.end(then: () async {
              setState(() {});

              if (result['status'] == 1) {
                ClearPage(this.context, '/home');
              } else {
                this.fetchDia.show(
                  this.context, 
                  content: result['descript']
                );
              }
            });
          });
        }
      }
    );

    this.fetchDia = new DialogMini(
      title: 'เข้าสู่ระบบ',
      actions: <DialogMiniItem> [
        DialogMiniItem(
          text: 'ลองอีกครั้ง',
          onPressed: () {
            Navigator.of(this.context, rootNavigator: true).pop();
          }
        )
      ]
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
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
