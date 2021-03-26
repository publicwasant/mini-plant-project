import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:mp_v1_0/controllers/product/product-item.dart';

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

