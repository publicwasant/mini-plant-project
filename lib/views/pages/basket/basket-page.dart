import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class BasketPage extends StatefulWidget {
  dynamic data;

  BasketPage ({dynamic data}) {
    this.data = data;
  }

  @override
  State <StatefulWidget> createState() {
    return _BasketPageState(data: this.data);
  }
}

class _BasketPageState extends State<BasketPage> {
  dynamic data;
  
  _BasketPageState ({dynamic data}) {
    this.data = data;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: new AppBar(
        title: Text('ตะกร้าสินค้า'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Text('basket-page.dart')
      ),
    );
  }
}
