import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotelifoz/features/home/model/repositories/hotel_repository.dart';
import 'package:hotelifoz/features/home/model/models/hotel_model.dart';

part 'hotel_state.dart';

class HotelCubit extends Cubit<HotelState> {
  final HotelRepository _repository;

  HotelCubit(this._repository) : super(HotelInitial()) {
    initData();
  }

  void initData() async {
    emit(HotelLoading());
    final response = await _repository.getHotels();
    response.fold(
      (failed) => emit(HotelError(failed)),
      (result) {
        List<HotelModel> nearby = result.toList();
        List<HotelModel> popular = result.toList();
        List<HotelModel> lowBudget = result.toList();

        // nearby.sort((a, b) => b.rating.compareTo(a.rating));
        popular.sort((a, b) => b.rating.compareTo(a.rating));
        lowBudget.sort((a, b) => a.price.compareTo(b.price));

        emit(HotelSuccess(
          nearby: nearby,
          popular: popular,
          lowBudget: lowBudget,
        ));
      },
    );
  }
}
