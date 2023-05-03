// Mocks generated by Mockito 5.4.0 from annotations
// in hotelifoz/test/features/launch/model/services/firebase_auth_service_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i6;

import 'package:dartz/dartz.dart' as _i4;
import 'package:firebase_auth/firebase_auth.dart' as _i3;
import 'package:google_sign_in/google_sign_in.dart' as _i2;
import 'package:hotelifoz/features/launch/model/services/firebase_auth_service.dart'
    as _i5;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeGoogleSignIn_0 extends _i1.SmartFake implements _i2.GoogleSignIn {
  _FakeGoogleSignIn_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeUser_1 extends _i1.SmartFake implements _i3.User {
  _FakeUser_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeEither_2<L, R> extends _i1.SmartFake implements _i4.Either<L, R> {
  _FakeEither_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [FirebaseAuthService].
///
/// See the documentation for Mockito's code generation for more information.
class MockFirebaseAuthService extends _i1.Mock
    implements _i5.FirebaseAuthService {
  MockFirebaseAuthService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.GoogleSignIn get googleSignIn => (super.noSuchMethod(
        Invocation.getter(#googleSignIn),
        returnValue: _FakeGoogleSignIn_0(
          this,
          Invocation.getter(#googleSignIn),
        ),
      ) as _i2.GoogleSignIn);
  @override
  _i3.User get currentUser => (super.noSuchMethod(
        Invocation.getter(#currentUser),
        returnValue: _FakeUser_1(
          this,
          Invocation.getter(#currentUser),
        ),
      ) as _i3.User);
  @override
  _i6.Stream<_i3.User?> get authStateChanges => (super.noSuchMethod(
        Invocation.getter(#authStateChanges),
        returnValue: _i6.Stream<_i3.User?>.empty(),
      ) as _i6.Stream<_i3.User?>);
  @override
  _i6.Future<_i4.Either<String, bool>> signInWithEmailAndPassword(
    String? email,
    String? password,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #signInWithEmailAndPassword,
          [
            email,
            password,
          ],
        ),
        returnValue: _i6.Future<_i4.Either<String, bool>>.value(
            _FakeEither_2<String, bool>(
          this,
          Invocation.method(
            #signInWithEmailAndPassword,
            [
              email,
              password,
            ],
          ),
        )),
      ) as _i6.Future<_i4.Either<String, bool>>);
  @override
  _i6.Future<_i4.Either<String, bool>> signInWithGoogle() =>
      (super.noSuchMethod(
        Invocation.method(
          #signInWithGoogle,
          [],
        ),
        returnValue: _i6.Future<_i4.Either<String, bool>>.value(
            _FakeEither_2<String, bool>(
          this,
          Invocation.method(
            #signInWithGoogle,
            [],
          ),
        )),
      ) as _i6.Future<_i4.Either<String, bool>>);
  @override
  _i6.Future<void> signOut() => (super.noSuchMethod(
        Invocation.method(
          #signOut,
          [],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);
}
