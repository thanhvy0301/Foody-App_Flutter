import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Products {
  final int id ;
  final String title;
  final String description;
  final String image;
  final double price;
  const Products({
     required this.id,   
     required this.title,  
     required this.description,
     required this.image,  
     required this.price
  }); 
}
const allProducts = [
           Products(
      id: 1,
      title: "Bạc xỉu đá",
      description:
          "Người Việt Nam uống cà phê như một văn hóa. Một ly cà phê truyền thống đậm chất Việt Nam sẽ luôn luôn sẵn sàng cho bạn tại Circle K vào bất cứ lúc nào trong ngày."
          "Hệ thống Circle K phục vụ 2 loại: Cà Phê Đen & Cà Phê Sữa - nóng và đá. Bạn có thể uống tại chỗ hoặc mang đi.",
      image: "assets/foods/CircleK/bacxiuCircleK.jpg",
      price: 18.0),
  Products(
      id: 2,
      title: "Cà phê đen đá",
      description:
          "Người Việt Nam uống cà phê như một văn hóa. Một ly cà phê truyền thống đậm chất Việt Nam sẽ luôn luôn sẵn sàng cho bạn tại Circle K vào bất cứ lúc nào trong ngày"
          ". Hệ thống Circle K phục vụ các loại cà phê: Cà Phê Đen, Cà Phê Sữa (nóng và đá) và Sữa Tươi Cà Phê. Bạn có thể uống tại chỗ hoặc mang đi.(Chỉ phục vụ tại một số cửa hàng)",
      image: "assets/foods/CircleK/dendaCircleK.png",
      price: 10.0),
  Products(
      id: 3,
      title: "Phin sữa tươi",
      description:
          "Người Việt Nam uống cà phê như một văn hóa. Một ly cà phê truyền thống đậm chất Việt Nam sẽ luôn luôn sẵn sàng cho bạn tại Circle K vào bất cứ lúc nào trong ngày"
          ". Hệ thống Circle K phục vụ các loại cà phê: Cà Phê Đen, Cà Phê Sữa (nóng và đá) và Sữa Tươi Cà Phê. Bạn có thể uống tại chỗ hoặc mang đi.(Chỉ phục vụ tại một số cửa hàng)",
      image: "assets/foods/CircleK/phinsuatuoiCircleK.png",
      price: 10.0),
  Products(
      id: 4,
      title: "Trà sữa Thái (Xanh)",
      description:
          "Trà Sữa Thái là một trong những thức uống được giới trẻ ưa chuộng. Với Trà Sữa Thái Xanh hay Đỏ, bạn có thể tận hưởng được hương vị tươi mát, đậm chất ngọt ngào đặc trưng của trà sữa."
          "Hơn thế nữa, sự kết hợp giữa Trà Sữa Thái với Kem Bồng Bềnh chắc chắn là lựa chọn độc đáo chỉ có tại Circle K.(Chỉ phục vụ tại một số cửa hàng)",
      image: "assets/foods/CircleK/thaixanhCircleK.png",
      price: 10.0),
  Products(
      id: 5,
      title: "Trà sữa Thái (Đỏ)",
      description:
          "Trà Sữa Thái là một trong những thức uống được giới trẻ ưa chuộng. Với Trà Sữa Thái Xanh hay Đỏ, bạn có thể tận hưởng được hương vị tươi mát, đậm chất ngọt ngào đặc trưng của trà sữa"
          ". Hơn thế nữa, sự kết hợp giữa Trà Sữa Thái với Kem Bồng Bềnh chắc chắn là lựa chọn độc đáo chỉ có tại Circle K."
          "(Chỉ phục vụ tại một số cửa hàng)",
      image: "assets/foods/CircleK/thaidoCircleK.png",
      price: 10.0),
  Products(
      id: 6,
      title: "Trà đào",
      description:
          "Trà Đào được pha chế ngay tại cửa hàng với hương vị thơm ngon, mát lạnh. Không chỉ vậy, ly trà thêm phần đậm đà hơn với lát đào giòn ngọt được thêm vào."
          "(Chỉ phục vụ tại một số cửa hàng)",
      image: "assets/foods/CircleK/tradaoCircleK.png",
      price: 10.0),
  ];  
  // static List<Products> init(){
  //   List<Products> data = [
  //     Products(
  //         id: 1,
  //         title: "Bread",
  //         description: "Banh mi",
  //         image: "assets/foods/ic_banh_mi.png",
  //         price: 8.0),
  //     Products(
  //         id: 2,
  //         title: "Bread",
  //         description: "Banh mi",
  //         image: "assets/foods/ic_banh_mi.png",
  //         price: 10.0),
  //     Products(
  //         id: 3,
  //         title: "Coffee",
  //         description: "Ca phe bat on",
  //         image: "assets/foods/ic_black_coffee.png",
  //         price: 10.0)
  //   ];
  //   return data;
  // }


