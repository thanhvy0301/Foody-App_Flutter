import 'package:flutter/material.dart';
import 'components/body.dart';
class signInPage extends StatelessWidget{
  static String routeName = "/signIn_page";
  @override
  Widget build(BuildContext context){
    return const Scaffold(      
      resizeToAvoidBottomInset:false,
      body: Body(),
    );
  }
}