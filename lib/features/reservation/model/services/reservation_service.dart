import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:hotelifoz/features/reservation/model/models/reservation_model.dart';

class ReservationService {
  final CollectionReference<Map<String, dynamic>> _collectionReference =
      FirebaseFirestore.instance.collection("reservations");

  Stream<Either<String, List<ReservationModel>>> getReservation(String id) {
    try {
      return _collectionReference
          .where('user.id', isEqualTo: id)
          .snapshots()
          .map((event) {
        final List<ReservationModel> result =
            event.docs.map<ReservationModel>((DocumentSnapshot message) {
          return ReservationModel.fromMap(
              message.data() as Map<String, dynamic>);
        }).toList();

        result.sort(
          (ReservationModel b, ReservationModel a) =>
              a.createdAt!.compareTo(b.createdAt!),
        );

        return Right(result);
      });
    } catch (e) {
      throw Left(e.toString());
    }
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
