import 'package:backend_shop/core/auth_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final CollectionReference orders = FirebaseFirestore.instance.collection('orders');
  AuthService authService = AuthService();

  Future<void> saveOrderToDB(String receipt, String prices, String phoneNumber) async {
    try {
      await orders.add({
        'date': DateTime.now(),
        'order': receipt,
        'prices': prices,
        'ownerEmail': authService.getCurrentUser()!.email.toString(),
        'ownerName': authService.getCurrentUser()!.displayName.toString(),
        'ownerPhone' : phoneNumber,
      });
    } catch (e) {
      print('Error adding order to Firestore: $e');
    }
  }
}
