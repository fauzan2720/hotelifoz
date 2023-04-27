import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hotelifoz/features/reservation/model/models/reservation_model.dart';

class ReservationService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot> getReservationStream() {
    return firestore.collection("reservations").snapshots();
  }

  Future<bool> checkout(ReservationModel query) async {
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
