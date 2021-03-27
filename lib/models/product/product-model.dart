import 'dart:convert';

class ProductModel {
  int id;
  String name;
  String detail;
  String type;
  List<String> size;
  String status;
  double price;
  double discount;
  List<String> imgsURL;

  ProductModel ({int id=-1, String name='', String detail='', String type='', List<String> size, String status='', double price=0.0, double discount=1.0, List<String> imgsURL}) {
    this.id = id;
    this.name = name;
    this.detail = detail;
    this.type = type;
    this.size = (size != null) ? size : [];
    this.status = status;
    this.price = price;
    this.discount= discount;
    this.imgsURL = (imgsURL != null) ? imgsURL : [null];
  }

  double priceCalculated () {
    return (this.discount < 1.0) ? (
      double.parse((this.price-(this.price * this.discount)).toStringAsFixed(2))
    ) : this.price;
  }

  double discountCalculated () {
    return double.parse((this.discount*100).toStringAsFixed(2));
  }

  Map<String, dynamic> toMap () {
    return {
      'pr_id': this.id,
      'pr_name': this.name,
      'pr_detail': this.detail,
      'pr_type': this.type,
      'pr_size': this.size,
      'pr_status': this.status,
      'pr_price': this.priceCalculated(),
      'pr_discount': this.discount,
      'pr_imgsURL': this.imgsURL    
    };
  }

  void fromMap (Map<String, dynamic> data) {
    this.id = data['pr_id'];
    this.name = data['pr_name'];
    this.detail = data['pr_detail'];
    this.type = data['pr_type'];
    this.size = data['pr_size'];
    this.status = data['pr_status'];
    this.price = data['pr_price'];
    this.discount = data['pr_discount'];
    this.imgsURL = jsonDecode(data['pr_imgsURL']);
  }
}