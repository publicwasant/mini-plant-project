import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:mp_v1_0/models/shared-data/shared-data.dart';
import 'package:mp_v1_0/controllers/redirect/redirect.dart';

import 'package:mp_v1_0/controllers/logo/logo.dart';
import 'package:mp_v1_0/controllers/spin/spin.dart';
import 'package:mp_v1_0/controllers/text-box/text-box.dart';
import 'package:mp_v1_0/controllers/button/button.dart';
import 'package:mp_v1_0/controllers/button/button-oval.dart';

class RegisterPage extends StatefulWidget {
  dynamic data;

  RegisterPage ({dynamic data}) {
    this.data = data;
  }

  @override
  State <StatefulWidget> createState() {
    return _RegisterPageState(data: this.data);
  }
}

class _RegisterPageState extends State<RegisterPage> {
  dynamic data;
  BuildContext context;

  Logo logo;

  TextBox emailBox;
  TextBox passwordBox;
  TextBox comfirmPasswordBox;
  TextBox nameBox;
  TextBox phoneBox;
  TextBox addrBox;

  Button registerBut;
  ButtonOval imgButOval;

  _RegisterPageState ({dynamic data}) {
    this.data = data;
    
    this.emailBox = new TextBox(label: 'อีเมล', icon: Icon(Icons.mail));
    this.passwordBox = new TextBox(label: 'รหัสผ่าน', obscure: true, icon: Icon(Icons.https));
    this.comfirmPasswordBox = new TextBox(label: 'ยืนยันรหัสผ่าน', obscure: true, icon: Icon(Icons.https));
    this.nameBox = new TextBox(label: 'ชื่อผู้ใช้', icon: Icon(Icons.person));
    this.phoneBox = new TextBox(label: 'หมายเลขโทรศัพท์', icon: Icon(Icons.phone));
    this.addrBox = new TextBox(label: 'ที่อยู่', icon: Icon(Icons.location_on));

    this.imgButOval = new ButtonOval(
      text: 'เลือกรูปโปรไฟล์', 
      size: 'large',
      border: 4.0,
      colors: [Colors.grey, Colors.grey[800], Colors.black54],
      image: 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAQAAAADFCAMAAACM/tznAAAANlBMVEXK0eL////L0uPP1eXp7PPU2uj5+vz4+fvi5u/l6fHY3err7vTw8vfe4+309fnd4ez09/7y9f3f5NC4AAAGT0lEQVR4nO2dC5ajIBBFExD868z+Nztq0uk+3W2i8i7GkbcAD1wLKIqiuNjLqVVdEoC9m7CvTg+gTwASgL2bsK/aBCAB2LsJ+6pIABKAvZuwr04PoEwAEoC9m7CvsgQgNgBjXVWUZf33zyj/56asbJ2J3JJJkQEY12edv/4qX/c7WGMdE4Adev975+9qyt5FhhARgC2amX//1Qzyuoo6FKIBsO3zn/+FQRnTCJpIAKql3Z9GgovSplEmDgBXr+j+aAR9rGEQBYDp1/z+G4EiEoEYAGzxeu77qUgETIcDsNmG7g+KMxXyAOzK4f+pLAYBHMD2/l+vdQQCNADbbO9/lOXQ5CgAs3H8f6jDCbAATBHW/4FAxbVukkUB9FvWv28EYJcIBeBW+z+/CHaJSAAhC8BXlSQBEkDwBPChnmrhBQUgGQCTcnCash4DUKr6P+wLoCYOchgAF74CPNSBEzUGQGgApAlgAEyuBMCZAAbAKft/9dhCgAFopQCuGeULVBQAmRNwU0ONAQxA4Dbwu3JqU4QBCIoD/BQ2CVAArMwNvKslWjmoujIAnHQVvHJBYgyA0A+cRG0JKQCVHADRykH9YQBAFpAAQAB6cf+xSZACIPaEjwdA7AlzANoEgAEgDYeQAIrDACBaeUkAEoABADK4DgOgTAAYAOKAUAKABURODyBLABgAotSAT1FB0aNYABYVPj2AOgE4NwDTHAUAdDSWACQABwFAnQ6fHoBNABKAgwCALg7YjgBgrCpP+qAA2mbugvhm+bosiOgtAsCqs0PuIqJiCABtjuSnMnVDLxCACgJQqxt6gQDIcwNAAO5IFkAMgUMBIPKkXJ4AHAcAsQwiAKhl8DAALASAOBthAKj94LuIDeEIQC7KFSb2QxUCQJ0qTwLwAAAjvixxlyd2gwgA9W2Ru3KgpRAAeX7MpA5oKQRAnig8idgLjSUeiK8iAJArEwwA+X2ZSUiOCAMgrHbOnJDAOANAnys+yCNxYQhABfiCDXJ+AQHYWj/tmZg0MQgAYALQ7ekWAhBaQuuHqLNBCoD86iyVKjz4bNCXte4wVj6gwABonSGsggYHQLol5CopgQCUzhCyD/poJfVpZXCcShWfpirq08rQKFdXkgSgiwzmXD09EIDwygA3BaAAdJ4AWEwuAwHIAmPMRvgmEoCsiARYTM+QAGSzIJEYcRcKwKhmQc4LYAGoJgEqR3IUC0BUVZUssc4CCC+sPcqDI2AapuDnJdMgFgoYBQNQrIRcMc1RNADBPFizlcUbGEDwvQHqstRdlraAiwsMDIFO0CjeAgLXQrKq+KgIAILOSLBSqh+KASBkWwwGAm6KAiDAHaLKSD707hYARkJuSgC6BIAHEOALkfugSacH4CIACEkVQDdCo6IACIiM/R8ATj8Ezm4BIVmTvAXkCQAPIGA/jDtCMQCE5IvhAKoIAEICo/8FgJBTcnw7jAMwrgyJjKNnAqNgABveHP+mvGJfHB3HJ/h5wZur1wx9eJcFoLk4gj4/zQJQGAB8NtaTAFTFlEh3EAWgypgnnQEUgOr2IPnwMgpAlSdIvrtMApDdIScPyMfje+rbshsTYJogCkCXLg8uAyQAXaowaAIkAOGVGW5TCAJQ3pdAimdMKjgA0nJSWJ4ECEB6dRQbAxgA00tvjuY94wsYCICpanENCd9lrQPK35YEANtChZTyUs1AD8DYPoMKaY3ydS9dENQATFU2UCG1h5pCaAZaAK6twZ//qS6TmYEQwPDz5dWkZ+UbEYLp6F7yoR43/W/qWgUCDQDbqxe9RfJleMBcAMBWZZSBP4MgcD6ckjeCur/Pz38oL8NOjgItwLaxR/4vCLKQjVKQBdgCcvhWKi+3T4cBAN6l+6PyzU8v2K0Awg699fLZtulwGwDj9pv4ZzXsEjYwmI5v13Z/x3XvufL1DDYAeMe//5DvymrVdLAawFt3f5IfdosYAJe919Q3I18vRrAGgDlI9yc1C0fCcgCH6v6oepGPvBjA+4/9H/LZAiuY0ngXcHojr2+F8vplzMAtAWB6plZ6BPnuhZO8xALcvhveUDVPV4TXFkDUx40r/2yz+AqADU51fQc18wvCCwBHW/rm5GfzzKZMvrnuG+qEawfNDYNnAMybbfnDNJNw/ASA/NHQnfX7ajAB+AcKGl1BZWj+TAAAAABJRU5ErkJggg==',
      onTap: () {
        //work
      }
    );

    this.registerBut = new Button(
      icon: Icons.border_color,
      text: 'สมัครสมาชิก',
      size: 'medium',
      onTap: () async {
        if (!this.registerBut.loading.isBegin) {
          this.registerBut.loading.begin(then: () {
            setState(() {
              Future.delayed(const Duration(milliseconds: 2000), () {
                //process
                ClearPage(this.context, '/init');
              });
            });
          });
        }

      }
    );
  }

  @override
  Widget build(BuildContext context) {
    this.context = context;

    this.logo = new Logo(
      colors: <Color> [Colors.lightBlue[800], Colors.white],
      size: {
        'width': MediaQuery.of(context).size.width*0.80, 
        'height': 150
      }
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('สมัครสมาชิก')
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget> [
            SizedBox(height: MediaQuery.of(context).size.height*0.07),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget> [
                this.logo.build()
              ],
            ),
            SizedBox(height: 30),
            this.imgButOval.build(),
            SizedBox(height: 30),
            this.emailBox.build(),
            this.nameBox.build(),
            this.phoneBox.build(),
            this.addrBox.build(),
            this.passwordBox.build(),
            this.comfirmPasswordBox.build(),
            SizedBox(height: 15),
            this.registerBut.build()
          ],
        ),
      ),
    );
  }
}
