import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ShopPage extends StatefulWidget {
  dynamic data;

  ShopPage({dynamic data}) {
    this.data = data;
  }

  @override
  State <StatefulWidget> createState() {
    return _ShopPageState(data: this.data);
  }
}

class _ShopPageState extends State<ShopPage> {
  dynamic data;

  _ShopPageState ({dynamic data}) {
    this.data = data;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('ร้านค้า')
      ),
      body: Center(
        child: Text('shop-page.dart'),
      ),
    );
  }
}
