import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:mp_v1_0/controllers/theme/theme.dart';
import 'package:mp_v1_0/controllers/button/button.dart';
import 'package:mp_v1_0/controllers/button/button-oval.dart';
import 'package:mp_v1_0/controllers/dialog/dialog-mini.dart';
import 'package:mp_v1_0/controllers/redirect/redirect.dart';

Color BackgroundColor = Colors.grey[100];
Color FontColor = Colors.grey[800];
Color PriceColor = Colors.lightBlue[800];

double FontTitleSize = 24;
double FontDetailSize = 12;
double FontStatusSize = 18;
double FontPriceSize = 18;

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

  DialogMini logoutDia;

  _ProfilePageState ({dynamic data}) {
    this.data = data;
    
    this.imgBut = new ButtonOval(
      size: 'large',
      border: 4.0,
      imgURL: 'https://upload.wikimedia.org/wikipedia/commons/1/1b/Shayh_Muhammad_Sodiq.jpg',
      imgVisitExcept: true,
      onTap: () async {
        if (!this.imgBut.loading.isBegin) {
          this.imgBut.loading.begin(then: () {
            setState(() {
              Future.delayed(const Duration(milliseconds: 2000), () {
                ScaffoldMessenger.of(this.context).showSnackBar(
                  SnackBar(
                    content: Text('เปลี่ยนรูปโปรไฟล์แล้ว'),
                    backgroundColor: Colors.green,
                  )
                );

                this.imgBut.loading.end(then: () {
                  setState(() {});
                });
              });
            });
          });
        }
     }
    );

    this.editBut = new Button(
      icon: Icons.mode_edit,
      title: 'แก้ไขข้อมูล',
      size: 'small',
      border: 1.0,
      colors: theme.button['editColors'],
      onTap: () {
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

    this.logoutDia = new DialogMini(
      title: 'ออกจากระบบ',
      content: Text('คุณต้องการอยากจะออกจากระบบตอนนี้?'),
      before: () {
        //--
      },
      actions: <Widget> [
        TextButton(
          child: Text('ตกลง'),
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop();
            ClearPage(this.context, '/init');
          },
        ),
        TextButton(
          child: Text('ยกเลิก'),
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop();
          },
        )
      ]
    );
  }

  @override
  Widget build(BuildContext context) {
    this.context = context;

    return Scaffold(
      backgroundColor: BackgroundColor,
      appBar: AppBar(
        title: Text('โปรไฟล์')
      ),
      body: Container(
        child: ListView(
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
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Center(
                                child: Text(
                                  'มูฮัมหมัด อาลี',
                                  style: TextStyle(fontSize: FontTitleSize),
                                ),
                              )
                            )
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
                                  '7/22 หมู่ 5 ซอยท่าเอียด (เจ้าฟ้า 50) ถนนเจ้าฟ้าตะวันตก ตำบอลฉลอง อำเภอเมือง จังหวัดภูเก็ต 83000',
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
                                  'makeup.apple45@gmail.com',
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
                                  '096-654-4432',
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
      ),
    );
  }
}
