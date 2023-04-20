import 'package:flutter/material.dart';
import 'package:test_app/detail/productpage.dart';
import 'package:test_app/model/products.dart';
import 'package:test_app/model/utilities.dart';

class ProductPopular extends StatelessWidget {
  ProductPopular({Key? key}) : super(key: key);
  //final products = Products.init();
  List<Products> products = allProducts;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(children: [
        Row(
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              child:  Expanded(
                  child: Text(
                'Popular Products ',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange.shade400),
              )),
            ),
          ],
        ),
        GridView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            primary: false,
            itemCount: products.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 0.6,
            ),
            itemBuilder: (context, index) {
              return ProductItem(
                product: products[index],
              );
            }),
        Container(
          margin: const EdgeInsets.only(top: 20),
          child: SizedBox(
            width: 80,
            height: 30,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.amber, borderRadius: BorderRadius.circular(50)),
              alignment: Alignment.center,
              child: const SizedBox(
                //height: 100,
                child: Text(
                  'See more',
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        )
      ]),
    );
    // return const Placeholder();
  }
}

class ProductItem extends StatelessWidget {
  Products product;
  ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Utilities.data.add(product);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductPage(productItem: product)));
      },
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color:
                      const Color.fromARGB(255, 192, 192, 192).withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 3,
                  offset: const Offset(0, 3),
                ),
              ], borderRadius: BorderRadius.circular(20)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  product.image,
                ),
              )),
          Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 20),
                width: 120,
                child: Text(
                  product.title,
                  style: const TextStyle(color: Color.fromARGB(255, 70, 70, 70), fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 5),
                child: Text(product.price.toString(),
                    style: TextStyle(
                        fontSize: 16,
                        fontStyle: FontStyle.italic,
                        color: Colors.red.shade900,
                        fontWeight: FontWeight.bold)),
              )
            ],
          )
        ],
      ),
    );
  }
}
