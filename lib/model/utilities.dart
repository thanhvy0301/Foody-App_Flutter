import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:quiver/strings.dart';
import 'package:test_app/model/products.dart';

class Utilities {
  String url = 'http://192.168.0.100:3000/api/foods';

  static List<Products> data = [];

  Future<List<Products>> getProducts() async {
    var res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      var content = res.body;
      debugPrint(content.toString());
      var arr = json.decode(content)['food'] as List;

      return arr.map((e) => _fromJson(e)).toList();
    }
    return <Products>[];
  }
  
  static List<Products> favoriteProducts = [];

  Products _fromJson(Map<String, dynamic> item) {
    return Products(
        title: item['title'],
        description: item['description'],
        image: item['image'],
        price: double.parse(item['price']), id: 1);
  }

  static String validateEmail(String value) {
    if (value.isEmpty) {
      return 'Please enter mail';
    }
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(pattern as String);
    if (!regExp.hasMatch(value)) {
      return 'Enter Valid Email';
    } else {
      return 'validateEmailError';
    }
  }

  static String validatePassword(String value) {
    if (value.isEmpty) {
      return 'Please enter password';
    }
    if (value.length < 8) {
      return 'Password should be more than 8 characters';
    } else {
      return 'validatePasswordError';
    }
  }

  static String conformPassword(String value, String value2) {
    if (!equalsIgnoreCase(value, value2)) {
      return 'Conform password invalid';
    } else {
      return 'Please enter password';
    }
  }
}