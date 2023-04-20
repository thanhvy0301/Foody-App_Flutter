import 'package:flutter/material.dart';

class Categories {
  int id;
  String title;
  String image;
  Categories({required this.id, required this.title, required this.image});
  static List<Categories> init(){
    List<Categories> data = [
      Categories(
        id: 1,
        title: "Highland",
        image: "assets/images/ic_highland.jpeg"
      ),
      Categories(
          id: 2,
          title: "Starbucks",
          image: "assets/images/starbucks.png"
      ),
      Categories(
          id: 3,
          title: "Phúc Long",
          image: "assets/images/phuclong.jpg"
      ),
      Categories(
          id: 4,
          title: "Seven Eleven",
          image: "assets/images/ic_seveneleven.png"
      ),
      Categories(
          id: 5,
          title: "VinMart",
          image: "assets/images/ic_vinmart.jpg"
      ),
    ];
    return data;
  }

  where(Function(dynamic element) param0) {}
}
