import 'package:flutter/material.dart';
import 'package:test_app/homepage/components/fragments/home_fragment_product.dart';
import 'package:test_app/model/products.dart';
class FavoriteDetail extends StatelessWidget {
  //FavoriteDetail({Key? key}) : super(key: key);
  List<Products> products;
  FavoriteDetail(this.products);
  

  @override
  Widget build(BuildContext context){
    print(products.length.toString());
    return Expanded(
      child: Container(
        child: ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index){
            return ProductItemList(product: products[index],);
        }),
      )
    );
  }
}

class ProductItemList  extends StatelessWidget{
  Products product;
  ProductItemList({super.key, required this.product});

  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Row(
          children: [
            SizedBox(
              width: 100,
              height: 100,
              child: Image.asset(product.image, fit: BoxFit.fill,),
            ),
            const SizedBox(width: 5,),
            Expanded(
              child: SizedBox(
                height: 100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(product.title),
                  //   Expanded(child: Text(product.price as String, maxLines: 5, overflow: TextOverflow.ellipsis,)
                  // )
                ],
              )
            )
            )
          ],
        ),
      ),
    );
  }
}
