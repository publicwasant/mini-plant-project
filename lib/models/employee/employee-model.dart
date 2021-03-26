class EmployeeModel {
  int id;
  String username;
  String email;
  String name;
  String addr;
  String phone;
  String imgURL;
  int status;

  EmployeeModel ({
    int id=-1, 
    String username='', 
    String email='', 
    String name='', 
    String addr='', 
    String phone='',
    String imgURL='',
    int status=-1,
    Map<String, dynamic> fromMap
  }) {

    this.id = id;
    this.username = username;
    this.email = email;
    this.name = name;
    this.addr = addr;
    this.phone = phone;
    this.imgURL = imgURL;
    this.status = status;

    if (fromMap != null) {
      this.fromMap(fromMap);
    }
  }

  Map<String, dynamic> toMap () {
    return {
      'emp_id': this.id,
      'emp_username': this.username,
      'emp_email': this.email,
      'emp_name': this.name,
      'emp_addr': this.addr,
      'emp_phone': this.phone,
      'emp_imgURL': this.imgURL,
      'emp_status': this.status
    };
  }

  void fromMap(Map<String, dynamic> data) {
    this.id = data['emp_id'];
    this.username = data['emp_username'];
    this.email = data['emp_email'];
    this.name = data['emp_name'];
    this.addr = data['emp_addr'];
    this.phone = data['emp_phone'];
    this.imgURL = data['emp_imgURL'];
    this.status = data['emp_status'];
  }
}