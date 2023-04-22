import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:test_app/model/carts.dart';
import 'package:test_app/model/products.dart';

// ignore: must_be_immutable
class AddProductToCart extends StatefulWidget {
  Products product;

  AddProductToCart({super.key, required this.product});

  @override
  State<AddProductToCart> createState() => _AddProductToCartState();
}

class _AddProductToCartState extends State<AddProductToCart> {
  bool _isFavorite = false;
  _toggleFavorite() {
    setState(() {
      _isFavorite = !_isFavorite;
      Fluttertoast.showToast(
        msg: 'Add to wishlist',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.SNACKBAR,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.white,
        textColor: const Color.fromARGB(145, 158, 158, 158),
        fontSize: 16.0,
      );
    });
  }

  List<Products> products = allProducts;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      margin: const EdgeInsets.only(left: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: 60.0,
            width: 180,
            child: _buildAddToCard(),
          ),
          SizedBox(
            height: 60,
            width: 60,
            child: _buildAddToFav(),
          )
        ],
      ),
    );
  }

  Widget _buildAddToCard() {
    return Container(
      decoration: BoxDecoration(
          //color: Colors.orange,
          borderRadius: BorderRadius.circular(40)),
      child: SizedBox(
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.orange),
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
              gravity: ToastGravity.SNACKBAR,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.white,
              textColor: Colors.black,
              fontSize: 16.0,
            );
          },
          child: Container(
              alignment: Alignment.center,
              child: const Text(
                "Add to cart",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              )),
        ),
      ),
    );
  }

  Widget _buildAddToFav() {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(40)),
      child: SizedBox(
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.white),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
              ),
            ),
          ),
          onPressed: () {},
          child: IconButton(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(left: 2),
            icon: _isFavorite
                ? const Icon(
                    Icons.favorite,
                    color: Colors.orange,
                  )
                : const Icon(
                    Icons.favorite_border,
                    color: Colors.orange,
                  ),
            onPressed: _toggleFavorite,
          ),
        ),
      ),
    );
  }
}
