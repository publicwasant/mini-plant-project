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

class ProductTab extends StatefulWidget {
  dynamic data;

  ProductTab ({dynamic data}) {
    this.data = data;
  }

  @override
  State <StatefulWidget> createState() {
    return _ProductTabState(data: this.data);
  }
}

class _ProductTabState extends State<ProductTab> {
  dynamic data;

  List<String> imgsURL;
  ImageGallery imgsGal;

  DropdawnBox typeDbox;
  TextBox nameBox;
  TextBox detailBox;
  DropdawnBox sizeDbox;
  DropdawnBox statusDbox;
  TextBox totalPriceBox;

  ButtonTile typeButTile;
  ButtonTile nameButTile;
  ButtonTile detailButTile;
  ButtonTile sizeButTile;
  ButtonTile statusButTile;
  ButtonTile totalPriceButTile;

  ButtonTab saveBut;
  DialogBox diaFetch;
  DialogBox diaInput;

  ProductModel productModel;
  
  _ProductTabState ({dynamic data}) {
    this.data = data;

    this.imgsGal = new ImageGallery(
      imgsURL: [
        'https://laz-img-sg.alicdn.com/p/6354748d295692179a650ca7cbb45524.jpg_720x720q80.jpg_.webp',
        'https://www.homefurnishingdeals.com/wp-content/uploads/2017/01/Wish-you-have-a-nice-day-45-Round-Plastic-Plant-Flower-Pots-Home-Office-Decor-Planter-5-Colors-5-4inch-0.jpg',
        'https://th-test-11.slatic.net/p/6ab545b542621c08d8b5e1c33dc27bba.jpg_720x720q80.jpg_.webp"',
      ],
      onTap: (item) {
      },
      onLongTap: (item) {
      }
    );

    this.typeDbox = DropdawnBox(
      items: <String> ['กระถางต้นไม้', 'ต้นไม้', 'หินตกแต่ง', 'การ์ดอวยพร', 'สินค้าสำเร็จรูป'],
    );

    this.nameBox = new TextBox(
      label: 'ชื่อสินค้า',
      autoFocus: true,
      maxLines: 8
    );

    this.detailBox = new TextBox(
      label: 'รายละเอียด', 
      autoFocus: true, 
      maxLines: 8
    );

    this.sizeDbox= DropdawnBox(
      items: <String> ['S', 'M', 'L'],
    );

    this.statusDbox= DropdawnBox(
      items: <String> ['อยู่ในการขาย', 'ยกเลิกการขาย'],
    );

    this.totalPriceBox = new TextBox(
      label: 'ราคา', 
      autoFocus: true,
    );
    this.totalPriceBox.controller.text = '0.0';

    this.diaFetch = DialogBox(icon: Icons.storefront, title: 'ว่างจำหน่าย');
    this.diaInput = DialogBox();

    this.typeButTile = ButtonTile(
      icon: Icons.widgets,
      title: 'ประเภท',
      subTitle: '(แตะเลือกประเภท)',
      onTap: () async {
        this.diaInput.show(
          this.context,
          icon: Icons.widgets,
          title: 'ประเภท',
          content: [this.typeDbox.build()], 
          actions: this._dialogDefaultActionsFunc(
            done: () {
              this.typeButTile.subTitle = this.typeDbox.items[this.typeDbox.current];
              setState(() {});
            },
            cancel: () {}
          )
        );
      }
    );

    this.nameButTile = ButtonTile(
      icon: Icons.reorder,
      title: 'ชื่อสินค้า',
      subTitle: '(แตะเพื่อเพิ่มชื่อสินค้า)',
      onTap: () async {
        this.diaInput.show(
          this.context,
          icon: Icons.reorder,
          title: 'ชื่อสินค้า',
          content: [this.nameBox.build()], 
          actions: this._dialogDefaultActionsFunc(
            done: () {
              this.nameButTile.subTitle = this.nameBox.controller.text;
              setState(() {});
            },
            cancel: () {}
          )
        );
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

    this.sizeButTile = ButtonTile(
      icon: Icons.change_history,
      title: 'ขนาด',
      subTitle: '(แตะเพื่อเลือกขนาด)',
      onTap: () async {
        this.diaInput.show(
          this.context,
          icon: Icons.change_history,
          title: 'ขนาดสินค้า',
          content: [this.sizeDbox.build()], 
          actions: this._dialogDefaultActionsFunc(
            done: () {
              setState(() {
                this.sizeButTile.subTitle = this.sizeDbox.items[this.sizeDbox.current];
              });
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
        this.diaInput.show(
          this.context,
          icon: Icons.link,
          title: 'สถานะสินค้า',
          content: [this.statusDbox.build()], 
          actions: this._dialogDefaultActionsFunc(
            done: () {
              setState(() {
                print(this.statusDbox.current);
                this.statusButTile.subTitle = this.statusDbox.items[this.statusDbox.current];
                this.statusButTile.fontSize = FontPriceSize;
                this.statusButTile.fontColor = (this.statusDbox.current == 1) ? Colors.red[800] : Colors.green[800];
              });
            },
            cancel: () {}
          )
        );
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
          this.saveBut.loading.begin(then: () async {
            setState(() {});

            this.productModel = ProductModel(
              type: this.typeDbox.current,
              name: this.nameBox.controller.text,
              detail: this.detailBox.controller.text,
              size: [this.sizeDbox.items[this.sizeDbox.current]],
              status: this.statusDbox.current,
              price: double.parse(this.totalPriceBox.controller.text),
              imgsURL: this.imgsGal.imgsURL
            );

            Post('http://mini-plant.comsciproject.com/product/add', this.productModel.toMap(), then: (dynamic response) {
              dynamic result = jsonDecode(response.body);

              this.diaFetch.content = <Widget> [
                Text(result['descript'])
              ];

              if (result['status'] == 1) {
                  this.diaFetch.show(this.context, dismiss: false, actions: <DialogBoxItem> [
                    DialogBoxItem(
                      text: 'เสร็จสิ้น', 
                      onPressed: () {
                        data['current'] = 2;

                        Navigator.of(this.context, rootNavigator: true).pop();
                        ClearPage(this.context, '/home', data: data);
                      }
                    )
                  ]);
                } else {
                  this.diaFetch.show(this.context, actions: <DialogBoxItem> [
                    DialogBoxItem(
                      text: 'ลองอีกครั้ง', 
                      onPressed: () {
                        Navigator.of(this.context, rootNavigator: true).pop();
                      }
                    )
                  ]);
                }

              this.saveBut.loading.end(then: () {
                setState(() {});
              });
            }, error: (dynamic e) {
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
    this.saveBut.size[0] = MediaQuery.of(context).size.width*0.90;
    // this.diaInput. = MediaQuery.of(context).size.width*0.90;

    return Scaffold(
      backgroundColor: BackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget> [
            Container(
              color: Colors.grey.withOpacity(0.16),
              padding: const EdgeInsets.only(top: 15, left:15, right: 15),
              child: Column(
                children: <Widget> [
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget> [
                      Text(
                        'สร้างส่วนประกอบสินค้า', 
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
                        '(เพิ่มรูปภาพสินค้า)', 
                        style: TextStyle(
                          fontSize: FontSubTitlePageSize,
                          color: FontColor
                        )
                      ),
                    ],
                  ),
                ],
              )
            ),
            Container(
              padding: EdgeInsets.only(top: 15, bottom: 15),
              color: Colors.grey.withOpacity(0.16),
              child: this.imgsGal.build(context: context)
            ),
            Container(
              padding: const EdgeInsets.all(15),
              child: Card(
                clipBehavior: Clip.antiAlias,
                child: Column(
                  children: [
                    this.typeButTile.build(),
                    this.nameButTile.build(),
                    this.detailButTile.build(),
                    this.sizeButTile.build(),
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