//import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_app/homepage/homepage.dart';
import 'package:test_app/signUp/signUp.dart';

import '../../model/utilities.dart';

class signInForm extends StatefulWidget {
  const signInForm({super.key});

  @override
  State<signInForm> createState() => signInFormState();
}

class signInFormState extends State<signInForm> {
  // void SignIn() async{
  //   try{
  //     await FirebaseAuth.instance.signInWithEmailAndPassword(
  //       email: username.text,
  //       password: password.text
  //       );
  //       Navigator.pop(context);
  //     }
  //     on FirebaseAuthException catch (e){
  //       Navigator.pop(context);
  //       if(e.code =='user-not-found'){
  //         wrongEmailMessage();
  //       } else if(e.code == 'wrong password');
  //     }
  //     //Navigator.pop(context);
  //   }

  static Future<User?> signInWithEmailAndPassword(
      {required String username,
      required String password,
      required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: username, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "user not found") {
        print("Not found");
      }
    }
    return user;
  }

  Future<FirebaseApp> _initalizerFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  final _formKey = GlobalKey<FormState>();
  bool _value = false;
  var sharedPreferences;
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  late FToast fToast;

  @override
  void initState() {
    fToast = FToast();
    fToast.init(context);
    _getData();
    super.initState();
  }

  _getData() async {
    //sharedPreferences = await SharedPreferences.getInstance();
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getString('username')!.isNotEmpty) {
      username.text = sharedPreferences.getString('username') ?? '';
      password.text = sharedPreferences.getString('password') ?? '';
      _value = sharedPreferences.getBool('check') ?? false;
    }
  }

  @override
  Widget build(BuildContext context) {
    User? user;
    return Form(
      key: _formKey,
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(8.0),
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:  [
                    Text(
                      "Food Now",
                      style: TextStyle(
                          fontSize: 32,
                          color: Colors.orange.shade400,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Sign in with your email and password \n or continue with social media",
                      
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.orange.shade200),
                    )
                  ],
                )),
            Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextFormField(
                          validator: (value) {
                            return Utilities.validatePassword(value!);
                          },
                          onSaved: (_value) {
                            setState(() {
                              username.text = _value!;
                            });
                          },
                          controller: username,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Username",
                              prefixIcon: Icon(Icons.mail_outline)),
                        ),
                        const SizedBox(height: 5),
                        TextFormField(
                          controller: password,
                          validator: (value) {
                            return Utilities.validatePassword(value!);
                          },
                          obscureText: true,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Password",
                              prefixIcon: Icon(Icons.lock_outline_rounded)),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                             Text(
                              "Remember me",
                              style: TextStyle(color: Colors.orange.shade400),
                            ),
                            Checkbox(
                                value: _value,
                                onChanged: (value) {
                                  _value = !_value;
                                  setState(() {});
                                })
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          child: ElevatedButton(
                            onPressed: () async {
                              print(user);
                              if (user != null) {
                                Navigator.of(context).toString();
                              }
                              FirebaseAuth.instance
                                  .signInWithEmailAndPassword(
                                      email: username.text.trim(),
                                      password: password.text.trim())
                                  .then((value) {
                                Navigator.pushNamed(
                                    context, HomePage.routeName);
                              }).onError((error, stackTrace) {
                                //print("Error ${error.toString()}");
                                Fluttertoast.showToast(
                                  msg: 'Incorrect',
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Color.fromARGB(188, 138, 138, 138),
                                  textColor: Colors.white,
                                  fontSize: 16.0,
                                );
                                
                              });
                              if (_value) {
                                sharedPreferences =
                                    await SharedPreferences.getInstance();
                                sharedPreferences.setString(
                                    "username", username.text.trim());
                                sharedPreferences.setString(
                                    "password", password.text.trim());
                                sharedPreferences.setBool("check", _value);
                              } else {
                                sharedPreferences.remove('check');
                              }

                              //Navigator.pushNamed(context, HomePage.routeName);
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              backgroundColor: Colors.orange.shade400,
                            ),
                            child: const Text(
                              "Log In",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 40,
                                width: 40,
                                padding: const EdgeInsets.all(10),
                                decoration: const BoxDecoration(
                                    color: Color(0xFFF5F6F9),
                                    shape: BoxShape.circle),
                                child: SvgPicture.asset(
                                    "assets/icons/icons8-facebook.svg"),
                              ),
                              Container(
                                height: 40,
                                width: 40,
                                margin:
                                    const EdgeInsets.only(left: 10, right: 10),
                                padding: const EdgeInsets.all(10),
                                decoration: const BoxDecoration(
                                    color: Color(0xFFF5F6F9),
                                    shape: BoxShape.circle),
                                child: SvgPicture.asset(
                                    "assets/icons/icons8-google.svg"),
                              ),
                              Container(
                                height: 40,
                                width: 40,
                                margin:
                                    const EdgeInsets.only(left: 10, right: 10),
                                padding: const EdgeInsets.all(10),
                                decoration: const BoxDecoration(
                                    color: Color(0xFFF5F6F9),
                                    shape: BoxShape.circle),
                                child: SvgPicture.asset(
                                    "assets/icons/icons8-twitter.svg"),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                             Text(
                              "Don't have an account ? ",
                              style: TextStyle(
                                  color: Colors.orange.shade400, fontSize: 14),
                            ),
                            GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => signUpPage()),
                                  );
                                  //Navigator.pushNamed(context, signUpPage.routeName);
                                  // User user = result;
                                  // username.text = user.username;
                                },
                                child: const Text(
                                  "Sign Up",
                                  style: TextStyle(
                                      color: Colors.redAccent, fontSize: 14),
                                ))
                          ],
                        )
                      ]),
                )),
          ],
        ),
      ),
    );
  }

  void wrongEmailMessage() {
    showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            title: Text("Incorrect Email"),
          );
        });
  }

  void wrongPasswordMessage() {
    showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            title: Text("Incorrect Password"),
          );
        });
  }
}
