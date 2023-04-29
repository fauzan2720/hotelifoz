import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hotelifoz/features/launch/model/models/user_model.dart';

DocumentReference get userCollection {
  return FirebaseFirestore.instance
      .collection("users")
      .doc(FirebaseAuth.instance.currentUser!.uid);
}

class UserService {
  Stream<DocumentSnapshot> getUserStream() {
    return userCollection.snapshots();
  }

  Future<void> createUserIfNotExists() async {
    var snapshot = await userCollection.get();
    if (!snapshot.exists) {
      await userCollection.set(UserModel(
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
