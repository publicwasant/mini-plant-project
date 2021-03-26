import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:mp_v1_0/controllers/theme/theme.dart';
import 'package:mp_v1_0/controllers/button/button.dart';
import 'package:mp_v1_0/controllers/button/button-tab.dart';
import 'package:mp_v1_0/controllers/button/button-tile.dart';
import 'package:mp_v1_0/controllers/text-box/text-box.dart';
import 'package:mp_v1_0/controllers/dialog-box/dialog-input.dart';

Color BackgroundColor = Colors.grey[100];
Color FontColor = Colors.grey[800];
Color PriceColor = Colors.lightBlue[800];

double FontTitlePageSize = 28;
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
            title: Text('เพิ่มสินค้า'),
            bottom: TabBar(
              tabs: [
                Tab(text: 'สินค้าสำเร็จรูป', icon: Icon(Icons.spa)),
                Tab(text: 'สินค้าทั่วไป', icon: Icon(Icons.scatter_plot)),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              _CompleteProductTab(data: this.data),
              Icon(Icons.directions_transit),
            ],
          ),
        ),
      ),
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

  ButtonTile detailButTile;

  Button basketBut;
  Button buyBut;
  Button saveBut;

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

    this.diaInput = DialogInput(title: 'demo', content: <TextBox> [
      TextBox(label: 'รายละเอียด', maxLines: 4, icon: Icon(Icons.receipt))
    ]);

    this.detailButTile = ButtonTile(
      icon: Icons.receipt,
      title: 'รายละเอียด',
      subTitle: '',
      onTap: () async {
        this.diaInput.show(this.context, actions: <DialogBoxItem> [
                            DialogBoxItem(
                              text: 'ลองอีกครั้ง', 
                              onPressed: () {
                                Navigator.of(this.context, rootNavigator: true).pop();
                              }
                            )
                          ]);
      }
    );

    this.basketBut = new Button(
      icon: Icons.shopping_cart,
      title: 'ยิบใส่ตะกล้า',
      size: 'small',
      border: 1.0,
      colors: theme.button['basketColors'],
      onTap: () async {
        if (!this.basketBut.loading.isBegin) {
          this.basketBut.loading.begin(then: () {
            setState(() {
              Future.delayed(const Duration(milliseconds: 2000), () {
                this.basketBut.loading.end(then: () {
                  setState(() {});
                });
              });
            });
          });
        }
      }
    );

    this.buyBut = new Button(
      icon: Icons.shopping_basket,
      title: 'ซื้อเลย',
      size: 'small',
      colors: theme.button['buyColors'],
      onTap: () async {
        if (!this.buyBut.loading.isBegin) {
          this.buyBut.loading.begin(then: () {
            setState(() {
              Future.delayed(const Duration(milliseconds: 2000), () {
                this.buyBut.loading.end(then: () {
                  setState(() {});
                });
              });
            });
          });
        }
      }
    );

    this.saveBut = new Button(
      icon: Icons.add_circle,
      title: 'บันทึก',
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

  @override
  Widget build(BuildContext context) {
    this.plantButTab.size[0] = MediaQuery.of(context).size.width*0.90;
    this.marbleButTab.size[0] = MediaQuery.of(context).size.width*0.90;
    this.potButTab.size[0] = MediaQuery.of(context).size.width*0.90;
    this.cardButTab.size[0] = MediaQuery.of(context).size.width*0.90;
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
                      Container(
                        child: Text(
                          'เลือกส่วนประกอบสินค้า', 
                          style: TextStyle(
                            fontSize: FontTitlePageSize,
                            color: FontColor
                          )
                        ),
                      )
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
                    SizedBox(height: 15,),
                    Container(
                      child: ListTile(
                        leading: Icon(Icons.image),
                        title: const Text('รูปภาพ'),
                        subtitle: Text(
                          '...',
                          style: TextStyle(
                            fontSize: FontDetailSize,
                            color: FontColor
                          ),
                        ),
                      ),
                    ),
                    // Container(
                    //   child: InkWell(
                    //     onTap: () {
                    //       this.diaInput.show(this.context, size: MediaQuery.of(this.context).size.width*0.90, actions: <DialogBoxItem> [
                    //         DialogBoxItem(
                    //           text: 'ลองอีกครั้ง', 
                    //           onPressed: () {
                    //             Navigator.of(this.context, rootNavigator: true).pop();
                    //           }
                    //         )
                    //       ]);
                    //     },
                    //     child: ListTile(
                    //       leading: Icon(Icons.receipt),
                    //       title: const Text('รายละเอียด'),
                    //       subtitle: Text(
                    //         '...',
                    //         style: TextStyle(
                    //           fontSize: FontDetailSize,
                    //           color: FontColor
                    //         ),
                    //       ),
                    //     ),
                    //   )
                    // ),
                    this.detailButTile.build(),
                    Container(
                      child: ListTile(
                        leading: Icon(Icons.change_history),
                        title: const Text('ขนาด'),
                        subtitle: Text(
                          'S, M, L',
                          style: TextStyle(
                            fontSize: FontDetailSize,
                            color: FontColor
                          ),
                        ),
                      ),
                    ),
                    Container(
                      child: ListTile(
                        leading: Icon(Icons.link),
                        title: const Text('สถานะ'),
                        subtitle: Text(
                          '...',
                          style: TextStyle(
                            fontSize: FontStatusSize,
                            color: Colors.red
                          ),
                        ),
                      ),
                    ),
                    Container(
                      child: ListTile(
                        leading: Icon(Icons.sentiment_very_satisfied),
                        title: Text('ราคารวม'),
                        subtitle: Text(
                          '฿ 150',
                          style: TextStyle(
                            fontSize: FontPriceSize, 
                            color: PriceColor
                          ),
                        )
                      ),
                    ),
                    SizedBox(height: 15,)
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
