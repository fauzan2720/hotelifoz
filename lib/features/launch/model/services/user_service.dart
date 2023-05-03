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
    final User currentUser = FirebaseAuth.instance.currentUser!;
    final DocumentSnapshot<Map<String, dynamic>> snapshot =
        await _userCollection.get();
    final String displayName = currentUser.email!.replaceAll("@gmail.com", "");

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
    }
  }
}
