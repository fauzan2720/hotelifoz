import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hotelifoz/features/launch/model/models/user_model.dart';

class UserService {
  DocumentReference<Map<String, dynamic>> get _userCollection =>
      FirebaseFirestore.instance
          .collection("users")
          .doc(FirebaseAuth.instance.currentUser!.uid);

  Stream<UserModel> getUser() {
    try {
      return _userCollection.snapshots().map((event) {
        final UserModel result =
            UserModel.fromMap(event.data() as Map<String, dynamic>);
        return result;
      });
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> createUserIfNotExists() async {
    var snapshot = await _userCollection.get();
    if (!snapshot.exists) {
      await _userCollection.set(UserModel(
        id: FirebaseAuth.instance.currentUser!.uid,
        name: FirebaseAuth.instance.currentUser!.displayName!,
        email: FirebaseAuth.instance.currentUser!.email!,
        phoneNumber: FirebaseAuth.instance.currentUser!.phoneNumber,
        photo: FirebaseAuth.instance.currentUser!.photoURL!,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ).toMap());
    }
  }
}
