import 'package:get_it/get_it.dart';
import 'package:hotelifoz/features/bookmark/model/services/bookmark_local_service.dart';
import 'package:hotelifoz/features/bookmark/view_model/bookmark/bookmark_cubit.dart';
import 'package:hotelifoz/features/bookmark/view_model/is_bookmark/is_bookmark_cubit.dart';
import 'package:hotelifoz/features/home/model/services/hotel_local_service.dart';
import 'package:hotelifoz/features/home/model/repositories/hotel_repository.dart';
import 'package:hotelifoz/features/home/view_model/hotel/hotel_cubit.dart';
import 'package:hotelifoz/features/home/view_model/page/page_cubit.dart';
import 'package:hotelifoz/features/home/view_model/search/search_cubit.dart';
import 'package:hotelifoz/features/reservation/view_model/checkout/checkout_cubit.dart';
import 'package:hotelifoz/features/reservation/view_model/count_guest/count_guest_cubit.dart';
import 'package:hotelifoz/features/reservation/view_model/length_of_stay/length_of_stay_cubit.dart';
import 'package:hotelifoz/features/reservation/view_model/payment_selected/payment_selected_cubit.dart';

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
  locator.registerFactory(() => CheckoutCubit());

  // repository
  locator.registerLazySingleton<HotelRepository>(
      () => HotelRepositoryImpl(locator()));

  // remote service

  // local service
  locator
      .registerLazySingleton<HotelLocalService>(() => HotelLocalServiceImpl());
  locator.registerLazySingleton<BookmarkLocalServiceImpl>(
      () => BookmarkLocalServiceImpl());
}
