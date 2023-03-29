import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import "package:flutter/cupertino.dart";
import 'package:flutter_svg/svg.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:test_app/signIn/components/signIn_form.dart';

class SignUpForm extends StatefulWidget{
  @override
    _SignUpFormState createState() => _SignUpFormState();

}
class _SignUpFormState extends State<SignUpForm> {
  var email = TextEditingController();
  var password = TextEditingController();
  var conform = TextEditingController();
  
  final _formKey = GlobalKey<FormState>();
  final _passKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            
            SizedBox(height: 30,),
            emailTextFormField(),
            SizedBox(height: 30,),
            passwordTextFormField(),
            SizedBox(height: 30,),
            conformTextFormField(),
            SizedBox(height: 30,),
            
            SizedBox(
              height: 50,
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              child: ElevatedButton(
                onPressed: () {
                  FirebaseAuth.instance.createUserWithEmailAndPassword(
                    email: email.text, 
                    password: password.text).then((value){
                      print("Create new account");
                      Navigator.push(context, MaterialPageRoute(builder:(context) => const signInForm()));
                    }).onError((error, stackTrace) {
                      print("Error ${error.toString()}");
                    });
                    
                  // if (_formKey.currentState!.validate()) {
                    
                  //       //User(username: email.text, password: conform.text));
                  // }
                },
                // side: RoundedRectangleBorder(
                //     borderRadius: BorderRadius.circular(10)),
                // color: Colors.blueAccent,
                child: const Text("Continue", style: TextStyle(fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),),
              ),
            ),
            SizedBox(height: 30,),
            Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      color: Color(0xFFF5F6F9),
                      shape: BoxShape.circle,
                    ),
                    child: SvgPicture.asset("assets/icons/icons8-facebook.svg"),
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      color: Color(0xFFF5F6F9),
                      shape: BoxShape.circle,
                    ),
                    child: SvgPicture.asset("assets/icons/icons8-google.svg"),
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      color: Color(0xFFF5F6F9),
                      shape: BoxShape.circle,
                    ),
                    child: SvgPicture.asset("assets/icons/icons8-twitter.svg"),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  TextFormField emailTextFormField() {
    return TextFormField(
      controller: email,
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
          border: OutlineInputBorder(),
          hintText: "Enter your email",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Icon(Icons.email_outlined)
      ),
      //validator: Utilities.validateEmail(value),
      onSaved: (value){
        setState(() {
          email.text = value!;
        });
      },
    );
  }

  TextFormField passwordTextFormField() {
    return TextFormField(
      key: _passKey,
      controller: password,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
          border: OutlineInputBorder(),
          hintText: "Enter your password",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Icon(Icons.lock_outline)
      ),
      // validator: (passwordKey){
      //   return Utilities.validatePassword(passwordKey);
      // },
    );
  }

  TextFormField conformTextFormField() {
    return TextFormField(
      controller: conform,
      obscureText: true,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
          border: OutlineInputBorder(),
          hintText: "Re-enter your password",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Icon(Icons.lock_outline)
      ),
      // validator: (passwordKey){
      //   var pass = _passKey.currentState.value;
      //   return Utilities.conformPassword(conformPassword, pass);
      // },
      // onSaved: (value){
      //   setState(() {
      //     conform.text = value;
      //   });
      // }
    );
  }
}