import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hotelifoz/features/launch/model/models/user_model.dart';
import 'package:hotelifoz/features/launch/model/services/user_service.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'user_service_test.mocks.dart';

@GenerateMocks([UserService])
void main() {
  group('user service ...', () {
    final UserService userService = MockUserService();

    final UserModel userModel = UserModel(
      id: '1',
      name: 'John Doe',
      email: 'john.doe@example.com',
      phoneNumber: null,
      photo: 'https://via.placeholder.com/150',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    test('get user success', () async {
      when(userService.getUser())
          .thenAnswer((realInvocation) => Stream.value(Right(userModel)));

      final response = await userService.getUser().first;
      response.fold(
        (failed) => null,
        (result) {
          expect(result.id, userModel.id);
          expect(result.name, userModel.name);
          expect(result.email, userModel.email);
          expect(result.phoneNumber, userModel.phoneNumber);
          expect(result.photo, userModel.photo);
          expect(result.createdAt, userModel.createdAt);
          expect(result.updatedAt, userModel.updatedAt);
        },
      );
    });

    test('create user if not exists success', () async {
      when(userService.createUserIfNotExists())
          .thenAnswer((realInvocation) async => const Right(true));

      final response = await userService.createUserIfNotExists();
      response.fold(
        (failed) => null,
        (result) => expect(result, true),
      );
    });
  });
}
