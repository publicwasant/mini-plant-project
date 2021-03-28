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
import 'package:mp_v1_0/controllers/theme/theme.dart';

import 'package:mp_v1_0/controllers/dropdawn-box/dropdawn-box.dart';

import 'package:mp_v1_0/controllers/redirect/redirect.dart';
import 'package:mp_v1_0/controllers/fetch/fetch.dart';
import 'package:mp_v1_0/models/product/product-model.dart';
import 'package:mp_v1_0/models/orderdetais/orderDetails.dart';
import 'package:http/http.dart' as http;

Color BackgroundColor = Colors.grey[100];
Color FontColor = Colors.grey[800];
Color PriceColor = Colors.lightBlue[800];
Color StatusColor = Colors.red;

double FontTitleSize = 18;
double FontDetailSize = 12;
double FontStatusSize = 18;
double FontPriceSize = 18;

class ProductsDetailPage extends StatefulWidget {
  dynamic data;

  ProductsDetailPage({dynamic data}) {
    this.data = data;
  }

  @override
  State<StatefulWidget> createState() {
    return _ProductsDetailPageState(data: this.data);
  }
}

class _ProductsDetailPageState extends State<ProductsDetailPage> {
  dynamic data;
  BuildContext context;

  int option;
  ProductModel productModel;
  ImageSlider imageSliders;

  ButtonTile typeButTile;
  ButtonTile detailButTile;
  ButtonTile sizeButTile;
  ButtonTile statusButTile;
  ButtonTile totalPriceButTile;

  ButtonTab basketButb;
  ButtonTab buyButb;
  Button chooseBut;

  _ProductsDetailPageState({dynamic data}) {
    this.data = data;
    this.option = (data['option'] != null) ? data['option'] : 0;
    this.productModel = data['productModel'];

    this.imageSliders = new ImageSlider(
        onPageChanged: (int index) {
          setState(() {});
        },
        imgsURL: this.productModel.imgsURL);

    this.typeButTile = ButtonTile(
        icon: Icons.widgets,
        title: 'ประเภท',
        subTitle: this.productModel.getType(),
        onTap: () async {});

    this.detailButTile = ButtonTile(
        icon: Icons.receipt,
        title: 'รายละเอียด',
        subTitle: this.productModel.detail,
        onTap: () async {});

    this.sizeButTile = ButtonTile(
        icon: Icons.change_history,
        title: 'ขนาด',
        subTitle: this.productModel.size.toString(),
        onTap: () async {});

    this.statusButTile = ButtonTile(
        icon: Icons.link,
        title: 'สถานะ',
        fontSize: FontPriceSize,
        fontColor: (this.productModel.status == 1)
            ? Colors.red[800]
            : Colors.green[800],
        subTitle: this.productModel.getStatus(),
        onTap: () async {});

    this.totalPriceButTile = ButtonTile(
        icon: Icons.sentiment_very_satisfied,
        title: 'ราคา',
        subTitle: '฿ ' + this.productModel.priceCalculated().toString(),
        fontSize: FontPriceSize,
        fontColor: PriceColor,
        onTap: () async {});

    this.basketButb = new ButtonTab(
        icon: Icons.shopping_cart,
        title: 'ยิบไส่ตะกร้า',
        size: 'small',
        colors: theme.button['basketColors'],
        border: 1.0,
        onTap: () async {
          if (!this.basketButb.loading.isBegin) {
            this.basketButb.loading.begin(then: () async {
              setState(() {});
              OrderDetails body = OrderDetails(
                  id: this.productModel.id,
                  amount: 1,
                  price: this.productModel.priceCalculated());

              Post('http://mini-plant.comsciproject.com/order/detail/add',
                  body.toMap(), then: (dynamic response) {
                dynamic result = jsonDecode(response.body);
                this.basketButb.loading.end(then: () {
                  setState(() {});
                });
              }, error: (dynamic e) {});
            });
          }
        });

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
        });

    this.chooseBut = new Button(
        title: 'เลือก',
        size: 'small',
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
        });
  }

  Widget build(BuildContext context) {
    this.context = context;

    this.basketButb.size[0] = MediaQuery.of(context).size.width * 0.90;
    this.buyButb.size[0] = MediaQuery.of(context).size.width * 0.90;

    return Scaffold(
        backgroundColor: BackgroundColor,
        appBar: AppBar(title: Text(this.productModel.name)),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  child:
                      this.imageSliders.build(context: context, state: this)),
              Container(
                  padding: const EdgeInsets.all(15),
                  child: Text(
                    this.productModel.name,
                    style: TextStyle(fontSize: FontTitleSize, color: FontColor),
                  )),
              Container(
                padding: const EdgeInsets.all(15),
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  child: Column(children: [
                    this.detailButTile.build(),
                    this.typeButTile.build(),
                    this.sizeButTile.build(),
                    this.statusButTile.build(),
                    this.totalPriceButTile.build()
                  ]),
                ),
              ),
              Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: this._getOptions()),
              SizedBox(
                height: 30,
              )
            ],
          ),
        ));
  }

  List<Widget> _getOptions() {
    if (this.option == 0) {
      return <Widget>[this.basketButb.build(), this.buyButb.build()];
    } else if (this.option == 1) {
      return <Widget>[this.chooseBut.build()];
    } else {
      return <Widget>[this.basketButb.build(), this.buyButb.build()];
    }
  }
}
