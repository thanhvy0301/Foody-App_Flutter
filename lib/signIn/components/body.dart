import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:test_app/signIn/components/signIn_form.dart';
import 'package:test_app/signIn/signInPage.dart';
class Body extends StatelessWidget{
  const Body({super.key});
  @override
  Widget build(BuildContext context){
    return SafeArea(child: SingleChildScrollView(
      child:Column(
        children: [
          headerScreen(context),
          const signInForm(),
          footerScreen(context),
        ],
      ),
    ));
  }
  Widget headerScreen(BuildContext context){
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height*0.2,
      alignment: Alignment.bottomRight,
      child: Image.asset("assets/images/dish_2.png"),
    );
  }
  Widget footerScreen(BuildContext context){
    return Container(
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.bottomLeft,
      child: Image.asset("assets/images/dish_2.png"),
    );
  }
}