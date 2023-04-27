import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hotelifoz/features/reservation/model/models/checkout_query.dart';

class ReservationService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<bool> checkout(CheckoutQuery query) async {
    try {
      firestore
          .collection('reservations')
          .doc(query.id)
          .set(query.toMap(), SetOptions(merge: true));
      return true;
    } catch (e) {
      return false;
    }
  }
}
