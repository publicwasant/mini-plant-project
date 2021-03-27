import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:mp_v1_0/controllers/shared-data/shared-data.dart';
import 'package:mp_v1_0/controllers/redirect/redirect.dart';
import 'package:mp_v1_0/controllers/fetch/fetch.dart';

import 'package:mp_v1_0/controllers/theme/theme.dart';
import 'package:mp_v1_0/controllers/logo/logo.dart';
import 'package:mp_v1_0/controllers/text-box/text-box.dart';
import 'package:mp_v1_0/controllers/button/button.dart';
import 'package:mp_v1_0/controllers/button/button-oval.dart';
import 'package:mp_v1_0/controllers/dialog-box/dialog-box.dart';
import 'package:mp_v1_0/controllers/loader/loader.dart';

import 'package:mp_v1_0/models/employee/employee-model.dart';
import 'package:mp_v1_0/models/customer/customer-model.dart';

Color BackgroundColor = Colors.grey[100];
Color FontColor = Colors.grey[800];
Color PriceColor = Colors.lightBlue[800];

double FontTitleSize = 24;
double FontDetailSize = 12;
double FontStatusSize = 18;
double FontPriceSize = 18;

class ProfileEditPage extends StatefulWidget {
  dynamic data;

  ProfileEditPage ({dynamic data}) {
    this.data = data;
  }

  @override
  State <StatefulWidget> createState() {
    return _ProfileEditPageState(data: this.data);
  }
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  dynamic data;
  BuildContext context;

  TextBox usernameBox; 
  TextBox emailBox; 
  TextBox nameBox;
  TextBox addrBox;
  TextBox phoneBox;

  Button saveBut;
  ButtonOval imgButOval;

  DialogBox fetchDia;
  Loader loading;

  EmployeeModel employeeModel;
  CustomerModel customerModel;
  dynamic userModel;
  dynamic user;

  _ProfileEditPageState ({dynamic data}) {
    this.data = data;

    this.usernameBox = new TextBox(
      label: 'ชื่อผู้ใช้', 
      icon: Icon(Icons.credit_card)
    );

    this.emailBox = new TextBox(
      label: 'อีเมล', 
      icon: Icon(Icons.mail)
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
      // icon: Icons.photo_camera,
      imgVisitExcept: true,
      onTap: () {
        //work
      }
    );

    this.saveBut = new Button(
      icon: Icons.mode_edit,
      title: 'บันทึก',
      size: 'small',
      border: 1.0,
      colors: theme.button['editColors'],
      onTap: () async {

        if (!this.saveBut.loading.isBegin) {
          this.saveBut.loading.begin(then: () {
            setState((){});
            
            this.userModel.email = this.emailBox.controller.text;
            this.userModel.name = this.nameBox.controller.text;
            this.userModel.addr = this.addrBox.controller.text;
            this.userModel.phone = this.phoneBox.controller.text;
            this.userModel.imgURL = this.imgButOval.imgURL;

            if (this.user['user_status'] == 0) {
              this.userModel.username = this.usernameBox.controller.text;
            }
            
            List<String> urls = [
              'http://mini-plant.comsciproject.com/user/employee/edit', 
              'http://mini-plant.comsciproject.com/user/customer/edit'
            ];

            Map<String, dynamic> body = this.userModel.toMap();

            Put(urls[this.user['user_status']], body, then: (dynamic response) {
              dynamic result = jsonDecode(response.body);

              this.saveBut.loading.end(then: () {
                setState(() {});
                this.fetchDia.content = <Widget> [
                  Text(result['descript'])
                ];

                if (result['status'] == 1) {
                  this.fetchDia.show(this.context, dismiss: false, actions: <DialogBoxItem> [
                    DialogBoxItem(
                      text: 'เสร็จสิ้น', 
                      onPressed: () {
                        Navigator.of(this.context, rootNavigator: true).pop();
                        Back(this.context);
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
          });
        }
      }
    );

    this.fetchDia = new DialogBox(title: 'แก้ไขข้อมูล');
    this.loading = new Loader(begin: true);

    Read('user', then: (dynamic values) {
      this.user = values;

      if (this.user['user_status'] == 0) {
        Get('http://mini-plant.comsciproject.com/user/employee?id=' + this.user['id'].toString(), then: (dynamic response) {
          Map<String, dynamic> result = jsonDecode(response.body);

          if (result['status'] == 1) {
            this.loading.end(then: () {
              this.employeeModel = EmployeeModel(fromMap: result['data'][0]);

              this.usernameBox.controller.text = this.employeeModel.username;
              this.emailBox.controller.text = this.employeeModel.email;
              this.nameBox.controller.text = this.employeeModel.name;
              this.addrBox.controller.text = this.employeeModel.addr;
              this.phoneBox.controller.text = this.employeeModel.phone;
              this.imgButOval.imgURL = this.employeeModel.imgURL;

              this.userModel = this.employeeModel;

              setState(() {});
            });
          }
        });
      } else if (this.user['user_status'] == 1) {
        Get('http://mini-plant.comsciproject.com/user/customer?id=' + this.user['id'].toString(), then: (dynamic response) {
          Map<String, dynamic> result = jsonDecode(response.body);

          if (result['status'] == 1) {
            this.loading.end(then: () {
              this.customerModel = CustomerModel(fromMap: result['data'][0]);

              this.emailBox.controller.text = this.customerModel.email;
              this.nameBox.controller.text = this.customerModel.name;
              this.addrBox.controller.text = this.customerModel.addr;
              this.phoneBox.controller.text = this.customerModel.phone;
              this.imgButOval.imgURL = this.customerModel.imgURL;

              this.userModel = this.customerModel;

              setState(() {});
            });
          }
        });
      }

      
    });
  }

  @override 
  Widget build (BuildContext context) {
    this.context = context;

    return Scaffold(
      backgroundColor: BackgroundColor,
      appBar: AppBar(
        title: Text('แก้ไขข้อมูล'),
      ),
      body: (!this.loading.isBegin) ? SingleChildScrollView(
        child: Column(
          children: <Widget> [
            Container(
              color: Colors.grey.withOpacity(0.16),
              child: Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 10),
                child: Stack(
                  children: <Widget> [
                    Positioned(
                      child: Align(
                        alignment: Alignment.center,
                        child: Column(
                          children: <Widget> [
                            this.imgButOval.build(),
                          ],
                        )
                      )
                    )
                  ],
                ),
              )
            ),
            SizedBox(height: 30),
            this.nameBox.build(),
            (this.user['user_status'] == 0) ? (
              this.usernameBox.build()
            ) : Container(),
            this.emailBox.build(),
            this.addrBox.build(),
            this.phoneBox.build(),
            SizedBox(height: 15),
            this.saveBut.build(),
            SizedBox(height: 30),
          ],
        )
      ) : Center(
        child: this.loading.build()
      ),
    );
  }
}