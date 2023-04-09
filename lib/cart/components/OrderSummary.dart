import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:test_app/model/carts.dart';
import 'package:test_app/model/products.dart';

class OrderSummary extends StatelessWidget {
  final double sum;
  const OrderSummary({super.key, required this.sum});
  //const OrderSummary({super.key});
  @override
  Widget build(BuildContext context) {
    List<Products>? cattails = Cart().getCart();
    double sum = 0.0;
    for (var product in cattails) {
      sum += product.price;
    }
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: cattails.length,
        itemBuilder: (context, index) {
          return Column(
            children: <Widget>[
              Container(
                height: 100,
                margin: EdgeInsets.only(top: 5),
                padding: const EdgeInsets.only(top: 10),
                child: CartItem(
                  product: cattails[index],
                ),
              ),
              const Divider(),
            ],
          );
        },
      ),
    );
  }
}

class CartItem extends StatelessWidget {
  Products product;

  CartItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
        //color: const Color(0xfff5f5f5),
        //padding: const EdgeInsets.all(16.0),
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    child: Image(
                      image: AssetImage(product.image),
                      width: 70,
                    ),
                  ),
                  Container(
                    width: 250,
                    padding: const EdgeInsets.only(bottom: 30.0),
                    child: Text(
                      product.title,
                      style: const TextStyle(fontSize: 18.0),
                    ),
                  ),
                  Container(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(product.price.toString(),
                          style: const TextStyle(fontSize: 13.0, fontWeight: FontWeight.bold))),
                  // const Icon(Icons.delete_outline),
                ],
              ),             
            ],
            
          ),
        ]);
  }
}
