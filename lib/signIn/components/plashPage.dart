// ignore: file_names
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test_app/homepage/homepage.dart';
import 'package:test_app/signIn/signInPage.dart';

import '../../homepage/components/fragments/home_fragment_product.dart';

class plashPage extends StatelessWidget {
  const plashPage({super.key});
  static String routeName = '/splash';

//   @override
//   State<plashPage> createState()=> _plashPageState();
// }

// class _plashPageState extends State<plashPage>{
//   @override
//   void initState() {
//     super.initState();
//     Future.delayed(
//         const Duration(seconds: 3),
//             (){
//           Navigator.of(context).push(MaterialPageRoute(builder: (context)=> signInPage(),
//           ));
//         }
//     );
//   }

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      //Navigator.push(context, signInPage.routeName)
      Navigator.pushNamedAndRemoveUntil(
          context, signInPage.routeName, (Route<dynamic> route) => false
          // FirebaseAuth.instance.currentUser != null
          //     ? HomePage.routeName
          //     : signInPage.routeName,
          // (Route<dynamic> route) => false);
          );
    });
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(color: Colors.white),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
               Text(
                "Loading...",
                style: TextStyle(
                    color: Colors.orange.shade400,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              const CircularProgressIndicator(
                backgroundColor: Colors.grey,
                strokeWidth: 5,
              ),
              const SizedBox(
                height: 5,
              ),
             
            ],
          ),
        ),
      ),
    );
  }
}
// // ignore: file_names
// import 'package:flutter/material.dart';
// import 'package:test_app/signIn/signInPage.dart';
//   class plashPage extends StatefulWidget{
//     const plashPage({super.key});
//     static String routeName = '/plash';
//
//     @override
//     State<plashPage> createState()=> _plashPageState();
//   }
//
//   class _plashPageState extends State<plashPage>{
//   @override
//   void initState() {
//     super.initState();
//     Future.delayed(
//       const Duration(seconds: 3),
//       (){
//         Navigator.of(context).push(MaterialPageRoute(builder: (context)=> signInPage(),
//         ));
//       }
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     Future.delayed(const Duration(seconds: 3), () {
//       Navigator.pushNamedAndRemoveUntil(
//         context, signInPage.routeName,(Route<dynamic>route)=>false
//       );
//     });
//     return Scaffold(
//       body: SafeArea(
//         child: Container(
//           width: MediaQuery
//               .of(context)
//               .size
//               .width,
//           height: MediaQuery
//               .of(context)
//               .size
//               .height,
//           decoration: const BoxDecoration(
//               color: Colors.white
//           ),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: const[
//               CircularProgressIndicator(
//                 backgroundColor: Colors.grey,
//                 strokeWidth: 5,
//               ),
//               SizedBox(height: 5,),
//               Text("Loading...", style: TextStyle(color: Colors.lightBlue,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 18),)
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }