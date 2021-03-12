import 'package:mp_v1_0/models/product-model/product-model.dart';

class CustomizedProductModel extends ProductModel {
  ProductModel plant;
  ProductModel marble;
  ProductModel pot;
  ProductModel card;

  double totalPrice;

  CustomizedProductModel ({
      int id=-1, String title='', String detail='', String type='', int total=-1, List<String> size, String status='', double discount=1.0, List<String> imgsURL,
      ProductModel plant, ProductModel marble, ProductModel pot, ProductModel card,
    }) {

    this.plant = plant;
    this.marble = marble;
    this.pot = pot;
    this.card = card;

    this.id = id;
    this.title = title;
    this.detail = detail;
    this.type = type;
    this.total = total;
    this.size = (size != null) ? size : [];
    this.status = status;
    this.price = this.priceCalculated();
    this.discount= discount;
    this.imgsURL = (imgsURL != null) ? imgsURL : [null];

    this.totalPrice = this.priceCalculated();
  }

  double priceCalculated () {
    return (
      this.plant.priceCalculated() 
      + this.marble.priceCalculated() 
      + this.pot.priceCalculated() 
      + this.card.priceCalculated()
    );
  }
}