import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:test_app/homepage/components/body.dart';


class HomePage extends StatelessWidget{
  int selectIndext = 0;
  static String routeName = "/home_screen";
  @override
  Widget build(BuildContext context){
    return Body();
  }
}