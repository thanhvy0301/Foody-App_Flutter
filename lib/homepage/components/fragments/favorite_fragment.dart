import 'package:flutter/material.dart';
import 'package:test_app/detail/productpage.dart';
import 'package:test_app/model/products.dart';
import 'package:test_app/model/utilities.dart';

class FavoriteDetail extends StatelessWidget {
  List<Products> products;
  FavoriteDetail(this.products);

  @override
  Widget build(BuildContext context){
    print(products.length.toString());
    return Expanded(
      child: Container(
        child: ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index){
            return ProductItemList(product: products[index],);
        }),
      )
    );
  }
}

class ProductItemList extends StatelessWidget {
  Products product;
  ProductItemList({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 100,
            height: 100,
            child: Image.asset(
              product.image,
              fit: BoxFit.fill,
            ),
          ),
          GestureDetector(
            onTap: () {
              Utilities.data.add(product);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProductPage(productItem: product)));
            },
            child: Container(
              padding: const EdgeInsets.only(top: 10, bottom: 30, left: 60),
              height: 110,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(product.title,
                      textAlign: TextAlign.end,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                  Text(
                    product.price.toString(),
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
