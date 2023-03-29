import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:test_app/detail/productpage.dart';
import 'package:test_app/model/products.dart';
import 'package:test_app/model/utilities.dart';
import 'package:test_app/detail/addtocart.dart';
class ProductPopular extends StatelessWidget {
   ProductPopular({Key? key}) : super(key: key);
   //final products = Products.init();
   List<Products> products = allProducts;

  @override
  Widget build(BuildContext context) {
    var productsAPI = Utilities().getProducts();
    return Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              children: const  [
                 Expanded(child: Text('Popular products ', style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent),)),
                Text('See more', style: TextStyle(
                  fontSize: 16,
                  color: Colors.blue
                ),)
              ],
            ),
            const SizedBox(height: 10,),
            Container(
              child: GridView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  primary: false,
                  itemCount: products.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 0.7,
                    ),

                  itemBuilder: (context, index){
                    return ProductItem(
                      product: products[index],
                    );}
            ),)
          ]
        ),
    );
    // return const Placeholder();
  }
}

class ProductItem extends StatelessWidget {
  Products product;
  ProductItem({required this.product});

  @override
  Widget build(BuildContext context) {
    if (product.image != null) {}
    return GestureDetector(
      onTap: (){
        Utilities.data.add(product);
        Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductPage(productItem: product)));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(product.image, fit: BoxFit.fill,),
          Row(
            children: [
              Expanded(child: Text(product.title)),
              Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(2),
                    color: Color.fromARGB(255, 255, 255, 255)
                ),
                child: Text(product.price.toString(),
                  style: const TextStyle(
                      color: Color.fromARGB(255, 177, 8, 8),
                      fontWeight: FontWeight.bold
                  ),),
              )
            ],
          )
        ],
      ),
    );
  }

  ProductDetailsArguments({required Products product}) {}
}

