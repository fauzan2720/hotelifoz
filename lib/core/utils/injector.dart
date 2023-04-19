import 'package:get_it/get_it.dart';
import 'package:hotelifoz/features/bookmark/model/services/bookmark_local_service.dart';
import 'package:hotelifoz/features/bookmark/view_model/bookmark/bookmark_cubit.dart';
import 'package:hotelifoz/features/bookmark/view_model/is_bookmark/is_bookmark_cubit.dart';
import 'package:hotelifoz/features/home/model/services/hotel_local_service.dart';
import 'package:hotelifoz/features/home/model/repositories/hotel_repository.dart';
import 'package:hotelifoz/features/home/view_model/hotel/hotel_cubit.dart';
import 'package:hotelifoz/features/home/view_model/page/page_cubit.dart';
import 'package:hotelifoz/features/home/view_model/search/search_cubit.dart';

final locator = GetIt.instance;

void init() {
  // state management
  locator.registerFactory(() => PageCubit());
  locator.registerFactory(() => HotelCubit(locator()));
  locator.registerFactory(() => SearchCubit(locator()));
  locator.registerFactory(() => BookmarkCubit(locator()));
  locator.registerFactory(() => IsBookmarkCubit(locator()));

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
