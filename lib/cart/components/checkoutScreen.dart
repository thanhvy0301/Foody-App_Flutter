import 'package:flutter/material.dart';
import 'package:test_app/cart/components/OrderSummary.dart';

class CheckoutScreen extends StatelessWidget {
  final double sum;
  static const String routeName = '/checkoutScreen';

  const CheckoutScreen({super.key, required this.sum});
  @override
  Widget build(BuildContext context) {
    //final TextEditingController emailController = TextEditingController();
    final TextEditingController nameController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();
    final TextEditingController addressController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            width: 260,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.amber,
            ),
            margin: const EdgeInsets.only(top: 20),
            height: 35,
            child: const Text(
              "CUSTOMER INFORMATION",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            
          ),
          _buildTextFormField(
            nameController,
            context,
            'Name',
          ),
          _buildTextFormField(phoneController, context, 'Phone'),
          _buildTextFormField(addressController, context, 'Address'),
          Container(
            alignment: Alignment.center,
            width: 260,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.amber,
            ),
            margin: const EdgeInsets.only(top: 30),
            height: 35,
            child: const Text(
              "CUSTOMER INFORMATION",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          OrderSummary(sum: sum),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                  height: 85,
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      "Total: $sum \$",
                      style: const TextStyle(fontSize: 18),
                    ),
                  )),
              Container(
                alignment: Alignment.center,
                height: 50,
                width: 150,
                decoration: BoxDecoration(
                    color: Colors.amberAccent,
                    borderRadius: BorderRadius.circular(50)),
                child: const Text(
                  "Confirm",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Padding _buildTextFormField(
    TextEditingController controller,
    BuildContext context,
    String labelText,
  ) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, top: 23, right: 20),
      child: Row(
        children: [
          SizedBox(
              width: 65,
              height: 25,
              child: Text(
                labelText,
                style: (Theme.of(context).textTheme.labelLarge),
              )),
          Expanded(
              child: TextField(
            controller: controller,
            decoration: const InputDecoration(
              isDense: true,
            ),
          ))
        ],
      ),
    );
  }
}
