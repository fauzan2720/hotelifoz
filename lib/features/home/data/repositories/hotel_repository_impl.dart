import 'package:hotelifoz/features/home/data/datasources/hotel_local_datasource.dart';
import 'package:hotelifoz/features/home/domain/entities/hotel_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:hotelifoz/features/home/domain/repositories/hotel_repository.dart';

class HotelRepositoryImpl implements HotelRepository {
  final HotelLocalDatasource datasource;

  HotelRepositoryImpl(this.datasource);

  @override
  Future<Either<String, List<HotelEntity>>> getHotels() async {
    try {
      final result = await datasource.getHotels();
      return Right(result.map((data) => data.toEntity()).toList());
    } catch (e) {
      return Left(e.toString());
    }
  }
}
