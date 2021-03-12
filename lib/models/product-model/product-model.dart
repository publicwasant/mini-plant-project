class ProductModel {
  int id;
  String title;
  String detail;
  String type;
  int total;
  List<String> size;
  String status;
  double price;
  double discount;
  List<String> imgsURL;

  ProductModel ({int id=-1, String title='', String detail='', String type='', int total=-1, List<String> size, String status='', double price=0.0, double discount=1.0, List<String> imgsURL}) {
    this.id = id;
    this.title = title;
    this.detail = detail;
    this.type = type;
    this.total = total;
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
}