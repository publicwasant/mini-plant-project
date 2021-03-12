import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class HistoryPage extends StatefulWidget {
  dynamic data;

  HistoryPage ({dynamic data}) {
    this.data = data;
  }

  @override
  State <StatefulWidget> createState() {
    return _HistoryPageState(data: this.data);
  }
}

class _HistoryPageState extends State<HistoryPage> {
  dynamic data;

  _HistoryPageState ({dynamic data}) {
    this.data = data;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: new AppBar(
        title: Text('ประวัติการซื้อ'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Text('history-page.dart')
      )
    );
  }
}
