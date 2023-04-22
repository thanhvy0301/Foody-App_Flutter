import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_app/homepage/homepage.dart';

class AccountDetail extends StatefulWidget {
  const AccountDetail({Key? key}) : super(key: key);

  @override
  State<AccountDetail> createState() => _AccountDetailState();
}

class _AccountDetailState extends State<AccountDetail> {
  final nameController = TextEditingController();
  final addressController = TextEditingController();
  final phoneController = TextEditingController();
  final ageController = TextEditingController();
  bool isLoading = false;
  SharedPreferences? pref;
  @override
  void initState() {
    super.initState();
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      FirebaseFirestore.instance
          .collection('user')
          .doc(currentUser.uid)
          .get()
          .then((doc) {
        if (doc.exists) {
          final data = doc.data()!;
          nameController.text = data['name'] ?? '';
          addressController.text = data['address'] ?? '';
          phoneController.text = data['phone'] ?? '';
        }
      });
    }
    initPref();
  }

  initPref() async {
    pref = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.only(top: 10),
        height: 420,
        child: Column(        
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: SizedBox(
                width: 100,   
                          
                child: Image.asset("assets/icons/avatar.jpg"),
              ),
            ),
            textField(),
            const SizedBox(height: 10),
            btnSave(),
          ],
        ),
      ),
    );
  }

  SizedBox btnSave() {
    return SizedBox(
            height: 50,
            width: 100,           
            
            child: TextButtonTheme(
              data: TextButtonThemeData(
                style: ButtonStyle(                 
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.orange),
                  overlayColor: MaterialStateProperty.all<Color>(Colors.orange),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
              ),
              child: TextButton(
                onPressed: ()  {
                  setState(() {
                    isLoading = true;
                  });
                  storeUserInfo();
                  //await Future.delayed(const Duration(seconds: 2));
                  Fluttertoast.showToast(
                    msg: 'Successfully',
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.SNACKBAR,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.white,
                    textColor: Color.fromARGB(206, 255, 153, 0),
                    fontSize: 16.0,
                  );
                  // Perform form submission here
                },
                child: const Text(
                  'Save',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          );
  }

  SizedBox textField() {
    return SizedBox(
            child: Container(
              width: 380,
              height: 230,
              decoration: BoxDecoration(
                color: Color.fromARGB(235, 239, 239, 239),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 10),
                    //margin: const EdgeInsets.only(top: 12, bottom: 5),
                    width: 350,
                    child: TextField(
                      controller: nameController,
                      decoration: const InputDecoration(
                          labelText: "Name",
                          labelStyle: TextStyle(fontSize: 18)),
                      style: const TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Container(
                    //margin: const EdgeInsets.only(top: 15, bottom: 5),
                    padding: const EdgeInsets.only(top: 10),
                    width: 350,
                    child: TextField(
                      controller: addressController,
                      decoration: const InputDecoration(
                          labelText: "Address",
                          labelStyle: TextStyle(fontSize: 18)),
                      style: const TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10),
                    //margin: const EdgeInsets.only(top: 15, bottom: 5),
                    width: 350,
                    child: TextField(
                      controller: phoneController,
                      decoration: const InputDecoration(
                          labelText: "Phone Number",
                          labelStyle: TextStyle(fontSize: 18)),
                      style: const TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
  }

  storeUserInfo() async {
    setState(() {
      isLoading = true;
    });

    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) {
      return;
    }

    final pref = await SharedPreferences.getInstance();

    // Save user info to SharedPreferences
    await pref.setString('name', nameController.text);
    await pref.setString('address', addressController.text);
    await pref.setString('phone', phoneController.text);

    // Update user info in Firestore
    FirebaseFirestore.instance.collection('user').doc(currentUser.uid).set({
      'name': nameController.text,
      'phone': phoneController.text,
      'address': addressController.text,
    }).then((value) {
      setState(() {
        isLoading = false;
      });
      // Navigate to HomePage after updating user info
      Get.to(() => HomePage());
    });
  }
}

decideRoute() {
  User? user = FirebaseAuth.instance.currentUser;
  if (user != null) {
    FirebaseFirestore.instance
        .collection('user')
        .doc(user.uid)
        .get()
        .then((value) {
      if (value.exists) {
        Get.to(() => HomePage());
      } else {
        Get.to(() => const AccountDetail());
      }
    });
  }
}
