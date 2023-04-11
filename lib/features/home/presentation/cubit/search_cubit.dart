import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hotelifoz/features/home/domain/entities/hotel_entity.dart';
import 'package:hotelifoz/features/home/domain/usecases/get_hotels.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final GetHotels getHotelsCase;

  SearchCubit(
    this.getHotelsCase,
  ) : super(SearchInitial());

  void searchHotel(String value) async {
    emit(SearchLoading());
    final response = await getHotelsCase.execute();
    response.fold(
      (failed) => emit(SearchError(failed)),
      (result) {
        List<HotelEntity> searchResult = [];
        for (HotelEntity element in result) {
          if (element.name.toLowerCase().contains(value)) {
            searchResult.add(element);
          }
        }
        if (value.isEmpty) {
          emit(SearchInitial());
        } else if (searchResult.isEmpty) {
          emit(SearchEmpty());
        } else {
          emit(SearchResult(result: searchResult));
        }
      },
    );
  }
}
