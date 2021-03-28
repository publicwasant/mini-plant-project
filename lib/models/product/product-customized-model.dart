import 'package:mp_v1_0/models/product/product-model.dart';

class CustomizedProductModel extends ProductModel {
  ProductModel plant;
  ProductModel marble;
  ProductModel pot;
  ProductModel card;

  double totalPrice;

  CustomizedProductModel ({
      int id=-1, String name='', String detail='', int type=-1, List<String> size, int status=-1, int promo_id=-1, double discount=1.0, List<String> imgsURL,
      ProductModel plant, ProductModel marble, ProductModel pot, ProductModel card,
    }) {

    this.plant = plant;
    this.marble = marble;
    this.pot = pot;
    this.card = card;

    this.id = id;
    this.promo_id = promo_id;
    this.name = name;
    this.detail = detail;
    this.type = type;
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