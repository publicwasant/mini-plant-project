import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:mp_v1_0/views/pages/get-started/get-started-page.dart';

class InitApp extends StatefulWidget {
  dynamic data;

  InitApp ({dynamic data}) {
    this.data = data;
  }

  @override 
  State <StatefulWidget> createState() {
    return _InitAppState(data: this.data);
  }
}

class _InitAppState extends State<InitApp> {
  dynamic data;

  _InitAppState ({dynamic data}) {
    this.data = data;
  }

  @override 
  Widget build (BuildContext context) {
    return MaterialApp(
      title: 'Mini Plant',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.lightBlue[800],
        accentColor: Colors.lightBlue[800],
        fontFamily: 'Roboto',
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          bodyText2: TextStyle(fontSize: 18.0, fontFamily: 'Roboto'),
        ),
      ),
      home: GetStartedPage(data: {}),
      // home: ProductsDetailPage(data: {})
      // home: HomePage(data: {'current': 2}),
    );
  }
}