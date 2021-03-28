import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:mp_v1_0/controllers/shared-data/shared-data.dart';
import 'package:mp_v1_0/controllers/redirect/redirect.dart';
import 'package:mp_v1_0/controllers/fetch/fetch.dart';

import 'package:mp_v1_0/controllers/menu/menu-side.dart';
import 'package:mp_v1_0/controllers/button/button-pasteboard.dart';
import 'package:mp_v1_0/controllers/loader/loader.dart';

import 'package:mp_v1_0/models/employee/employee-model.dart';
import 'package:mp_v1_0/models/customer/customer-model.dart';

Color BackgroundColor = Colors.grey[100];
Color FontColor = Colors.grey[800];
Color PriceColor = Colors.lightBlue[800];

double FontTitlePageSize = 28;
double FontTitleSize = 18;
double FontDetailSize = 12;
double FontStatusSize = 18;
double FontPriceSize = 18;

class MainMenuPage extends StatefulWidget {
  dynamic data;

  MainMenuPage ({dynamic data}) {
    this.data = data;
  }

  @override
  State <StatefulWidget> createState() {
    return _MainMenuPageState(data: this.data);
  }
}

class _MainMenuPageState extends State<MainMenuPage> {
  dynamic data;
  BuildContext context;

  SideMenu profileSideMenu;
  ButtonProfile profileBut;
  Loader loading;

  EmployeeModel employeeModel;
  CustomerModel customerModel;

  _MainMenuPageState ({dynamic data}) {
    this.data = data;
    this.profileSideMenu = new SideMenu(
      title: 'ร้านขายต้นไม้เล็ก',
      options: [
        ['ตั้งค่า', '/settings', Icon(Icons.settings)],
        ['ร้านค้า', '/shop', Icon(Icons.stars)],
        ['ออกจากระบบ', '/get-started/logout', Icon(Icons.exit_to_app)]
      ],
      onTap: () {
        Navigator.pushNamed(this.context, this.profileSideMenu.pages[this.profileSideMenu.current]);
      }
    );

    this.loading = new Loader(begin: true);
    this.profileBut = new ButtonProfile();

    Read('user', then: (dynamic values) {
      int status = values['user_status'];
      int id = values['id'];

      if (status == 0) {
        Get('http://mini-plant.comsciproject.com/user/employee?id=$id', then: (dynamic response) {
          Map<String, dynamic> result = jsonDecode(response.body);

          if (result['status'] == 1) {
            this.loading.end(then: () {
              this.employeeModel = EmployeeModel(fromMap: result['data'][0]);
              
              this.profileBut.imgURL = this.employeeModel.imgURL;
              this.profileBut.title = this.employeeModel.name;
              this.profileBut.subTitles = [
                'ชื่อผู้ใช้: ' + this.employeeModel.username + ' (ผู้ดูแล)',
                'อีเมล' + this.employeeModel.email
              ];

              this.profileBut.onTap(() {
                Redirect(this.context, '/profile');
              });

              setState(() {});
            });
          }
        });
      } else if (status == 1) {
        Get('http://mini-plant.comsciproject.com/user/customer?id=$id', then: (dynamic response) {
          Map<String, dynamic> result = jsonDecode(response.body);

          if (result['status'] == 1) {
            this.loading.end(then: () {
              this.customerModel = CustomerModel(fromMap: result['data'][0]);

              this.profileBut.imgURL = this.customerModel.imgURL;
              this.profileBut.title = this.customerModel.name;
              this.profileBut.subTitles = ['อีเมล: ' + this.customerModel.email];

              this.profileBut.onTap(() {
                Redirect(this.context, '/profile');
              });

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
      endDrawer: this.profileSideMenu.biuld(),
      appBar: AppBar(
        title: Text('เมนู'),
      ),
      body: (!this.loading.isBegin) ? SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget> [
              this.profileBut.build()
            ],
          ),
        ),
      ) : Center(
        child: this.loading.build()
      ),
    );
  }
}
