import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:mp_v1_0/controllers/shared-data/shared-data.dart';
import 'package:mp_v1_0/controllers/redirect/redirect.dart';
import 'package:mp_v1_0/controllers/fetch/fetch.dart';

import 'package:mp_v1_0/controllers/theme/theme.dart';
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
double FontSubTitleSize = 20;
double FontDetailSize = 12;

class ProfilePage extends StatefulWidget {
  dynamic data;

  ProfilePage ({dynamic data}) {
    this.data = data;
  }

  @override
  State <StatefulWidget> createState() {
    return _ProfilePageState(data: this.data);
  }
}

class _ProfilePageState extends State<ProfilePage> {
  dynamic data;
  BuildContext context;

  ButtonOval imgBut;
  Button editBut;
  Button logoutBut;

  DialogBox logoutDia;

  Loader loading;

  EmployeeModel employeeModel;
  CustomerModel customerModel;
  dynamic userModel;

  dynamic user;

  _ProfilePageState ({dynamic data}) {
    this.data = data;
    
    this.imgBut = new ButtonOval(
      size: 'large',
      border: 2.0,
      imgVisitExcept: true,
      onTap: () async {
        ScaffoldMessenger.of(this.context).showSnackBar(
          SnackBar(
            content: Text('เปลี่ยนรูปโปรไฟล์แล้ว'),
            backgroundColor: Colors.green,
          )
        );
     }
    );

    this.editBut = new Button(
      icon: Icons.mode_edit,
      title: 'แก้ไขข้อมูล',
      size: 'small',
      border: 1.0,
      colors: theme.button['editColors'],
      onTap: () {
        Redirect(this.context, '/profile/edit');
      }
    );

    this.logoutBut = new Button(
      icon: Icons.logout,
      title: 'ออกจากระบบ',
      size: 'small',
      border: 0.0,
      colors: theme.button['logoutColors'],
      onTap: () async {
        this.logoutDia.show(this.context);
      }
    );

    this.logoutDia = new DialogBox(
      title: 'ออกจากระบบ',
      content: Text('คุณต้องการอยากจะออกจากระบบตอนนี้?'),
      actions: <DialogBoxItem> [
        DialogBoxItem(text: 'ตกลง', onPressed: () {
          Navigator.of(context, rootNavigator: true).pop();
          ClearPage(this.context, '/init');
        }),
        DialogBoxItem(text: 'ยกเลิก', onPressed: () {
          Navigator.of(context, rootNavigator: true).pop();
        })
      ],
    );

    this.loading = new Loader(begin: true);
    this.customerModel = new CustomerModel();

    Read('user', then: (dynamic values) {
      this.user = values;

      print(this.user);

      if (this.user['user_status'] == 0) { // admin
        Get('http://mini-plant.comsciproject.com/user/employee?id=' + this.user['id'].toString(), then: (dynamic response) {
            Map<String, dynamic> result = jsonDecode(response.body);

            if (result['status'] == 1) {
              this.loading.end(then: () {
                this.employeeModel = EmployeeModel(fromMap: result['data'][0]);
                this.userModel = this.employeeModel;

                this.imgBut.imgURL = this.employeeModel.imgURL;
                setState(() {});
              });
            }
          });
      } else if (this.user['user_status'] == 1) { // customer
        Get('http://mini-plant.comsciproject.com/user/customer?id=' + this.user['id'].toString(), then: (dynamic response) {
          Map<String, dynamic> result = jsonDecode(response.body);

          if (result['status'] == 1) {
            this.loading.end(then: () {
              this.customerModel = CustomerModel(fromMap: result['data'][0]);
              this.userModel = this.customerModel;

              this.imgBut.imgURL = this.customerModel.imgURL;
              setState(() {});
            });
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    this.context = context;

    return Scaffold(
      backgroundColor: BackgroundColor,
      appBar: AppBar(
        title: Text('โปรไฟล์')
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
                            this.imgBut.build(),
                            SizedBox(height: 20),
                            Text(
                              this.userModel.name,
                              style: TextStyle(fontSize: FontTitleSize),
                            ),
                            (this.user['user_status'] == 0) ? (
                              Text(
                                this.userModel.username + ' (Admin)',
                                style: TextStyle(fontSize: FontSubTitleSize),
                              )
                            ) : Container()
                          ],
                        )
                      )
                    )
                  ],
                ),
              )
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Stack(
                  children: <Widget> [
                    Positioned(
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Card(
                          clipBehavior: Clip.antiAlias,
                          child: Column(
                            children: [
                              ListTile(
                                leading: Icon(Icons.location_on),
                                title: const Text('ที่อยู่'),
                                subtitle: Text(
                                  this.userModel.addr,
                                  style: TextStyle(
                                    fontSize: FontDetailSize,
                                    color: FontColor
                                  ),
                                ),
                              ),
                              ListTile(
                                leading: Icon(Icons.mail),
                                title: const Text('อีเมล'),
                                subtitle: Text(
                                  this.userModel.email,
                                  style: TextStyle(
                                    fontSize: FontDetailSize,
                                    color: FontColor
                                  ),
                                ),
                              ),
                              ListTile(
                                leading: Icon(Icons.phone),
                                title: const Text('หมายเลขโทรศัพท์'),
                                subtitle: Text(
                                  this.userModel.phone,
                                  style: TextStyle(
                                    fontSize: FontDetailSize,
                                    color: FontColor
                                  ),
                                ),
                              ),
                              SizedBox(height: 15),
                            ],
                          ),
                        ),
                      )
                    ),
                  ],
                )
              )
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget> [
                this.editBut.build(),
                this.logoutBut.build()
              ],
            ),
          ],
        ),
      ) : Center(
        child: this.loading.build(),
      ),
    );
  }
}
