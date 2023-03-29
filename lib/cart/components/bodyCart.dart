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
      color: const Color(0xfff5f5f5),
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          SizedBox(
            width: 100.0,
            height: 100.0,
            child: Image(
              image: AssetImage(product.image),
            ),
          ),
          Expanded(
            child: Text(product.title),
          ),
          Expanded(
            child: Text(product.price.toString()),
          ),
          const Icon(Icons.delete_outline),
        ],
      ),
    );
  }
}
