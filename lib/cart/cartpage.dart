import 'package:flutter/material.dart';
import 'package:test_app/cart/components/bodyCart.dart';
import 'package:test_app/detail/bodyDetail.dart';
import 'package:test_app/model/carts.dart';
class CartPage extends StatelessWidget {  
  const CartPage({Key? key}) : super(key: key);
  static String routeName ="/carts";  
  //final Cart cartItem ;
  // const CartPage({Key? key, required this.cartItem}) : super(key: key);
  
  get product => null;

  @override
  Widget build(BuildContext context) {   
    //var products;
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text("Details"),
      ),
      body: BodyCart(),
    );
  }
}