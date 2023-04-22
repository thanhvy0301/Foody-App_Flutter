import 'package:flutter/material.dart';
import 'package:test_app/cart/components/OrderSummary.dart';
import 'package:firebase_database/firebase_database.dart';

import '../../homepage/homepage.dart';

class CheckoutScreen extends StatelessWidget {
  final double sum;
  static const String routeName = '/checkoutScreen';

  const CheckoutScreen({super.key, required this.sum});

  @override
  Widget build(BuildContext context) {
    //late Cart cartItems;

    //final TextEditingController emailController = TextEditingController();
    final TextEditingController nameController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();
    final TextEditingController addressController = TextEditingController();
    void _clearCart(BuildContext context) {
      nameController.clear();
      phoneController.clear();
      addressController.clear();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
        backgroundColor: Colors.orange.shade400,
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
              color: Colors.orange.shade400,
            ),
            margin: const EdgeInsets.only(top: 20),
            height: 35,
            child: const Text(
              "CUSTOMER INFORMATION",
              style: TextStyle(
                  fontSize: 16,
                  //fontWeight: FontWeight.bold,
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
              color: Colors.orange.shade400,
            ),
            margin: const EdgeInsets.only(top: 30),
            height: 35,
            child: const Text(
              "ORDER INFORMATION",
              style: TextStyle(
                  fontSize: 16,
                  //fontWeight: FontWeight.bold,
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
                      "Total: \$$sum",
                      style: const TextStyle(fontSize: 18),
                    ),
                  )),
              btnConfirm(nameController, phoneController, addressController,
                  _clearCart, context)
            ],
          )
        ],
      ),
    );
  }

  GestureDetector btnConfirm(
      TextEditingController nameController,
      TextEditingController phoneController,
      TextEditingController addressController,
      void clearCart(BuildContext context),
      BuildContext context) {
    return GestureDetector(
      child: Container(
        alignment: Alignment.center,
        height: 50,
        width: 150,
        decoration: BoxDecoration(
            color: Colors.orange.shade400,
            borderRadius: BorderRadius.circular(50)),
        child: const Text(
          "CONFIRM",
          style: TextStyle(
              fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      onTap: () {
        DatabaseReference databaseRef = FirebaseDatabase.instance.ref();
        // Get the order information from the text controllers
        String name = nameController.text;
        String phone = phoneController.text;
        String address = addressController.text;
        String total = sum.toString();
        databaseRef.child('orders').push().set({
          'name': name,
          'phone': phone,
          'address': address,
          'total': total,
        }).then((value) {         
          clearCart(context);
          Navigator.pushNamed(context, HomePage.routeName);
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Success'),
                content: const Text('Your order has been placed.'),
                actions: <Widget>[
                  TextButton(
                    child: const Text('OK'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        });
      },
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
