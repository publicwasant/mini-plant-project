import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mp_v1_0/controllers/button/button-tile.dart';

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
                          title: 'ต้นตะบองเพรช',
                          subTitle: 'ประเภท : สินค้าสำเร็จรูป',
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
