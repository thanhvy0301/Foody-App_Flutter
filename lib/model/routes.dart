import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:quiver/check.dart';
import 'package:test_app/cart/cartpage.dart';
import 'package:test_app/cart/components/checkoutcart.dart';

import '../detail/productpage.dart';
import '../homepage/homepage.dart';
import '../signIn/components/plashPage.dart';
import '../signIn/signInPage.dart';
import '../signUp/signUp.dart';


final Map<String, WidgetBuilder> routes={
  plashPage.routeName:(context) =>plashPage(),
  signInPage.routeName:(context) =>signInPage(),
  signUpPage.routeName:(context) =>signUpPage(),
  HomePage.routeName:(context) =>HomePage(),
  //ProductPage.routeName:(context) => ProductPage(),
  //CartPage.routeName:(context) => CartPage(),
  //  CheckOutCart.routeName:(context) => checkNotNull(),
};