import 'package:dartz/dartz.dart';
import 'package:hotelifoz/features/home/domain/entities/hotel_entity.dart';
import 'package:hotelifoz/features/home/domain/repositories/hotel_repository.dart';

class GetHotels {
  final HotelRepository repository;

  GetHotels(this.repository);

  Future<Either<String, List<HotelEntity>>> execute() {
    return repository.getHotels();
  }
}
