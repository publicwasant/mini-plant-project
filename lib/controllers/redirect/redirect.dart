import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:mp_v1_0/init.dart';
import 'package:mp_v1_0/views/pages/basket/basket-page.dart';
import 'package:mp_v1_0/views/pages/custom/custom-page.dart';
import 'package:mp_v1_0/views/pages/custom/custom-employee-page.dart';
import 'package:mp_v1_0/views/pages/custom/custom-customer-page.dart';

import 'package:mp_v1_0/views/pages/get-started/get-started-page.dart';
import 'package:mp_v1_0/views/pages/get-started/login-page.dart';
import 'package:mp_v1_0/views/pages/get-started/register-page.dart';

import 'package:mp_v1_0/views/pages/history/history-page.dart';
import 'package:mp_v1_0/views/pages/home/home-page.dart';
import 'package:mp_v1_0/views/pages/main-menu/main-menu-page.dart';

import 'package:mp_v1_0/views/pages/product/product.dart';
import 'package:mp_v1_0/views/pages/product/product-detail.dart';
// import 'package:mp_v1_0/views/pages/product/product-add.dart';

import 'package:mp_v1_0/views/pages/profile/profile-page.dart';
import 'package:mp_v1_0/views/pages/profile/profile-edit-page.dart';
import 'package:mp_v1_0/views/pages/settings/settings-page.dart';
import 'package:mp_v1_0/views/pages/shop/shop-page.dart';

Map<String, dynamic> Routes ({dynamic data}) {
  data = (data != null) ? data : {};

  return {
    '/init' : InitApp(data: data),
    '/basket' : BasketPage(data: data),
    '/custom' : CustomPage(data: data),
    '/custom/employee' : CustomEmployeePage(data: data),
    '/custom/customer' : CustomCustomerPage(data: data),
    '/get-started' : GetStartedPage(data: data),
    '/get-started/login' : LoginPage(data: data),
    '/get-started/register' : RegisterPage(data: data),
    '/history' : HistoryPage(data: data),
    '/home' : HomePage(data: data),
    '/main-menu' : MainMenuPage(data: data),
    '/products' : ProductsPage(data: data),
    '/products/detail' : ProductsDetailPage(data: data),
    '/profile' : ProfilePage(data: data),
    '/profile/edit' : ProfileEditPage(data: data),
    '/settings' : SettingsPage(data: data),
    '/shop' : ShopPage(data: data)
  };
}

Function Back (BuildContext context, {Function then}) {
  Navigator.pop(context);

  if (then != null) {
    then();
  }
}

Function Replace (BuildContext context, dynamic material, {Function then}) {
  if (material != null) {
    Navigator.pushReplacement(
      context, 
      MaterialPageRoute(
        builder: (BuildContext context) => material
      )
    );

    if (then != null) {
      then();
    }
  } else {
    print('[ERROR] Redirect not found: ' + material.toString());
  }
}

Function Redirect (BuildContext context, String page, {Function then, dynamic data}) {
  dynamic target = Routes(data: data)[page];

  if (then != null) {
    then();
  }

  if (target != null) {
    Navigator.push(
      context, 
      MaterialPageRoute(
        builder: (BuildContext context) => target
      )
    );
  } else {
    print('[ERROR] Redirect not found: ' + page);
  }
}

Function ClearPage (BuildContext context, String page, {Function then, dynamic data}) {
  dynamic target = Routes(data: data)[page];

  if (then != null) {
    then();
  }

  if (target != null) {
    Navigator.pushAndRemoveUntil(
      context, 
      MaterialPageRoute(
        builder: (BuildContext context) => target
      ),
      (route) => false,
    );
  } else {
    print('[ERROR] Redirect not found: ' + page);
  }
}

Widget Toggle (String page, {Function then, dynamic data}) {
  dynamic target = Routes(data: data)[page];

  if (then != null) {
    then();
  }

  return (target != null) ? target : SizedBox();
}