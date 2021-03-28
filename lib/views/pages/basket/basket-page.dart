import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mp_v1_0/controllers/button/button-tile.dart';
import 'package:mp_v1_0/controllers/fetch/fetch.dart';

class BasketPage extends StatefulWidget {
  dynamic data;

  BasketPage({dynamic data}) {
    this.data = data;
  }

  @override
  State<StatefulWidget> createState() {
    return _BasketPageState(data: this.data);
  }
}

class _BasketPageState extends State<BasketPage> {
  dynamic data;

  _BasketPageState({dynamic data}) {
    this.data = data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          // backgroundColor: AppBarBackgroundColor,
          title: Text('สั่งซื้อ'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'ตะกร้า', icon: Icon(Icons.scatter_plot)),
              Tab(text: 'สั่งซื้อ', icon: Icon(Icons.spa)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            basket(),
            order(),
          ],
        ),
      ),
    ));
  }
}

class basket extends StatefulWidget {
  @override
  _basketState createState() => _basketState();
}

class _basketState extends State<basket> {
  List<dynamic> result = [];
  _basketState() {
    Get('http://mini-plant.comsciproject.com/order/detail',
        then: (dynamic response) {
      dynamic result = jsonDecode(response.body);
      print(111);
      print(result);
      if (result['status'] == 1) {
        this.result = result['data'];
        setState(() {});
      }
    }, error: (dynamic e) {
      print(e);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
            children: this.result.map((e) {
          return Container(
            padding: const EdgeInsets.fromLTRB(30, 2, 30, 2),
            child: Card(
              clipBehavior: Clip.antiAlias,
              child: Column(children: [
                ButtonTile(
                        icon: Icons.spa,
                        title: getName(e['pr_id'].toString()),
                        subTitle: 'ประเภท : สินค้าสำเร็จรูป',
                        onTap: () async {})
                    .build()
              ]),
            ),
          );
        }).toList()
            // [
            //   Container(
            //     padding: const EdgeInsets.fromLTRB(30, 2, 30, 2),
            //     child: Card(
            //       clipBehavior: Clip.antiAlias,
            //       child: Column(children: [
            //         ButtonTile(
            //                 icon: Icons.image,
            //                 title: 'ต้นตะบองเพรช',
            //                 subTitle: 'ประเภท : สินค้าสำเร็จรูป',
            //                 onTap: () async {})
            //             .build()
            //       ]),
            //     ),
            //   ),
            // ],

            ),
      ),
    );
  }

  String getName(id) {
    String str = "";
    Get('http://mini-plant.comsciproject.com/product?id=' + id,
        then: (dynamic response) {
      dynamic result = jsonDecode(response.body);
      print(111);
      print(result);
      if (result['status'] == 1) {
        result['data'].map((e) {
          str = e['pr_name'];
          print(str + "  ++++++++++++++++++++++++++++++++++++++++++++++++");
        }).toList();
      }
    }, error: (dynamic e) {
      print(e);
    });
    return str;
  }
}

class order extends StatefulWidget {
  @override
  _orderState createState() => _orderState();
}

class _orderState extends State<order> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(30, 2, 30, 2),
              child: Card(
                clipBehavior: Clip.antiAlias,
                child: Column(children: [
                  ButtonTile(
                          icon: Icons.image,
                          title: '19/03/2562',
                          subTitle: 'สถานะ : ยืนยันการสั่งซื้อ',
                          onTap: () async {})
                      .build()
                ]),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(30, 2, 30, 2),
              child: Card(
                clipBehavior: Clip.antiAlias,
                child: Column(children: [
                  ButtonTile(
                          icon: Icons.image,
                          title: 'รูปภาพเพิ่มเติม',
                          subTitle: '(แตะเพื่อเลือกรูปภาพ)',
                          onTap: () async {})
                      .build()
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
