import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
// import 'package:labfoodnow/signIn/signInPage.dart';
// import 'package:flutter_svg/svg.dart';
// //import 'package:fluttertoast/fluttertoast.dart';

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