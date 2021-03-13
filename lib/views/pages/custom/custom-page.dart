import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:mp_v1_0/controllers/theme/theme.dart';
import 'package:mp_v1_0/controllers/button/button.dart';
import 'package:mp_v1_0/controllers/button/button-tab.dart';

Color BackgroundColor = Colors.grey[100];
Color FontColor = Colors.grey[800];
Color PriceColor = Colors.lightBlue[800];

double FontTitlePageSize = 28;
double FontTitleSize = 18;
double FontDetailSize = 12;
double FontStatusSize = 18;
double FontPriceSize = 18;

class CustomPage extends StatefulWidget {
  dynamic data;

  CustomPage ({dynamic data}) {
    this.data = data;
  }

  @override
  State <StatefulWidget> createState() {
    return _CustomPageState(data: this.data);
  }
}

class _CustomPageState extends State<CustomPage> {
  dynamic data;
  int userStatus;

  /*
   * 0 = admin,
   * 1 = customer, general users
   */

  ButtonTab plantButTab;
  ButtonTab marbleButTab;
  ButtonTab potButTab;
  ButtonTab cardButTab;

  Button basketBut;
  Button buyBut;
  Button saveBut;
  
  _CustomPageState ({dynamic data}) {
    this.data = data;
    this.userStatus = (data['userStatus'] != null) ? data['userStatus'] : 1;
    
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
                  SizedBox(height: 30),
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
                  SizedBox(height: 30),
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
                    (this.userStatus == 0) ? (
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
                      )
                    ) : Container(),
                    (this.userStatus == 0) ? (
                      Container(
                        child: ListTile(
                          leading: Icon(Icons.receipt),
                          title: const Text('รายละเอียด'),
                          subtitle: Text(
                            '...',
                            style: TextStyle(
                              fontSize: FontDetailSize,
                              color: FontColor
                            ),
                          ),
                        ),
                      )
                    ) : Container(),
                    (this.userStatus == 0) ? (
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
                      )
                    ) : Container(),
                    (this.userStatus == 0) ? (
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
                      )
                    ) : Container(),
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
              children: this._getOptions()
            ), 
            SizedBox(height: 30,)
          ]
        ),
      )
    );
  }

  List<Widget> _getOptions () {
    if (this.userStatus == 1) {
      return <Widget> [
        this.basketBut.build(),
        this.buyBut.build()
      ];
    } else if (this.userStatus == 0) {
      return <Widget> [
        this.saveBut.build()
      ];
    } else {
      return <Widget> [
        this.basketBut.build(),
        this.buyBut.build()
      ];
    }
  }
}
