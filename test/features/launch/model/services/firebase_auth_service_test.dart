import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hotelifoz/features/launch/model/services/firebase_auth_service.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'firebase_auth_service_test.mocks.dart';

@GenerateMocks([FirebaseAuthService])
void main() {
  group('firebase auth service ...', () {
    final FirebaseAuthService firebaseAuthService = MockFirebaseAuthService();

    test('sign in by email & password success', () async {
      when(firebaseAuthService.signInWithEmailAndPassword(
              "fauzan@gmail.com", "123123"))
          .thenAnswer((realInvocation) async => const Right(true));

      final response = await firebaseAuthService.signInWithEmailAndPassword(
          "fauzan@gmail.com", "123123");
      response.fold(
        (failed) => null,
        (result) => expect(result, true),
      );
    });

    test('sign in by google success', () async {
      when(firebaseAuthService.signInWithGoogle())
          .thenAnswer((realInvocation) async => const Right(true));

      final response = await firebaseAuthService.signInWithGoogle();
      response.fold(
        (failed) => null,
        (result) => expect(result, true),
      );
    });

    test('sign out success', () async {
      when(firebaseAuthService.signOut())
          .thenAnswer((realInvocation) async => true);

      bool isSuccess = false;
      try {
        await firebaseAuthService.signOut();
        isSuccess = true;
      } catch (e) {
        isSuccess = false;
      }
      expect(isSuccess, true);
    });
  });
}
