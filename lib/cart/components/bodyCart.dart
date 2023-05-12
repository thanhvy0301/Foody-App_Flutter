import 'package:flutter/material.dart';
import 'package:test_app/cart/components/checkoutcart.dart';
import 'package:test_app/model/carts.dart';
import 'package:test_app/model/products.dart';

class BodyCart extends StatefulWidget {
  //const BodyCart({super.key});  
  late Products? product;
  BodyCart({super.key});
  @override
 _BodyCartState createState() => _BodyCartState();
}

class _BodyCartState extends State<BodyCart> {

  List<Products>? cattails = Cart().getCart();
  double sum=0.0;

  @override
  void initState() {
    super.initState();
    for (var product in cattails!) {
      sum += product.price;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          _buildListView(),
          CheckOutCart(sum: sum),
        ],
      ),
    );
  }

  Widget _buildListView() {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: cattails?.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              GestureDetector(
                child: CartItem(
                  product: cattails![index],
                ),
                onTap: () {
                  setState(() {
                    cattails?.removeAt(index);
                    sum = 0.0;
                    for (var product in cattails!) {
                      sum += product.price;
                    }
                  });
                },
              ),
              //const Divider(),
            ],
          );
        },
      ),
    );
  }
}
// ignore: must_be_immutable
class CartItem extends StatefulWidget {
  Products product;

  CartItem({super.key, required this.product});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          SizedBox(
            width: 100.0,
            height: 100.0,
            child: Image(
              image: AssetImage(widget.product.image),
            ),
          ),
          Expanded(
            child: Text(widget.product.title),
          ),
          Expanded(
            child: Text(widget.product.price.toString()),
          ),
          const Icon(Icons.delete_outline),
        ],
      ),
    );
  }
}
