import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Products {
  final int id ;
  final String title;
  final String description;
  final String image;
  final double price;
  // bool isFavorite;
   const Products({
     required this.id,   
     required this.title,  
     required this.description,
     required this.image,  
     required this.price,
    //  this.isFavorite = false,
  });


//  void toggleFavorite() {
//     isFavorite = !isFavorite;
//   }
}

 const allProducts = [
           Products(
      id: 1,
      title: "Trà thạch vải",
      description:
          "Một sự kết hợp thú vị giữa trà đen, những quả vải thơm ngon và thạch giòn khó cưỡng, mang đến thức uống tuyệt hảo!",
      image: "assets/foods/Highland/thachVai.jpg",
      price: 49.000),
  Products(
      id: 2,
      title: "Trà mơ sơ ri",
      description:
        "Một biến tấu đột phá giữa trái mơ và sơri Việt Nam cùng hạt chia dinh dưỡng, những viên thạch ngọc trai giòn giòn tạo nên hương vị ngọt ngào nhẹ nhàng cho bạn một buổi thưởng thức trà vui vẻ.",
      image: "assets/foods/Highland/traSori.jpg",
      price: 49.000),
  Products(
      id: 3,
      title: "Trà xanh đậu đỏ",
      description:
          "Trà xanh đậu đỏ được làm từ những lá trà xanh tươi ngon kết hợp với đậu đỏ đỏ tươi, cho hương vị thanh mát của trà xanh và vị ngọt đậm đà của đậu đỏ \n Đây là một lựa chọn tuyệt vời cho những người muốn thưởng thức một thức uống mới mẻ và có lợi cho sức khỏe",
      image: "assets/foods/Highland/traXanhdaudo.jpg",
      price: 49.000),
  Products(
      id: 4,
      title: "Cookie and Cream",
      description:
          "Trà Sữa Thái là một trong những thức uống được giới trẻ ưa chuộng. Với Trà Sữa Thái Xanh hay Đỏ, bạn có thể tận hưởng được hương vị tươi mát, đậm chất ngọt ngào đặc trưng của trà sữa."
          "Hơn thế nữa, sự kết hợp giữa Trà Sữa Thái với Kem Bồng Bềnh chắc chắn là lựa chọn độc đáo chỉ có tại Circle K.(Chỉ phục vụ tại một số cửa hàng)",
      image: "assets/foods/Highland/cookieCream.jpg",
      price: 59.000),
  Products(
      id: 5,
      title: "Freeze Chocolate",
      description:
          "Trà Sữa Thái là một trong những thức uống được giới trẻ ưa chuộng. Với Trà Sữa Thái Xanh hay Đỏ, bạn có thể tận hưởng được hương vị tươi mát, đậm chất ngọt ngào đặc trưng của trà sữa"
          ". Hơn thế nữa, sự kết hợp giữa Trà Sữa Thái với Kem Bồng Bềnh chắc chắn là lựa chọn độc đáo chỉ có tại Circle K."
          "(Chỉ phục vụ tại một số cửa hàng)",
      image: "assets/foods/Highland/freezeChoco.jpg",
      price: 59.000),
  Products(
      id: 6,
      title: "Phindi kem sữa ",
      description:
          "People of all ages love this slush, and it's always just as refreshing as the first time you tasted it. What’s this summer’s original flavour? Drop by and see when the weather gets warm.",
      image: "assets/foods/Highland/phindiKemsua.jpg",
      price: 49.000),
  ];


