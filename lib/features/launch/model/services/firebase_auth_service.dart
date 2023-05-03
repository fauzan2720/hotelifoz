import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User get currentUser => _auth.currentUser!;

  Stream<User?> get authStateChanges => _auth.authStateChanges();

  final GoogleSignIn googleSignIn = GoogleSignIn(
    scopes: [
      'email',
    ],
  );

  Future<Either<String, bool>> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return const Right(true);
    } on FirebaseAuthException catch (e) {
      return Left(e.message.toString());
    }
  }

  Future<Either<String, bool>> registerUserWithEmailAndPassword(
      String email, String password) async {
    try {
      if (!email.endsWith('@gmail.com')) {
        return const Left('The email must end in \'@gmail.com\'');
      } else {
        await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        return const Right(true);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return const Left('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        return const Left('The account already exists for that email.');
      } else {
        return Left(e.message.toString());
      }
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, bool>> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        await _auth.signInWithCredential(credential);

        return const Right(true);
      } else {
        return const Right(false);
      }
    } on FirebaseAuthException catch (e) {
      return Left(e.message.toString());
    }
  }

  Future<void> signOut() async {
    try {
      await googleSignIn.disconnect();
    } catch (_) {}
    try {
      _auth.signOut();
    } catch (_) {}
  }
}
