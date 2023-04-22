import 'package:flutter/material.dart';
import 'package:test_app/cart/components/checkoutScreen.dart';

class CheckOutCart extends StatelessWidget {
  final double sum;
  const CheckOutCart({super.key, required this.sum});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [_buildSum(), _buildCheckOut(context)],
    );
  }
  Widget _buildSum() {
    return SizedBox(
        height: 85,
        child: Container(
          alignment: Alignment.center,
          child: Text(
            "Total: \$ $sum ",
            style: const TextStyle(fontSize: 18),
          ),
        ));
  }
  Widget _buildCheckOut(context) {
    return GestureDetector(
      child: Container(
        alignment: Alignment.center,
        height: 50,
        width: 150,
        decoration: BoxDecoration(
            color: Colors.orange, borderRadius: BorderRadius.circular(50)),
        child: const Text(
          "Confirm",
          style: TextStyle(
              fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      onTap: () {
        //Navigator.pushNamed(context, CheckoutScreen.routeName, arguments: [sum]);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CheckoutScreen(
                      sum: sum,
                    )));
      },
    );
  }
}
