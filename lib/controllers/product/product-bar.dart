import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:mp_v1_0/controllers/image/image-mini.dart';
import 'package:mp_v1_0/models/product-model/product-model.dart';

Map<String, Map<String, double>> ProductItemSizes = {
  'small': {'width': 120, 'height': 220, 'line': 3},
  'medium': {'width': 180, 'height': 250, 'line': 4},
  'large': {'width': 350, 'height': 300, 'line': 6}
};

Map<String, Color> ProductItemColors = {
  'background' : Colors.white,
  'text' : Colors.black,
  'border' : Colors.grey[300]
};

class ProductBar {
  String title;
  int column;
  Map<String, double> itemSize;
  List<ProductItem> items;

  Function then;
  Function longThen;

  Map<String, Map<String, double>> itemsSizes = {
    'small': {'width': 150, 'height': 300, 'line': 2},
    'medium': {'width': 200, 'height': 350, 'line': 3},
    'large': {'width': 250, 'height': 400, 'line': 4}
  };

  ProductBar ({String title='', String itemSize='small', int column=2, List<ProductItem> items, void onTap(ProductItem item), void onLongTap(ProductItem item)}) {
    this.title = title;
    this.itemSize = ProductItemSizes[itemSize];
    this.column = column;
    this.items = (items != null) ? items : [];

    this.then = onTap;
    this.longThen = onLongTap;
  }

  Widget build ({BuildContext context}) {
    this.column = (context != null) ? (
      (MediaQuery.of(context).size.width*0.90) ~/ this.itemSize['width']
    ) : this.column;

    List<Widget> fitProducts = <Widget> [];

    for (int i = 0; i < this.items.length; i += this.column) {
      List<Widget> fitRow = <Widget> [];

      for (int j = i; j < this.column+i; j++) {
        if ((j <= this.items.length-1)) {
          
          this.items[j].size = this.itemSize;

          fitRow.add(this.items[j].build(
            onTap: () {
              if (this.then != null) {
                this.then(this.items[j]);
              }
            },
            onLongTap: () {
              if (this.longThen != null) {
                this.longThen(this.items[j]);
              }
            }
          ));
        } else {
          fitRow.add(Container(
            margin: const EdgeInsets.all(5),
            width: this.itemSize['width'],
          ));
        }
      }

      fitProducts.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: fitRow
        )
      );
    }

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget> [
          (this.title != '') ? Padding(
            padding: const EdgeInsets.only(
              top: 15,
              left: 15,
              right: 15
            ),
            child: Container(
              child: Text(
                this.title, 
                style: TextStyle(fontSize: 28, color: Colors.grey[800])
              ),
            )
          ) : Container(),
          (this.items.length != 0) ? Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: fitProducts
            )
          ) : Container()
        ]
      ),
    );
  }

  Function onTap (void onTap(ProductItem item)) {
    this.then = onTap;
  }

  Function onLongTap (void onLongTap(ProductItem item)) {
    this.longThen = onLongTap;
  }
}

class ProductItem {
  ProductModel productModel;

  double border;
  double radius;
  double opacity;

  Map<String, double> size;

  Function then;
  Function longThen;

  ProductItem (ProductModel productModel, {double opacity=0.0, String size='small', double border=1.0, double radius=5.0, Function onTap, Function onLongTap}) {
    this.productModel = productModel;
    
    this.border = border;
    this.radius = radius;
    this.opacity = opacity;
    this.size = ProductItemSizes[size];
    this.then = onTap;
    this.longThen = onLongTap;
  }

  Widget build ({Function onTap, Function onLongTap}) {
    this.then = onTap;
    this.longThen = onLongTap;
    
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
        width: this.size['width'],
        height: this.size['height'],
        decoration: BoxDecoration(
          color: ProductItemColors['background'],
          borderRadius: BorderRadius.all(
            Radius.circular(this.radius)
          ),
          border: (this.border != 0.0) ? Border.all(
            color: ProductItemColors['border'],
            width: this.border,
          ) : null,
        ),
        child: Container(
          child: Stack(
            children: <Widget> [
              Positioned(
                child: Align(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Container(
                        width: this.size['width'],
                        height: (this.size['height']*50)/100,
                        child: ClipRRect(
                          
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(this.radius), 
                            topRight: Radius.circular(this.radius)
                          ),
                          child: ImageMini(url: this.productModel.imgsURL[0], visitExcept: true).build()
                        ),
                      ),
                      SizedBox(height: 5,),
                      Padding(
                        padding: const EdgeInsets.only(left: 5, right: 5),
                        child: Container(
                          width: this.size['width'],
                          child: Text(
                            this.productModel.title,
                            maxLines: this.size['line'].toInt(),
                            overflow: TextOverflow.fade,
                            style: TextStyle(fontSize: 12, color: Colors.grey[800]),
                          )
                        )
                      ),
                    ],
                  )
                )
              ),
              Positioned(
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: this.size['width'],
                          child: Text(
                            '฿ ' + this.productModel.priceCalculated().toString(),
                            style: TextStyle(fontSize: 18, color: Colors.lightBlue[800]),
                          )
                        ),
                        Container(
                          width: this.size['width'],
                          child: Text(
                            (this.productModel.discount < 1.0) ? (
                              '฿ ' + this.productModel.price.toString()
                            ) : '',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough,
                            ),
                          )
                        )
                      ],
                    )
                  ),
                )
              ),
              (this.productModel.discount < 1.0) ? Positioned(
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    margin: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      color: Colors.lightGreen[800].withOpacity(0.80),
                      borderRadius: BorderRadius.all(
                        Radius.circular(5)
                      ),
                    ),
                    child: Text(
                      ' -' + this.productModel.discountCalculated().toString() + '% ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16
                      ),
                    )
                  ),
                )
              ) : Container(),
              Positioned(
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: this.size['width'],
                    height: this.size['height'],
                    child: FlatButton(
                      color: Colors.white.withOpacity(this.opacity),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(this.radius),
                      ),
                      child: (this.productModel.status != '') ? Container(
                        height: 30,
                        width: this.size['width'],
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(15)
                          ),
                          border: Border.all(
                            color: ProductItemColors['border'],
                            width: this.border,
                          )
                        ),
                        child: Center(
                          child: Text(
                            this.productModel.status,
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 12,
                            ),
                          ),
                        )
                      ) : Container(),
                      onPressed: () {
                        if (this.then != null) {
                          this.then();
                        }
                      },
                      onLongPress: () {
                        if (this.longThen != null) {
                          this.longThen();
                        }
                      },
                    ),
                  )
                )
              )
            ],
          )
        ),
      ),
    );
  }

  Function onTap (Function onTap) {
    this.then = onTap;
  }

  Function onLongTap (Function onLongTap) {
    this.longThen = onLongTap;
  }
}