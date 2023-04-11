import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotelifoz/features/home/domain/entities/hotel_entity.dart';

import 'package:hotelifoz/features/home/domain/usecases/get_hotels.dart';

part 'hotel_state.dart';

class HotelCubit extends Cubit<HotelState> {
  final GetHotels getHotelsCase;

  HotelCubit(
    this.getHotelsCase,
  ) : super(HotelInitial()) {
    initData();
  }

  void initData() async {
    emit(HotelLoading());
    final response = await getHotelsCase.execute();
    response.fold(
      (failed) => emit(HotelError(failed)),
      (result) {
        List<HotelEntity> nearby = result.toList();
        List<HotelEntity> popular = result.toList();
        List<HotelEntity> lowBudget = result.toList();

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
