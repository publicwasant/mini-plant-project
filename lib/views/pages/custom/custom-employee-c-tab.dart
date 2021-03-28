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

  ButtonTab saveBut;

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

    this.detailBox = new TextBox(
      label: 'รายละเอียด',
      autoFocus: true, 
      maxLines: 8
    );

    this.totalPriceBox = new TextBox(
      label: 'ราคา',
      autoFocus: true
    );

    this.diaInput = DialogBox();

    this.imgsButTile = ButtonTile(
      icon: Icons.image,
      title: 'รูปภาพเพิ่มเติม',
      subTitle: '(แตะเพื่อเลือกรูปภาพ)',
      onTap: () async {
      }
    );

    this.detailButTile = ButtonTile(
      icon: Icons.receipt,
      title: 'รายละเอียด',
      subTitle: '(แตะเพื่อเพิ่มรายละเอียด)',
      onTap: () async {
        this.diaInput.show(
          this.context,
          icon: Icons.receipt,
          title: 'รายละเอียดสินค้า',
          content: [this.detailBox.build()], 
          actions: this._dialogDefaultActionsFunc(
            done: () {
              this.detailButTile.subTitle = this.detailBox.controller.text;
              setState(() {});
            },
            cancel: () {}
          )
        );
      }
    );

    this.statusButTile = ButtonTile(
      icon: Icons.link,
      title: 'สถานะ',
      subTitle: '(แตะเพื่อเลือกสถานะ)',
      onTap: () async {
        // this.statusButTile.fontSize = FontStatusSize;
        // setState(() {});
      }
    );

    this.totalPriceButTile = ButtonTile(
      icon: Icons.sentiment_very_satisfied,
      title: 'ราคา',
      subTitle: '(แตะเพื่อเพิ่มราคา)',
      onTap: () async {
        this.diaInput.show(
          this.context,
          icon: Icons.sentiment_very_satisfied,
          title: 'ราคาสินค้า',
          content: [this.totalPriceBox.build()], 
          actions: this._dialogDefaultActionsFunc(
            done: () {
              this.totalPriceButTile.fontSize = FontPriceSize;
              this.totalPriceButTile.fontColor = PriceColor;
              this.totalPriceButTile.subTitle = '฿ ' + this.totalPriceBox.controller.text;
              setState(() {});
            },
            cancel: () {}
          )
        );
      }
    );

    this.saveBut = new ButtonTab(
      icon: Icons.add_circle,
      title: 'วางจำหน่าย',
      size: 'small',
      colors: theme.button['saveColors'],
      onTap: () async {
        if (!this.saveBut.loading.isBegin) {
          this.saveBut.loading.begin(then: () {
            setState(() {
              Future.delayed(const Duration(milliseconds: 2000), () {
                this.saveBut.loading.end(then: () {
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
    
    this.saveBut.size[0] = MediaQuery.of(context).size.width*0.90;
    // this.diaInput.size = MediaQuery.of(context).size.width*0.90;

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
                        'สร้างสินค้าสำเร็จรูป', 
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
                    this.imgsButTile.build(),
                    this.detailButTile.build(),
                    this.statusButTile.build(),
                    this.totalPriceButTile.build()
                  ]
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget> [
                this.saveBut.build(), 
              ]
            ), 
            SizedBox(height: 30,)
          ]
        ),
      )
    );
  }
}