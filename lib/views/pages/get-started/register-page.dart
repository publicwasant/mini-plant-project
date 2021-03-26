import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:mp_v1_0/controllers/shared-data/shared-data.dart';
import 'package:mp_v1_0/controllers/redirect/redirect.dart';

import 'package:mp_v1_0/controllers/logo/logo.dart';
import 'package:mp_v1_0/controllers/text-box/text-box.dart';
import 'package:mp_v1_0/controllers/button/button.dart';
import 'package:mp_v1_0/controllers/button/button-oval.dart';
import 'package:mp_v1_0/controllers/dialog-box/dialog-box.dart';

import 'package:http/http.dart' as http;

class RegisterPage extends StatefulWidget {
  dynamic data;

  RegisterPage ({dynamic data}) {
    this.data = data;
  }

  @override
  State <StatefulWidget> createState() {
    return _RegisterPageState(data: this.data);
  }
}

class _RegisterPageState extends State<RegisterPage> {
  dynamic data;
  BuildContext context;

  Logo logo;

  TextBox emailBox;
  TextBox passwordBox;
  TextBox repasswordBox;
  TextBox nameBox;
  TextBox addrBox;
  TextBox phoneBox;

  Button registerBut;
  ButtonOval imgButOval;

  DialogBox fetchDia;

  _RegisterPageState ({dynamic data}) {
    this.data = data;
    
    this.emailBox = new TextBox(
      label: 'อีเมล', 
      icon: Icon(Icons.mail)
    );
    
    this.passwordBox = new TextBox(
      label: 'รหัสผ่าน', 
      obscure: true, 
      icon: Icon(Icons.https)
    );

    this.repasswordBox = new TextBox(
      label: 'ยืนยันรหัสผ่าน', 
      obscure: true, 
      icon: Icon(Icons.https)
    );
    
    this.nameBox = new TextBox(
      label: 'ชื่อ-นามสกุล', 
      icon: Icon(Icons.person)
    );

    this.addrBox = new TextBox(
      label: 'ที่อยู่', 
      maxLines: 4,
      icon: Icon(Icons.location_on)
    );

    this.phoneBox = new TextBox(
      label: 'หมายเลขโทรศัพท์', 
      icon: Icon(Icons.phone)
    );

    this.imgButOval = new ButtonOval(
      size: 'large',
      border: 2.0,
      icon: Icons.photo_camera,
      imgVisitExcept: true,
      onTap: () {
        //work
      }
    );

    this.registerBut = new Button(
      icon: Icons.border_color,
      title: 'สมัครสมาชิก',
      size: 'medium',
      onTap: () {
        if (!this.registerBut.loading.isBegin) {
          this.registerBut.loading.begin(then: () async {
            setState((){});

            Map<String, dynamic> body = {
              "cus_email": this.emailBox.controller.text,
              "cus_name": this.nameBox.controller.text,
              "cus_addr": this.addrBox.controller.text,
              "cus_phone": this.phoneBox.controller.text,
              "cus_imgURL": 'https://cdn.iconscout.com/icon/premium/png-256-thumb/plant-1733838-1475787.png',
              "cus_password": this.passwordBox.controller.text,
              "cus_repassword": this.repasswordBox.controller.text
            };

            dynamic response = await http.post(
              Uri.http('mini-plant.comsciproject.com', '/user/register'),
              headers: {'Content-Type': 'application/json'},
              body: jsonEncode(body),
              encoding: Encoding.getByName('utf-8'),
            );

            dynamic result = jsonDecode(response.body);

            this.registerBut.loading.end(then: () async {
              setState(() {});

              this.fetchDia.content = result['descript'];

              if (result['status'] == 1) {
                this.fetchDia.show(this.context, dismiss: false, actions: <DialogBoxItem> [
                  DialogBoxItem(
                    text: 'เสร็จสิ้น', 
                    onPressed: () {
                      Navigator.of(this.context, rootNavigator: true).pop();
                      ClearPage(context, '/init');
                    }
                  )
                ]);
              } else {
                this.fetchDia.show(this.context, actions: <DialogBoxItem> [
                  DialogBoxItem(
                    text: 'ลองอีกครั้ง', 
                    onPressed: () {
                      Navigator.of(this.context, rootNavigator: true).pop();
                    }
                  )
                ]);
              }
            });
          });
        }
      }
    );

    this.fetchDia = new DialogBox(title: 'สมัครสมาชิก');
  }

  @override
  Widget build(BuildContext context) {
    this.context = context;

    this.logo = new Logo(
      colors: <Color> [Colors.lightBlue[800], Colors.white],
      size: {
        'width': MediaQuery.of(context).size.width*0.80, 
        'height': 150
      }
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('สมัครสมาชิก')
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget> [
            SizedBox(height: MediaQuery.of(context).size.height*0.07),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget> [
                this.logo.build()
              ],
            ),
            SizedBox(height: 30),
            this.imgButOval.build(),
            SizedBox(height: 15),
            Container(
              padding: EdgeInsets.only(right: 35, left: 35),
              child: Column(
                children: <Widget> [
                  this.emailBox.build(),
                  this.nameBox.build(),
                  this.addrBox.build(),
                  this.phoneBox.build(),
                  this.passwordBox.build(),
                  this.repasswordBox.build(),
                ],
              ),
            ),
            SizedBox(height: 15),
            this.registerBut.build(),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
