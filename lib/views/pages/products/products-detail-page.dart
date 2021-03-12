import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:mp_v1_0/models/product-model/product-model.dart';
import 'package:mp_v1_0/controllers/image/image-slider.dart';
import 'package:mp_v1_0/controllers/button/button.dart';

Color BackgroundColor = Colors.grey[100];
Color FontColor = Colors.grey[800];
Color PriceColor = Colors.lightBlue[800];

double FontTitleSize = 18;
double FontDetailSize = 12;
double FontStatusSize = 18;
double FontPriceSize = 18;

class ProductsDetailPage extends StatefulWidget {
  dynamic data;

  ProductsDetailPage ({dynamic data}) {
    this.data = data;
  }

  @override 
  State<StatefulWidget> createState () {
    return _ProductsDetailPageState(data: this.data);
  }
}

class _ProductsDetailPageState extends State<ProductsDetailPage> {
  dynamic data;
  BuildContext context;

  int option;
  ProductModel productModel;
  ImageSlider imageSliders;

  Button basketBut;
  Button buyBut;
  Button chooseBut;

  _ProductsDetailPageState ({dynamic data}) {
    this.data = data;
    this.option = (data['option'] != null) ? data['option'] : 0;
    this.productModel = data['productModel'];

    // Testcase
    // this.productModel = new ProductModel(
    //   id: 10,
    //   title: 'กระถางต้นไม้สีธรรมชาติ 3 ขนาด Succulent and Cactus Plants Flower Natural Pot Home Desk Garden Decor 3 Sizes',
    //   type: 'กระถาง',
    //   size: ['S', 'M', 'L'],
    //   detail: 'กระถางต้นไม้สีธรรมชาติ 3 ขนาด Succulent and Cactus Plants Flower Natural Pot Home Desk Garden Decor 3 Sizes',
    //   status: 'ยกเลิกการขาย',
    //   price: 29,
    //   discount: 0.21,
    //   total: 17,
    //   imgsURL: [
    //     'https://laz-img-sg.alicdn.com/p/6354748d295692179a650ca7cbb45524.jpg_720x720q80.jpg_.webp',
    //     'https://www.homefurnishingdeals.com/wp-content/uploads/2017/01/Wish-you-have-a-nice-day-45-Round-Plastic-Plant-Flower-Pots-Home-Office-Decor-Planter-5-Colors-5-4inch-0.jpg',
    //     'https://th-test-11.slatic.net/p/6ab545b542621c08d8b5e1c33dc27bba.jpg_720x720q80.jpg_.webp"',
    //     'https://my-test-11.slatic.net/p/58bf63775c46d05dd36b117f552191dc.jpg_720x720q80.jpg_.webp',
    //   ]
    // );

    this.imageSliders = new ImageSlider(
      onPageChanged: (int index) {
        setState(() {});
      },
      imgsURL: this.productModel.imgsURL
    );

    this.basketBut = new Button(
      icon: Icons.shopping_cart,
      text: 'ยิบใส่ตะกล้า',
      size: 'small',
      border: 1.0,
      colors: [BackgroundColor, Colors.lightBlue[800], Colors.lightBlue[800]],
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
      text: 'ซื้อเลย',
      size: 'small',
      colors: [Colors.lightBlue[800], Colors.white, Colors.white],
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

    this.chooseBut = new Button(
      text: 'เลือก',
      size: 'small',
      colors: [Colors.lightBlue[800], Colors.white, Colors.white],
      onTap: () async {
        if (!this.chooseBut.loading.isBegin) {
          this.chooseBut.loading.begin(then: () {
            setState(() {
              Future.delayed(const Duration(milliseconds: 2000), () {
                this.chooseBut.loading.end(then: () {
                  setState(() {});
                });
              });
            });
          });
        }
      }
    );
  }

  Widget build (BuildContext context) {
    this.context = context;

    return Scaffold(
      backgroundColor: BackgroundColor,
      appBar: AppBar(
        title: Text(this.productModel.type)
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            Container(
              child: this.imageSliders.build(context: context, state: this)
            ),
            Container(
              padding: const EdgeInsets.all(15),
              child: Text(
                this.productModel.title,
                style: TextStyle(
                  fontSize: FontTitleSize,
                  color: FontColor
                ),
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
                        leading: Icon(Icons.receipt),
                        title: const Text('รายละเอียด'),
                        subtitle: Text(
                          this.productModel.detail,
                          style: TextStyle(
                            fontSize: FontDetailSize,
                            color: FontColor
                          ),
                        ),
                      ),
                    ),
                    Container(
                      child: ListTile(
                        leading: Icon(Icons.change_history),
                        title: const Text('ขนาด'),
                        subtitle: Row(
                          children: this.productModel.size.map((item) => Container(
                            child: Text(
                              item + ((this.productModel.size.indexOf(item) != this.productModel.size.length-1) ? (
                                ', '
                              ) : (' ')),
                              style: TextStyle(
                                fontSize: FontDetailSize,
                                color: FontColor
                              ),
                            )
                          )).toList(),
                        )
                      ),
                    ),
                    (this.productModel.status != '') ? Container(
                      child: ListTile(
                        leading: Icon(Icons.link),
                        title: const Text('สถานะ'),
                        subtitle: Text(
                          this.productModel.status,
                          style: TextStyle(
                            fontSize: FontStatusSize,
                            color: Colors.red
                          ),
                        ),
                      ),
                    ) : Container(),
                    Container(
                      child: ListTile(
                        leading: Icon(Icons.sentiment_very_satisfied),
                        title: Row(
                          children: <Widget> [
                            Text('ราคา'),
                            Text(
                              (this.productModel.discount < 1.0) ? (
                                ' (-' + this.productModel.discountCalculated().toString()+'%)'
                              ) : (''),
                              style: TextStyle(
                                fontSize: FontDetailSize,
                                color: FontColor
                              ),
                            )
                          ]
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Text(
                                '฿ ' + this.productModel.priceCalculated().toString(),
                                style: TextStyle(
                                  fontSize: FontPriceSize, 
                                  color: PriceColor
                                ),
                              )
                            ),
                            Container(
                              child: Text(
                                (this.productModel.discount < 1.0) ? (
                                  '฿ ' + this.productModel.price.toString()
                                ) : '',
                                style: TextStyle(
                                  fontSize: FontDetailSize,
                                  color: Colors.grey[800],
                                  decoration: TextDecoration.lineThrough,
                                ),
                              )
                            )
                          ],
                        ),
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
          ],
        ),
      )
    );
  }

  List<Widget> _getOptions () {
    if (this.option == 0) {
      return <Widget> [
        this.basketBut.build(),
        this.buyBut.build()
      ];
    } else if (this.option == 1) {
      return <Widget> [
        this.chooseBut.build()
      ];
    } else {
      return <Widget> [
        this.basketBut.build(),
        this.buyBut.build()
      ];
    }
  }
}