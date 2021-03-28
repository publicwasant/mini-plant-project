import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:mp_v1_0/views/pages/custom/custom-employee-c-tab.dart';
import 'package:mp_v1_0/views/pages/custom/custom-employee-p-tab.dart';

Color AppBarBackgroundColor = Colors.deepPurpleAccent;
Color BackgroundColor = Colors.grey[100];
Color FontColor = Colors.grey[800];
Color PriceColor = Colors.lightBlue[800];

double FontTitlePageSize = 28;
double FontSubTitlePageSize = 16;

double FontTitleSize = 18;
double FontDetailSize = 12;
double FontStatusSize = 18;
double FontPriceSize = 18;

class CustomEmployeePage extends StatefulWidget {
  dynamic data;

  CustomEmployeePage ({dynamic data}) {
    this.data = data;
  }

  @override
  State <StatefulWidget> createState() {
    return _CustomEmployeePageState(data: this.data);
  }
}

class _CustomEmployeePageState extends State<CustomEmployeePage> {
  dynamic data;
  
  _CustomEmployeePageState ({dynamic data}) {
    this.data = data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BackgroundColor,
      body: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            // backgroundColor: AppBarBackgroundColor,
            title: Text('กำหนดเอง'),
            bottom: TabBar(
              tabs: [
                Tab(text: 'เพิ่มสินค้า', icon: Icon(Icons.scatter_plot)),
                Tab(text: 'ชื้อสินค้าสำเร็จรูป', icon: Icon(Icons.spa)),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              ProductTab(data: data),
              CompleteProductTab(data: this.data),
            ],
          ),
        ),
      ),
    );
  }
}





