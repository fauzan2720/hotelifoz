import 'package:hotelifoz/features/home/model/services/hotel_local_service.dart';
import 'package:hotelifoz/features/home/model/models/hotel_model.dart';
import 'package:dartz/dartz.dart';

abstract class HotelRepository {
  Future<Either<String, List<HotelModel>>> getHotels();
}

class HotelRepositoryImpl implements HotelRepository {
  final HotelLocalService datasource;

  HotelRepositoryImpl(this.datasource);

  @override
  Future<Either<String, List<HotelModel>>> getHotels() async {
    try {
      final result = await datasource.getHotels();
      return Right(result.map((data) => data.toEntity()).toList());
    } catch (e) {
      return Left(e.toString());
    }
  }
}
