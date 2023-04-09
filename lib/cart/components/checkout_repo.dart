import 'package:test_app/cart/components/base_checkout_repository.dart';
import 'package:test_app/model/checkout.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// class CheckoutRepo extends BaseCheckOut {
//   final FirebaseFirestore _firebaseFirestore;
//   CheckoutRepo({FirebaseFirestore? firebaseFirestore}): _firebaseFirestore = firebaseFirestore?? FirebaseFirestore.instance;

//   @override
//   Future<void> addCheckout(Checkout checkout) {
//     // TODO: implement addCheckout
//     return _firebaseFirestore.collection('checkout').add(checkout.toDocument());
//   }
  
// }