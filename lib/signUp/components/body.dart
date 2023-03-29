import 'package:flutter/material.dart';
import 'signup_form.dart';

class BodySignUp extends StatelessWidget{
  const BodySignUp({super.key});

  @override
  Widget build(BuildContext context){
    return SafeArea(child: Container(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const Text("Register Account", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.blueAccent,
            height: 1.5),),
            const Text("Complete your details or continue \nwith social media",
            textAlign: TextAlign.center,
            style: TextStyle(color: Color(0xFF4caf50)),
            ),
            SignUpForm()
          ],

        ),
      ),
    ));
  }
}