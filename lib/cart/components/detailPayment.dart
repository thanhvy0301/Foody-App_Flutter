import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:test_app/cart/components/confirmOrder.dart';
import 'package:test_app/model/products.dart';

import '../../model/carts.dart';
import 'package:test_app/user/user.dart';

class detailPayment extends StatefulWidget {
  static String routeName = "/detailPayment";
  // late User user;
  late Products? product;
  detailPayment({super.key});
  @override
  _detailPayment createState() => _detailPayment();
}

class _detailPayment extends State<detailPayment> {
  List<Products>? cattails = Cart().getCart();
  double sum = 0.0;
  
  //CheckOutCart({super.key, required this.sum});
  @override
  void initState() {
    super.initState();
    for (var product in cattails!) {
      sum += product.price;
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Payment"),
      ),
      body: Column(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _infoCustomer(),
            
            _buildListView(),
            // _orderBtn(context)
          ]),
    );
  }

  
  

  Widget _infoCustomer() {
    return SizedBox(
      child: Column(
        children: const <Widget>  [
          Padding(padding: EdgeInsets.all(16.0)),
          Text("Name: Thanh Vy", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
          Text("Phone: 0123456789", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
          Text("Address: Ho Chi Minh",style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
          //Text('Email: ${widget.}')
        ],
      ),
    );
  }
  Widget _orderBtn(context) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
            width: 190.0,
            height: 50.0,
            decoration: const BoxDecoration(
              color: Colors.green,
              //borderRadius: BorderRadius.circular(8.0),
            ),
            // padding: const EdgeInsets.all(20.0),
            child: Text(
              "Checkout",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14.0,
                  letterSpacing: 1.0),
            ),
            alignment: Alignment.center),
      ),
      onTap: () {
        //Navigator.pushNamed(context, ConfirmOrder.r);
      },
    );
  }

  Widget _buildListView() {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: cattails?.length,
        itemBuilder: (context, index) {
          return Row(
            children: <Widget>[
              Container(
                child: CartItem(
                  product: cattails![index],
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
    return Container(
      //color: const Color(0xfff5f5f5),
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: Image(
              image: AssetImage(product.image),
              width: 100,
            ),
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 30.0),
            child: Text(
              product.title,
              style: const TextStyle(fontSize: 18.0),
            ),
          ),
          Container(

              //padding: EdgeInsets.only(left: 140),
              child: Text(product.price.toString(),
                  style: const TextStyle(fontSize: 13.0))),
          // const Icon(Icons.delete_outline),
        ],
      ),
    );
  }
}
