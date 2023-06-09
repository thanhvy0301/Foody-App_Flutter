import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/cart/components/checkoutScreen.dart';
//import 'package:test_app/cart/components/confirmOrder.dart';
import 'package:test_app/cart/components/detailPayment.dart';
import 'package:test_app/homepage/components/fragments/search.dart';
import 'package:test_app/homepage/homepage.dart';
import 'package:test_app/signIn/components/plashPage.dart';
import 'package:test_app/signIn/signInPage.dart';
import 'package:test_app/signUp/signUp.dart';

import 'cart/cartpage.dart';

void main()  async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
      
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/splash':(context) => const plashPage(),
        '/signIn_page':(context) => signInPage(),
        '/home_screen': (context)=> HomePage(),
        '/signUp': (context)=> signUpPage(),
        '/search_bar':(context) => SearchBar(),
        '/carts':(context) => const CartPage(),  
        //'/detailPayment':(context) =>  detailPayment()  ,
        '/checkoutScreen':(context) =>  CheckoutScreen(sum: 0,),                
      },
      
      
      home: const plashPage(),
    );
  }
}


