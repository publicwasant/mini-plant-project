import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:mp_v1_0/controllers/menu/menu.dart';

import 'package:mp_v1_0/views/pages/product/product.dart';
import 'package:mp_v1_0/views/pages/history/history-page.dart';
import 'package:mp_v1_0/views/pages/custom/custom-page.dart';
import 'package:mp_v1_0/views/pages/basket/basket-page.dart';
import 'package:mp_v1_0/views/pages/main-menu/main-menu-page.dart';


class HomePage extends StatefulWidget {
  dynamic data;

  HomePage ({dynamic data}) {
    this.data = data;
  }

  @override
  State <StatefulWidget> createState() {
    return _HomePageState(data: this.data);
  }
}

class _HomePageState extends State<HomePage> {
  dynamic data;
  BuildContext context;

  int current;

  Menu menu;
  List<Widget> pages;

  _HomePageState ({dynamic data}) {
    this.data = data;
    this.current = (data['current'] != null) ? data['current'] : 0;
    
    this.menu = new Menu(options: [
      ['สินค้า', Icon(Icons.storefront)],
      ['ประวัติ', Icon(Icons.history)],
      ['กำหนดเอง', Icon(Icons.add_circle_outline)],
      ['ตะกร้า', Icon(Icons.shopping_cart)],
      ['เมนู', Icon(Icons.dehaze)],
    ], current: this.current);

    this.pages = [
      ProductsPage(data: data), 
      HistoryPage(data: data),
      CustomPage(data: data), 
      BasketPage(data: data),
      MainMenuPage(data: data)
    ];

    this.menu.onTap(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    this.context = context;
    
    return Scaffold(
      body: this.pages[this.menu.current],
      bottomNavigationBar: this.menu.build(),
    );
  }
}
