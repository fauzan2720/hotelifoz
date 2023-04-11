import 'package:get_it/get_it.dart';
import 'package:hotelifoz/features/home/data/datasources/hotel_local_datasource.dart';
import 'package:hotelifoz/features/home/data/repositories/hotel_repository_impl.dart';
import 'package:hotelifoz/features/home/domain/repositories/hotel_repository.dart';
import 'package:hotelifoz/features/home/domain/usecases/get_hotels.dart';
import 'package:hotelifoz/features/home/presentation/cubit/hotel_cubit.dart';
import 'package:hotelifoz/features/home/presentation/cubit/page_cubit.dart';
import 'package:hotelifoz/features/home/presentation/cubit/search_cubit.dart';

final locator = GetIt.instance;

void init() {
  // state management
  locator.registerFactory(() => PageCubit());
  locator.registerFactory(() => HotelCubit(locator()));
  locator.registerFactory(() => SearchCubit(locator()));

  // usecase
  locator.registerLazySingleton(() => GetHotels(locator()));

  // repository
  locator.registerLazySingleton<HotelRepository>(
      () => HotelRepositoryImpl(locator()));

  // datasource
  locator.registerLazySingleton<HotelLocalDatasource>(
    () => HotelLocalDatasourceImpl(),
  );
}
