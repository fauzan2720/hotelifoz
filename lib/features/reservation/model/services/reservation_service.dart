import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hotelifoz/features/reservation/model/models/reservation_model.dart';

class ReservationService {
  final CollectionReference<Map<String, dynamic>> _collectionReference =
      FirebaseFirestore.instance.collection("reservations");

  Stream<QuerySnapshot> getReservationStream() {
    return _collectionReference.snapshots();
  }

  Future<bool> checkout(ReservationModel query) async {
    try {
      _collectionReference
          .doc(query.id)
          .set(query.toMap(), SetOptions(merge: true));
      return true;
    } catch (e) {
      return false;
    }
  }
}
