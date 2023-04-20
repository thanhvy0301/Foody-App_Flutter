import 'package:flutter/material.dart';
import 'package:test_app/detail/bodyDetail.dart';
import 'package:test_app/homepage/components/fragments/home_fragment_product.dart';
import 'package:test_app/model/products.dart';
class ProductPage extends StatelessWidget { 
  static String routeName = "/details";
  final Products productItem ;
  const ProductPage({Key? key, required this.productItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange.shade400,
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back_ios),          
        ),
        title: const Text("Details"),
      ),
      body: BodyDetail(product: productItem),
    );
  }
}
