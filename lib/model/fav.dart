import 'products.dart';
class Favorite{
  static List<Products> fav=[];
  void addProductToCart(Products product){
    fav.add(product);
  }
  

  List<Products> getCart(){
    return fav;
  }

  toJson() {}
}