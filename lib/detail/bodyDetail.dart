import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_app/model/products.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_app/detail/addtocart.dart';

class BodyDetail extends StatelessWidget {
  late Products product;
  BodyDetail({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 25, right: 25, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, 
        children: [        
        Container(          
          alignment: Alignment.center,
          child: AspectRatio(
            aspectRatio: 1 / 1,
            child: Image.asset(product.image),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(bottom: 15),
          child: Row(
            children: [
              const Text(
                "Price: ",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                "${product.price}",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.red.shade800),
              )
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.only(bottom: 10),
          child: _size(),
        ),
        Expanded(
            child: Text(
          "Description:\n${product.description})",
          style: GoogleFonts.openSans(fontSize: 16.0),
          textAlign: TextAlign.justify,
        )),
        AddProductToCart(product: product),
      ]),
    );
  }

  Widget _size() {
    return SizedBox(
      width: 100,      
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 25,
            height: 25,
            decoration: BoxDecoration(
                //color: Colors.amberAccent,
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.orange.shade400,
                )),
            alignment: Alignment.center,
            child: const Text(
              "S",
              textAlign: TextAlign.center,
            ),
          ),
           Container(
            width: 25,
            height: 25,
            decoration: BoxDecoration(
                //color: Colors.amberAccent,
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.orange.shade400,
                )),
            alignment: Alignment.center,
            child: const Text(
              "M",
              textAlign: TextAlign.center,
            ),
          ),
           Container(
            width: 25,
            height: 25,
            decoration: BoxDecoration(
                //color: Colors.amberAccent,
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.orange.shade400,
                )),
            alignment: Alignment.center,
            child: const Text(
              "L",
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
