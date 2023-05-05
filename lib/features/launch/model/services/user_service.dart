import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hotelifoz/features/launch/model/models/user_model.dart';

class UserService {
  DocumentReference<Map<String, dynamic>> get _userCollection =>
      FirebaseFirestore.instance
          .collection("users")
          .doc(FirebaseAuth.instance.currentUser!.uid);

  Stream<Either<String, UserModel>> getUser() {
    try {
      return _userCollection.snapshots().map((event) {
        final UserModel result =
            UserModel.fromMap(event.data() as Map<String, dynamic>);
        return Right(result);
      });
    } catch (e) {
      throw Left(e.toString());
    }
  }

  Future<Either<String, bool>> createUserIfNotExists() async {
    final User currentUser = FirebaseAuth.instance.currentUser!;
    final DocumentSnapshot<Map<String, dynamic>> snapshot =
        await _userCollection.get();
    final String displayName =
        currentUser.displayName ?? _convertEmailToName(currentUser.email!);

    try {
      if (!snapshot.exists) {
        await _userCollection.set(UserModel(
          id: currentUser.uid,
          name: displayName,
          email: currentUser.email!,
          phoneNumber: currentUser.phoneNumber,
          photo: currentUser.photoURL ??
              "https://ui-avatars.com/api/?name=$displayName",
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        ).toMap());
        return const Right(true);
      } else {
        return const Right(true);
      }
    } catch (e) {
      return Left(e.toString());
    }
  }

  String _convertEmailToName(String email) => email
      .split("@")[0] // menghilangkan email
      .replaceAll(".", " ")
      .replaceAll("_", " ")
      .replaceAll(RegExp(r'\d+'), '') // menghapus digit
      .toLowerCase() // mengubah semua huruf menjadi lowercase
      .split(' ') // memecah nama menjadi array
      .map((e) =>
          e[0].toUpperCase() + e.substring(1)) // membuat awalan huruf kapital
      .join(' '); // menggabungkan array kembali menjadi string;
}
