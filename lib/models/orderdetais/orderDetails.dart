class OrderDetails {
  int id;
  int amount;
  double price;
  int orderID;

  OrderDetails(
      {int id = -1,
      int amount = 1,
      double price = 0.0,
      Map<String, dynamic> fromMap}) {
    this.id = id;
    this.amount = amount;
    this.price = price;
    this.orderID = -1;

    if (fromMap != null) {
      this.fromMap(fromMap);
    }
  }

  Map<String, dynamic> toMap() {
    return {
      'pr_id': this.id,
      'pr_amount': this.amount,
      'pr_price': this.price,
      'order_id': this.orderID
    };
  }

  void fromMap(Map<String, dynamic> data) {
    this.id = data['pr_id'];
    this.amount = data['pr_amount'];
    this.price = data['pr_price'];
    this.orderID = data['order_id'];
  }
}
