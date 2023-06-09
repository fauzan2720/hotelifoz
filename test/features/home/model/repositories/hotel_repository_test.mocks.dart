// Mocks generated by Mockito 5.4.0 from annotations
// in hotelifoz/test/features/home/model/repositories/hotel_repository_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:dartz/dartz.dart' as _i3;
import 'package:hotelifoz/features/home/model/models/hotel_model.dart' as _i6;
import 'package:hotelifoz/features/home/model/repositories/hotel_repository.dart'
    as _i4;
import 'package:hotelifoz/features/home/model/services/hotel_local_service.dart'
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

class _FakeHotelLocalService_0 extends _i1.SmartFake
    implements _i2.HotelLocalService {
  _FakeHotelLocalService_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeEither_1<L, R> extends _i1.SmartFake implements _i3.Either<L, R> {
  _FakeEither_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [HotelRepositoryImpl].
///
/// See the documentation for Mockito's code generation for more information.
class MockHotelRepositoryImpl extends _i1.Mock
    implements _i4.HotelRepositoryImpl {
  MockHotelRepositoryImpl() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.HotelLocalService get datasource => (super.noSuchMethod(
        Invocation.getter(#datasource),
        returnValue: _FakeHotelLocalService_0(
          this,
          Invocation.getter(#datasource),
        ),
      ) as _i2.HotelLocalService);
  @override
  _i5.Future<_i3.Either<String, List<_i6.HotelModel>>> getHotels() =>
      (super.noSuchMethod(
        Invocation.method(
          #getHotels,
          [],
        ),
        returnValue: _i5.Future<_i3.Either<String, List<_i6.HotelModel>>>.value(
            _FakeEither_1<String, List<_i6.HotelModel>>(
          this,
          Invocation.method(
            #getHotels,
            [],
          ),
        )),
      ) as _i5.Future<_i3.Either<String, List<_i6.HotelModel>>>);
}
