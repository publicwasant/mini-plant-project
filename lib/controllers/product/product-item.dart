import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:mp_v1_0/controllers/image/image-box.dart';
import 'package:mp_v1_0/models/product/product-model.dart';

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
                          child: ImageBox(url: this.productModel.imgsURL[0], visitExcept: true).build()
                        ),
                      ),
                      SizedBox(height: 5,),
                      Padding(
                        padding: const EdgeInsets.only(left: 5, right: 5),
                        child: Container(
                          width: this.size['width'],
                          child: Text(
                            this.productModel.name,
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
                      child: (this.productModel.status == 1) ? Container(
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
                            this.productModel.getStatus(),
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