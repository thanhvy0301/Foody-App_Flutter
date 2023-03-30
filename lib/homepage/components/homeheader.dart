import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:test_app/cart/components/bodyCart.dart';
import 'package:test_app/homepage/components/fragments/search.dart';
import 'package:test_app/model/carts.dart';
import 'package:test_app/model/products.dart';
import 'package:test_app/signUp/signUp.dart';
//import 'package:test_app/model/products.dart';

import '../../cart/cartpage.dart';
//import 'cart/cartpage.dart';

class HomeHeader extends StatelessWidget {
  late Cart cart;
  var custext = Text("Food App");
  get cartItem => null;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text("Food App"),
        _SearchAndCart(context)
      ],
    );
  }

  Widget _SearchAndCart(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _SearchBar(context),
        _Cart(context),
      ],
      //
    );
  }

  Widget _SearchBar(context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, SearchBar.routeName);
      },
      child: Container(
          height: 40,
          width: 40,
          padding: const EdgeInsets.all(10),
          child: const Icon(Icons.search)),
    );
  }

  Widget _Cart(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, CartPage.routeName);
      },
      child: Container(
          height: 40,
          width: 40,
          padding: const EdgeInsets.all(10),
          child: const Icon(Icons.shopping_cart_outlined)),
    );
  }
}
// TextFormField conformTextFormField(context) {
//   return TextFormField(
//     // controller: conform,
//     // obscureText: !_passwordVisible,
//     //keyboardType: TextInputType.number,
//     decoration: const InputDecoration(
//         border: const OutlineInputBorder(),
//         hintText: "Re-enter your password",
//         floatingLabelBehavior: FloatingLabelBehavior.always,

//     ),
//   );
// }
// class MySearchDelegate extends SearchDelegate {
//   Products? product;
//   @override
//   List<Widget>? buildActions(BuildContext context) {
//     // TODO: implement buildActions
//     return [
//       IconButton(
//           onPressed: () {
//             query = '';
//           },
//           icon: const Icon(Icons.clear))
//     ];
//     throw UnimplementedError();
//   }

//   @override
//   Widget? buildLeading(BuildContext context) {
//     // TODO: implement buildLeading
//     return IconButton(
//         onPressed: () {
//           close(context, null);
//         },
//         icon: const Icon(Icons.arrow_back_ios));
//     throw UnimplementedError();
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//     // TODO: implement buildResults

//     List<String> product = [];
//     for (var item in product) {
//       if (item.toLowerCase().contains(query.toLowerCase())) {
//         product.add(item);
//       }
//     }
//     return ListView.builder(
//       itemBuilder: (context, index) {
//         var result = product[index];
//         return ListTile(
//           title: Text(result),
//         );
//       },
//       itemCount: product.length,
//     );
//     throw UnimplementedError();
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     // TODO: implement buildSuggestions

//     List<String> product = [];
//     for (var item in product) {
//       if (item.toLowerCase().contains(query.toLowerCase())) {
//         product.add(item);
//       }
//     }
//     return ListView.builder(
//       itemBuilder: (context, index) {
//         var result = product[index];
//         return ListTile(
//           title: Text(result),
//         );
//       },
//       itemCount: product.length,
//     );
//     //throw UnimplementedError();
//   }
// }
