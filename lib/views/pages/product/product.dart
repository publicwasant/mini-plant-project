import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:mp_v1_0/controllers/redirect/redirect.dart';
import 'package:mp_v1_0/controllers/product/product-bar.dart';
import 'package:mp_v1_0/controllers/product/product-item.dart';
import 'package:mp_v1_0/controllers/dialog-box/dialog-box.dart';
import 'package:mp_v1_0/controllers/loader/loader.dart';
import 'package:mp_v1_0/controllers/fetch/fetch.dart';

import 'package:mp_v1_0/models/product/product-model.dart';

class ProductsPage extends StatefulWidget {
  dynamic data;

  ProductsPage ({dynamic data}) {
    this.data = data;
  }

  @override
  State <StatefulWidget> createState() {
    return _ProductsPageState(data: this.data);
  }
}

class _ProductsPageState extends State<ProductsPage> {
  dynamic data;
  BuildContext context;

  Loader loading;
  ProductBar generalProBar;

  DialogBox diaFetch;

  // ProductBar productBar;
  
  // ProductItem productItem1;
  // ProductItem productItem2;
  // ProductItem productItem3;
  // ProductItem productItem4;

  _ProductsPageState ({dynamic data}) {
    this.data = data;

    this.loading = new Loader(begin: true);
    this.generalProBar = new ProductBar(
      title: 'สินค้าทั่วไป',
      itemSize: 'small',
      onTap: (ProductItem item) {
        Redirect(this.context, '/products/detail', data: {
          'option': 0,
          'productModel' : item.productModel
        });
      }
    );

    this.diaFetch = new DialogBox(
      icon: Icons.warning,
      title: 'โหลดสินค้า',
      actions: <DialogBoxItem> [
        DialogBoxItem(
          text: 'ลองอีกครั้ง', 
          onPressed: () {
            data['current'] = 0;

            Navigator.of(this.context, rootNavigator: true).pop();
            ClearPage(this.context, '/home', data: data);
          }
        )
      ]
    );

    Get('http://mini-plant.comsciproject.com/product', then: (dynamic response) {
      dynamic result = jsonDecode(response.body);

      this.loading.end(then: () {
        setState(() {});

        if (result['status'] == 1) {
          for (int i=0; i < result['data'].length; i++) {
            this.generalProBar.items.add(
              ProductItem(ProductModel(fromMap: result['data'][i]))
            );
          }
          
        } else {
        }
      });
    }, error: (dynamic e) {
      this.diaFetch.content = <Widget> [Text('เกิดข้อผิดพลาดในการโหลดสินค้า')];
      this.diaFetch.show(this.context, dismiss: false);
    });
  }

  @override
  Widget build(BuildContext context) {
    this.context = context;

    return Scaffold(
      appBar: new AppBar(
        title: Text('Mini Plant'),
        automaticallyImplyLeading: false,
        actions: <Widget> [
        ],
      ),
      body: (!this.loading.isBegin) ? Container(
        child: ListView(
          shrinkWrap: true,
          children: <Widget> [
            this.generalProBar.build(context: context),
          ],
        ),
      ) : Center(
        child: this.loading.build(),
      )
    );
  }
}
