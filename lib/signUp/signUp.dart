import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:test_app/signUp/components/body.dart';
class signUpPage extends StatelessWidget{
  static String routeName = "/signUp";
  @override
  Widget build(BuildContext context){
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.orange.shade400,
        leading: IconButton(
          color: Colors.white,
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: const Text("Sign Up", style: TextStyle(color: Colors.white),),
      ),
      body:const BodySignUp(),
    );
  }
}