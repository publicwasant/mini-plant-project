import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:mp_v1_0/controllers/theme/theme.dart';
import 'package:mp_v1_0/controllers/button/button.dart';
import 'package:mp_v1_0/controllers/button/button-tab.dart';
import 'package:mp_v1_0/controllers/button/button-tile.dart';
import 'package:mp_v1_0/controllers/text-box/text-box.dart';
import 'package:mp_v1_0/controllers/dialog-box/dialog-input.dart';
import 'package:mp_v1_0/controllers/image/image-slider.dart';

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

class CustomEmployeePage extends StatefulWidget {
  dynamic data;

  CustomEmployeePage ({dynamic data}) {
    this.data = data;
  }

  @override
  State <StatefulWidget> createState() {
    return _CustomEmployeePageState(data: this.data);
  }
}

class _CustomEmployeePageState extends State<CustomEmployeePage> {
  dynamic data;
  
  _CustomEmployeePageState ({dynamic data}) {
    this.data = data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BackgroundColor,
      body: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            // backgroundColor: AppBarBackgroundColor,
            title: Text('เพิ่มสินค้า'),
            bottom: TabBar(
              tabs: [
                Tab(text: 'ส่วนประกอบสินค้า', icon: Icon(Icons.scatter_plot)),
                Tab(text: 'สินค้าสำเร็จรูป', icon: Icon(Icons.spa)),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              _ProductTab(data: data),
              _CompleteProductTab(data: this.data),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProductTab extends StatefulWidget {
  dynamic data;

  _ProductTab ({dynamic data}) {
    this.data = data;
  }

  @override
  State <StatefulWidget> createState() {
    return _ProductTabState(data: this.data);
  }
}

class _ProductTabState extends State<_ProductTab> {
  dynamic data;

  List<String> imgsURL;
  ImageSlider imageSliders;

  TextBox detailBox;
  TextBox totalPriceBox;

  ButtonTile imgButTile;
  ButtonTile detailButTile;
  ButtonTile sizeButTile;
  ButtonTile statusButTile;
  ButtonTile totalPriceButTile;

  ButtonTab saveBut;

  DialogInput diaInput;
  
  _ProductTabState ({dynamic data}) {
    this.data = data;

    this.detailBox = new TextBox(
      label: 'รายละเอียด', 
      autoFocus: true, 
      maxLines: 8
    );

    this.totalPriceBox = new TextBox(
      label: 'ราคา', 
      autoFocus: true
    );

    this.diaInput = DialogInput();

    this.imgsURL = <String> [
      // 'https://laz-img-sg.alicdn.com/p/6354748d295692179a650ca7cbb45524.jpg_720x720q80.jpg_.webp',
      //   'https://www.homefurnishingdeals.com/wp-content/uploads/2017/01/Wish-you-have-a-nice-day-45-Round-Plastic-Plant-Flower-Pots-Home-Office-Decor-Planter-5-Colors-5-4inch-0.jpg',
      //   'https://th-test-11.slatic.net/p/6ab545b542621c08d8b5e1c33dc27bba.jpg_720x720q80.jpg_.webp"',
      //   'https://my-test-11.slatic.net/p/58bf63775c46d05dd36b117f552191dc.jpg_720x720q80.jpg_.webp',
    ];

    this.imageSliders = new ImageSlider(
      onPageChanged: (int index) {
        setState(() {});
      },
      imgsURL: this.imgsURL
    );

    this.imgButTile = ButtonTile(
      icon: Icons.image,
      title: 'รูปภาพ',
      subTitle: '(แตะเพื่อเพิ่มรุปภาพ)',
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
          content: <TextBox> [
            this.detailBox
          ], 
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
          content: <TextBox> [
            this.totalPriceBox
          ], 
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
    this.saveBut.size[0] = MediaQuery.of(context).size.width*0.90;
    this.diaInput.size = MediaQuery.of(context).size.width*0.90;

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
                        '(เพิ่มข้อมูลเกี่ยวกับสินค้า)', 
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
            (this.imgsURL.length > 0) ? (
              this.imageSliders.build(context: context, state: this)
            ) : Container(
              color: Colors.grey.withOpacity(0.16),
              width: MediaQuery.of(context).size.width,
              child: Icon(Icons.image, size: 150, color: Colors.grey.withOpacity(0.8))
            ),
            SizedBox(height: 15),
            Container(
              padding: const EdgeInsets.all(15),
              child: Card(
                clipBehavior: Clip.antiAlias,
                child: Column(
                  children: [
                    this.imgButTile.build(),
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


class _CompleteProductTab extends StatefulWidget {
  dynamic data;

  _CompleteProductTab ({dynamic data}) {
    this.data = data;
  }

  @override
  State <StatefulWidget> createState() {
    return _CompleteProductTabState(data: this.data);
  }
}

class _CompleteProductTabState extends State<_CompleteProductTab> {
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

  DialogInput diaInput;
  
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

    this.diaInput = DialogInput();

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
          content: <TextBox> [
            this.detailBox
          ], 
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
          content: <TextBox> [
            this.totalPriceBox
          ], 
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
    this.diaInput.size = MediaQuery.of(context).size.width*0.90;

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


