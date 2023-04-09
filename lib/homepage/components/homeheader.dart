import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:test_app/cart/components/bodyCart.dart';
import 'package:test_app/homepage/components/fragments/search.dart';
import 'package:test_app/model/carts.dart';
import 'package:test_app/model/products.dart';
import 'package:test_app/signUp/signUp.dart';
//import 'package:test_app/model/products.dart';

import '../../cart/cartpage.dart';
//import 'cart/cartpage.dart';

class HomeHeader extends StatelessWidget {
  late Cart cart;
  var custext = Text("Food App");
  get cartItem => null;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text("Food App"),
        _SearchAndCart(context)
      ],
    );
  }

  Widget _SearchAndCart(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _SearchBar(context),
        _Cart(context),
      ],
      //
    );
  }

  Widget _SearchBar(context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, SearchBar.routeName);
      },
      child: Container(
          height: 40,
          width: 40,
          padding: const EdgeInsets.all(10),
          child: const Icon(Icons.search)),
    );
  }

  Widget _Cart(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, CartPage.routeName);
      },
      child: Container(
          height: 40,
          width: 40,
          padding: const EdgeInsets.all(10),
          child: const Icon(Icons.shopping_cart_outlined)),
    );
  }
}
