// Mocks generated by Mockito 5.4.0 from annotations
// in hotelifoz/test/features/reservation/model/services/reservation_service_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:dartz/dartz.dart' as _i4;
import 'package:hotelifoz/features/reservation/model/models/reservation_model.dart'
    as _i5;
import 'package:hotelifoz/features/reservation/model/services/reservation_service.dart'
    as _i2;
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

/// A class which mocks [ReservationService].
///
/// See the documentation for Mockito's code generation for more information.
class MockReservationService extends _i1.Mock
    implements _i2.ReservationService {
  MockReservationService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Stream<_i4.Either<String, List<_i5.ReservationModel>>> getReservation(
          String? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getReservation,
          [id],
        ),
        returnValue:
            _i3.Stream<_i4.Either<String, List<_i5.ReservationModel>>>.empty(),
      ) as _i3.Stream<_i4.Either<String, List<_i5.ReservationModel>>>);
  @override
  _i3.Future<bool> checkout(_i5.ReservationModel? query) => (super.noSuchMethod(
        Invocation.method(
          #checkout,
          [query],
        ),
        returnValue: _i3.Future<bool>.value(false),
      ) as _i3.Future<bool>);
}
