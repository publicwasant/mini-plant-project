import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:mp_v1_0/controllers/button/button.dart';

class LogoutPage extends StatefulWidget {
  dynamic data;

  LogoutPage ({dynamic data}) {
  }

  @override
  State <StatefulWidget> createState() {
    return _LogoutPageState(data: this.data);
  }
}

class _LogoutPageState extends State<LogoutPage> {
  dynamic data;
  BuildContext context;

  Button logoutButton;

  _LogoutPageState ({dynamic data}) {
    this.data = data;
    this.logoutButton = new Button(
      text: 'ออกจากระบบ',
      size: 'medium', 
      colors: [Colors.red, Colors.white],
      onTap: () {
        Navigator.pushReplacementNamed(this.context, '/get-started');
    });
  }

  @override
  Widget build(BuildContext context) {
    this.context = context;

    return Scaffold(
      appBar: AppBar(
        title: Text('ออกจากระบบ')
      ),
      body: ListView(
        children: <Widget> [
          Text('logout-page.dart'),
          this.logoutButton.build()
        ],
      ),
    );
  }
}
