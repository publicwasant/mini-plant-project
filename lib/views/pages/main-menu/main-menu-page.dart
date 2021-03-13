import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:mp_v1_0/controllers/side-menu/side-menu.dart';
import 'package:mp_v1_0/controllers/redirect/redirect.dart';
import 'package:mp_v1_0/controllers/button/button-oval.dart';

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

  ButtonOval imgBut;

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

    this.imgBut = new ButtonOval(
      size: 'small',
      border: 2.0,
      imgURL: 'https://upload.wikimedia.org/wikipedia/commons/1/1b/Shayh_Muhammad_Sodiq.jpg',
      imgVisitExcept: true,
      onTap: () {
     }
    );
  }

  @override
  Widget build(BuildContext context) {
    this.context = context;

    return Scaffold(
      endDrawer: this.profileSideMenu.biuld(),
      appBar: AppBar(
        title: Text('เมนู'),
      ),
      body: Container(
        child: ListView(
          children: <Widget> [
            Card(
              color: Colors.grey[300],
              child: InkWell(
                onTap: () {
                  Redirect(context, '/profile');
                },
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Stack(
                    children: <Widget> [
                      Positioned(
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget> [
                              this.imgBut.build(),
                              SizedBox(width: 15),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget> [
                                  Text('มูฮัมหมัด อาลี', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                  Text('makeup.apple45@gmail.com'),
                                  Text('')
                                ]
                              )
                            ],
                          )
                        ),
                      )
                    ],
                  )
                )
              )
            ),
          ],
        ),
      ),
    );
  }
}
