import 'package:hotelifoz/core.dart';

final locator = GetIt.instance;

void init() {
  // state management
  locator.registerFactory(() => PageCubit());
  locator.registerFactory(() => HotelCubit(locator()));
  locator.registerFactory(() => SearchCubit(locator()));
  locator.registerFactory(() => BookmarkCubit(locator()));
  locator.registerFactory(() => IsBookmarkCubit(locator()));
  locator.registerFactory(() => CountGuestCubit());
  locator.registerFactory(() => LengthOfStayCubit());
  locator.registerFactory(() => PaymentSelectedCubit());
  locator.registerFactory(() => ReservationCubit(locator()));

  // repository
  locator.registerLazySingleton<HotelRepository>(
      () => HotelRepositoryImpl(locator()));

  // remote service
  locator.registerLazySingleton<ReservationService>(() => ReservationService());

  // local service
  locator
      .registerLazySingleton<HotelLocalService>(() => HotelLocalServiceImpl());
  locator.registerLazySingleton<BookmarkLocalServiceImpl>(
      () => BookmarkLocalServiceImpl());
}
