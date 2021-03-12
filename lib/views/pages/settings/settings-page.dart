import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class SettingsPage extends StatefulWidget {
  dynamic data;

  SettingsPage ({dynamic data}) {
    this.data = data;
  }

  @override
  State <StatefulWidget> createState() {
    return _SettingsPageState(data: this.data);
  }
}

class _SettingsPageState extends State<SettingsPage> {
  dynamic data;

  _SettingsPageState ({dynamic data}) {
    this.data = data;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('ตั้งค่า')
      ),
      body: Center(
        child: Text('settings-page.dart')
      ),
    );
  }
}
