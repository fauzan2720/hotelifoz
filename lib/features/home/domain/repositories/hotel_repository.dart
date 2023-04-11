import 'package:dartz/dartz.dart';
import 'package:hotelifoz/features/home/domain/entities/hotel_entity.dart';

abstract class HotelRepository {
  Future<Either<String, List<HotelEntity>>> getHotels();
}
