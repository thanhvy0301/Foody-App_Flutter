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
          title: "Bread",
          description: "Banh mi",
          image: "assets/foods/ic_banh_mi.png",
          price: 8.0),
      Products(
          id: 2,
          title: "Bread",
          description: "Banh mi",
          image: "assets/foods/ic_banh_mi.png",
          price: 10.0),
      Products(
          id: 3,
          title: "Coffee",
          description: "Ca phe bat on",
          image: "assets/foods/ic_black_coffee.png",
          price: 10.0)
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


