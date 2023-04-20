import 'package:flutter/material.dart';
import 'package:test_app/model/categories.dart';

class CategoriesStore extends StatelessWidget {
  const CategoriesStore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categories = Categories.init();
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.all(10),
                  child:  Expanded(
                    child: Text(
                      'Popular Brands',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange.shade400),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                //doi lai thanh length
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return CategoriesItem(category: categories[index],);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CategoriesItem extends StatelessWidget {
  Categories category;
  //List<Products> products = star;
  // CategoriesItem({super.key, required this.category});
  CategoriesItem({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: 150,
        height: 150,
        padding: const EdgeInsets.all(5),
        child: (Image.asset(category.image)),
      ),
      onTap: () {
        
      },
    );
  }
}
