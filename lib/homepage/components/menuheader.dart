import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
//import 'cart/cartpage.dart';

class MenuHeader extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      alignment: Alignment.centerLeft,
      decoration: const BoxDecoration(
        color: Colors.blueAccent
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            const Expanded(child: Text("Account info", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),)),
            GestureDetector(
              onTap: (){

              },
              child: const Text(
                "Save",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),),              
            ),
            GestureDetector(
              onTap: () {
                
              },
              child: const Icon(
                Icons.save_as_outlined
                //"Log out",
                //style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}