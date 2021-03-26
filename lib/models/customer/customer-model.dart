class CustomerModel {
  int id;
  String email;
  String name;
  String addr;
  String phone;
  String imgURL;

  CustomerModel ({int id=-1, String email='', String name='', String addr='', String phone='', String imgURL='', Map<String, dynamic> fromMap} ) {
    this.id = id;
    this.email = email;
    this.name = name;
    this.addr = addr;
    this.phone = phone;
    this.imgURL = imgURL;
    
    if (fromMap != null) {
      this.fromMap(fromMap);
    }
  }

  Map<String, dynamic> toMap () {
    return {
      'cus_id': this.id,
      'cus_email': this.email,
      'cus_name': this.name,
      'cus_addr': this.addr,
      'cus_phone': this.phone,
      'cus_imgURL': this.imgURL
    };
  }

  void fromMap (Map<String, dynamic> data) {
    this.id = data['cus_id'];
    this.email = data['cus_email'];
    this.name = data['cus_name'];
    this.addr = data['cus_addr'];
    this.phone = data['cus_phone'];
    this.imgURL = data['cus_imgURL'];
  }
}