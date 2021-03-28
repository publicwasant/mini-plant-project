import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:mp_v1_0/controllers/theme/theme.dart';
import 'package:mp_v1_0/controllers/button/button-image.dart';
import 'package:mp_v1_0/controllers/button/button.dart';
import 'package:mp_v1_0/controllers/button/button-tab.dart';
import 'package:mp_v1_0/controllers/button/button-tile.dart';
import 'package:mp_v1_0/controllers/text-box/text-box.dart';
import 'package:mp_v1_0/controllers/dialog-box/dialog-box.dart';
import 'package:mp_v1_0/controllers/image/image-slider.dart';
import 'package:mp_v1_0/controllers/image/image-gallery.dart';

import 'package:mp_v1_0/controllers/dropdawn-box/dropdawn-box.dart';

import 'package:mp_v1_0/controllers/redirect/redirect.dart';
import 'package:mp_v1_0/controllers/fetch/fetch.dart';
import 'package:mp_v1_0/models/product/product-model.dart';

Color AppBarBackgroundColor = Colors.deepPurpleAccent;
Color BackgroundColor = Colors.grey[100];
Color FontColor = Colors.grey[800];
Color PriceColor = Colors.lightBlue[800];

double FontTitlePageSize = 28;
double FontSubTitlePageSize = 16;

double FontTitleSize = 18;
double FontDetailSize = 12;
double FontStatusSize = 18;
double FontPriceSize = 18;

class CompleteProductTab extends StatefulWidget {
  dynamic data;

  CompleteProductTab ({dynamic data}) {
    this.data = data;
  }

  @override
  State <StatefulWidget> createState() {
    return _CompleteProductTabState(data: this.data);
  }
}

class _CompleteProductTabState extends State<CompleteProductTab> {
  dynamic data;

  ButtonTab plantButTab;
  ButtonTab marbleButTab;
  ButtonTab potButTab;
  ButtonTab cardButTab;

  TextBox detailBox;
  TextBox totalPriceBox;

  ButtonTile imgsButTile;
  ButtonTile detailButTile;
  ButtonTile statusButTile;
  ButtonTile totalPriceButTile;

  ButtonTab basketButb;
  ButtonTab buyButb;

  DialogBox diaInput;
  
  _CompleteProductTabState ({dynamic data}) {
    this.data = data;
    
    plantButTab = new ButtonTab(
      icon: Icons.grass,
      title: 'ต้นไม้เล็ก',
      subTitle: '(เลือกสินค้าประเภทต้นไม้)',
      size: 'medium',
    );

    marbleButTab = new ButtonTab(
      icon: Icons.grain,
      title: 'หินตกแต่ง',
      subTitle: '(เลือกสินค้าประเภทหินตกแต่ง)',
      size: 'medium'
    );

    potButTab = new ButtonTab(
      icon: Icons.panorama_vertical,
      title: 'กระถาง',
      subTitle: '(เลือกสินค้าประเภทกระถาง)',
      size: 'medium'
    );

    cardButTab = new ButtonTab(
      icon: Icons.settings_system_daydream,
      title: 'การ์ด',
      subTitle: '(เลือกสินค้าประเภทการ์ด)',
      size: 'medium'
    );

    this.totalPriceBox = new TextBox(
      label: 'ราคา',
      autoFocus: true
    );

    this.totalPriceButTile = ButtonTile(
      icon: Icons.sentiment_very_satisfied,
      title: 'ราคา',
      subTitle: '฿ ' + 200.toString(),
      fontSize: FontPriceSize,
      fontColor: PriceColor,
      onTap: () async {
        
      }
    );

    this.basketButb = new ButtonTab(
      icon: Icons.shopping_cart,
      title: 'ยิบไส่ตะกร้า',
      size: 'small',
      colors: theme.button['basketColors'],
      border: 1.0,
      onTap: () async {
        if (!this.basketButb.loading.isBegin) {
          this.basketButb.loading.begin(then: () {
            setState(() {
              Future.delayed(const Duration(milliseconds: 2000), () {
                this.basketButb.loading.end(then: () {
                  setState(() {});
                });
              });
            });
          });
        }
      }
    );

    this.buyButb = new ButtonTab(
      icon: Icons.shopping_basket,
      title: 'ซื้อเลย',
      size: 'small',
      colors: theme.button['saveColors'],
      onTap: () async {
        if (!this.buyButb.loading.isBegin) {
          this.buyButb.loading.begin(then: () {
            setState(() {
              Future.delayed(const Duration(milliseconds: 2000), () {
                this.buyButb.loading.end(then: () {
                  setState(() {});
                });
              });
            });
          });
        }
      }
    );
  }

  List<DialogBoxItem> _dialogDefaultActionsFunc ({Function done, Function cancel}) {
    return <DialogBoxItem> [
      DialogBoxItem(
        text: 'เสร็จสิ้น', 
        onPressed: () {
          if (done != null) {
            done();
          } 

          Navigator.of(this.context, rootNavigator: true).pop();
        }
      ),
      DialogBoxItem(
        text: 'ยกเลิก', 
        onPressed: () {
          if (cancel != null) {
            cancel();
          }

          Navigator.of(this.context, rootNavigator: true).pop();
        }
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    this.plantButTab.size[0] = MediaQuery.of(context).size.width*0.90;
    this.marbleButTab.size[0] = MediaQuery.of(context).size.width*0.90;
    this.potButTab.size[0] = MediaQuery.of(context).size.width*0.90;
    this.cardButTab.size[0] = MediaQuery.of(context).size.width*0.90;
    
    this.basketButb.size[0] = MediaQuery.of(context).size.width*0.90;
    this.buyButb.size[0] = MediaQuery.of(context).size.width*0.90;

    return Scaffold(
      backgroundColor: BackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget> [
            Container(
              color: Colors.grey.withOpacity(0.16),
              padding: const EdgeInsets.all(15),
              child: Column(
                children: <Widget> [
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget> [
                      Text(
                        'กำหนดสินค้าสำเร็จรูป', 
                        style: TextStyle(
                          fontSize: FontTitlePageSize,
                          color: FontColor
                        )
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget> [
                      Text(
                        '(เลือกส่วนประกอบสินค้า)', 
                        style: TextStyle(
                          fontSize: FontSubTitlePageSize,
                          color: FontColor
                        )
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget> [
                      this.plantButTab.build()
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget> [
                      this.marbleButTab.build()
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget> [
                      this.potButTab.build()
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget> [
                      this.cardButTab.build()
                    ],
                  ),
                ],
              )
            ),
            Container(
              padding: const EdgeInsets.all(15),
              child: Card(
                clipBehavior: Clip.antiAlias,
                child: Column(
                  children: [
                    this.totalPriceButTile.build()
                  ]
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget> [
                this.basketButb.build()
              ]
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget> [
                this.buyButb.build()
              ]
            ),
            SizedBox(height: 30,)
          ]
        ),
      )
    );
  }
}