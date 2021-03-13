import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:mp_v1_0/models/shared-data/shared-data.dart';
import 'package:mp_v1_0/controllers/redirect/redirect.dart';

import 'package:mp_v1_0/controllers/logo/logo.dart';
import 'package:mp_v1_0/controllers/text-box/text-box.dart';
import 'package:mp_v1_0/controllers/theme/theme.dart';
import 'package:mp_v1_0/controllers/button/button.dart';
import 'package:mp_v1_0/controllers/button/button-oval.dart';

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
  TextBox comfirmPasswordBox;
  TextBox nameBox;
  TextBox phoneBox;
  TextBox addrBox;

  Button registerBut;
  ButtonOval imgButOval;

  _RegisterPageState ({dynamic data}) {
    this.data = data;
    
    this.emailBox = new TextBox(label: 'อีเมล', icon: Icon(Icons.mail));
    this.passwordBox = new TextBox(label: 'รหัสผ่าน', obscure: true, icon: Icon(Icons.https));
    this.comfirmPasswordBox = new TextBox(label: 'ยืนยันรหัสผ่าน', obscure: true, icon: Icon(Icons.https));
    this.nameBox = new TextBox(label: 'ชื่อผู้ใช้', icon: Icon(Icons.person));
    this.phoneBox = new TextBox(label: 'หมายเลขโทรศัพท์', icon: Icon(Icons.phone));
    this.addrBox = new TextBox(label: 'ที่อยู่', icon: Icon(Icons.location_on));

    this.imgButOval = new ButtonOval(
      title: 'เลือกรูปภาพ', 
      size: 'large',
      border: 4.0,
      imgURL: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRKP1kH94VI_awzgsQuckJC5tnHNib7RtKpVg&usqp=CAU',
      imgVisitExcept: true,
      onTap: () {
        //work
      }
    );

    this.registerBut = new Button(
      icon: Icons.border_color,
      title: 'สมัครสมาชิก',
      size: 'medium',
      onTap: () async {
        if (!this.registerBut.loading.isBegin) {
          this.registerBut.loading.begin(then: () {
            setState(() {
              Future.delayed(const Duration(milliseconds: 2000), () {
                //process
                ClearPage(this.context, '/init');
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
            SizedBox(height: 30),
            this.emailBox.build(),
            this.nameBox.build(),
            this.phoneBox.build(),
            this.addrBox.build(),
            this.passwordBox.build(),
            this.comfirmPasswordBox.build(),
            SizedBox(height: 15),
            this.registerBut.build()
          ],
        ),
      ),
    );
  }
}
