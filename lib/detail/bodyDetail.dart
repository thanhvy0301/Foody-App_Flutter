import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_app/model/products.dart';

import 'package:test_app/detail/addtocart.dart';

class BodyDetail extends StatelessWidget {
  //const Body({super.key});  
  late Products product;
  BodyDetail({super.key, required this.product});

  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 200.0,
            child: Image.asset(product.image),
          ),
          const SizedBox(height: 20,),
          Expanded(
            child: Text("Description: ${product.description}"), flex: 1,),
           AddProductToCart(product: product),       
      ]),
    );
  }
}

