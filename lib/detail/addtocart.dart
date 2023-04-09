import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:test_app/model/carts.dart';
import 'package:test_app/model/products.dart';

class AddProductToCart extends StatefulWidget {
  //static String routeName = "/addtocart";
  Products product;
  //static String routeName = "/details";
  List<Products> products =allProducts;
  AddProductToCart({super.key, required this.product});

  @override
  State<AddProductToCart> createState() => _AddProductToCartState();
}
class _AddProductToCartState extends State<AddProductToCart> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,      
      children: [
        SizedBox(
          height: 70.0,          
          width: 70,
          child: _buildAddToCard(),
        ),
      ],
    );
  }
  Widget _buildAddToCard() {
    return ElevatedButton(
    
      style: ButtonStyle(        
        backgroundColor: MaterialStateProperty.all(Colors.blueAccent),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
        ),
      ),
      onPressed: () {
        Cart cart = Cart();
        cart.addProductToCart(widget.product);
        // ignore: avoid_print
        print(cart.getCart().length.toString());
          Fluttertoast.showToast(
          msg: 'Add to cart',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      },
      // child: Container(

      // ),
      child: Container(
        alignment: Alignment.center,
        child: const Icon(Icons.shopping_cart_outlined)),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return SizedBox(
  //     height: 50,
  //     width: MediaQuery.of(context).size.width,
  //     child: ElevatedButton(
  //       onPressed: () {
  //         Cart cart = Cart();
  //         cart.addProductToCart(widget.product);
  //         print(cart.getCart().length.toString());
  //         //print(cart.getCart() != null ? cart : 'alternate');
  //         Fluttertoast.showToast(
  //             msg: "Add to cart",
  //             toastLength: Toast.LENGTH_SHORT,
  //             gravity: ToastGravity.BOTTOM,
  //             timeInSecForIosWeb: 1,
  //             backgroundColor: Colors.red,
  //             textColor: Colors.white,
  //             fontSize: 16.0);
  //       },
  //       style: ElevatedButton.styleFrom(
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(10),
  //         ),
  //         backgroundColor: Color.fromARGB(255, 43, 77, 189),
  //       ),
  //       child: const Text(
  //         "Add to cart",
  //         style: TextStyle(
  //             fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
  //       ),
  //     ),
  //   );
  // }
}
