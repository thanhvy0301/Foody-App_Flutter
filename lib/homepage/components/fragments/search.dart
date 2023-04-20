import 'package:flutter/material.dart';
import 'package:test_app/detail/productpage.dart';
import 'package:test_app/model/products.dart';

class SearchBar extends StatefulWidget {
  SearchBar({Key? key}) : super(key: key);
  static String routeName = "/search_bar";
  @override
  State<SearchBar> createState() => _SearchBar();
}

class _SearchBar extends State<SearchBar> {
  //final controller = TextEditingController();
  //final Products product;
  List<Products> products = allProducts;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text("Search product"),
          backgroundColor: Colors.orange.shade400,
        ),
        body: Column(
          children: <Widget>[
            Container(
              height: 50,
              margin: const EdgeInsets.all(16.0),
              child: TextField(
              
                //controller: controller,
                decoration: InputDecoration(

                    //prefix: const Icon(Icons.search),
                    
                    hintText: "eg: Bread",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide:
                             BorderSide(color: Colors.orange.shade400))),
                onChanged: searchProduct,
              ),
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return ListTile(
                          leading: Image.asset(
                            product.image,
                            fit: BoxFit.cover,
                            height: 50,
                            width: 50,
                          ),
                          title: Text(product.title),
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) =>
                                      ProductPage(productItem: product)))));
                    }))
          ],
        ),
      );

  void searchProduct(String query) {
    final suggestions = allProducts.where((product) {
      final productTitle = product.title.toLowerCase();
      final input = query.toLowerCase();
      return productTitle.contains(input);
    }).toList();
    setState(() => products = suggestions);
  }
}