import 'dart:convert';

class ProductModel {
  int id;
  int promo_id;
  String name;
  String detail;
  int type;
  List<String> size;
  int status;
  double price;
  double discount;
  List<String> imgsURL;

  List<String> strTypes;
  List<String> strStatus;

  ProductModel ({
    int id=-1, 
    String name='', 
    String detail='', 
    int type=-1, 
    List<String> size, 
    int status=-1, 
    double price=0.0, 
    int promo_id=-1, 
    double discount=1.0, 
    List<String> imgsURL, 
    Map<String, dynamic> fromMap
  }) {
    this.id = id;
    this.promo_id = promo_id;
    this.name = name;
    this.detail = detail;
    this.type = type;
    this.size = (size != null) ? size : [];
    this.status = status;
    this.price = price;
    this.discount = discount;
    this.imgsURL = (imgsURL != null) ? imgsURL : [];

    this.strTypes = <String> ['กระถางต้นไม้', 'ต้นไม้', 'หินตกแต่ง', 'การ์ดอวยพร', 'สินค้าสำเร็จรูป'];
    this.strStatus = <String> ['อยู่ในการขาย', 'ยกเลิกการขาย'];

    if (fromMap != null) {
      this.fromMap(fromMap);
    }
  }

  double priceCalculated () {
    return (this.discount < 1.0) ? (
      double.parse((this.price-(this.price * this.discount)).toStringAsFixed(2))
    ) : this.price;
  }

  double discountCalculated () {
    return double.parse((this.discount*100).toStringAsFixed(2));
  }

  String getType () {
    return this.strTypes[this.type];
  }

  String getStatus () {
    return this.strStatus[this.status];
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
      'pr_promo_id': this.promo_id,
      'pr_discount': this.discount,
      'pr_imgsURL': this.imgsURL    
    };
  }

  void fromMap (Map<String, dynamic> data) {
    dynamic prSize = jsonDecode(data['pr_size']);
    dynamic prImgsURL = jsonDecode(data['pr_imgsURL']);

    for (int i=0; i < prSize.length; i++) {
      this.size.add(prSize[i]);
    }

    for (int i=0; i < prImgsURL.length; i++) {
      this.imgsURL.add(prImgsURL[i]);
    }

    this.id = data['pr_id'];
    this.name = data['pr_name'];
    this.detail = data['pr_detail'];
    this.type = data['pr_type'];
    this.status = data['pr_status'];
    this.price = data['pr_price'].toDouble();
    this.promo_id = data['pr_promo_id'];
  }
}