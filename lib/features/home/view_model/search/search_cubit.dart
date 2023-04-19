import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotelifoz/features/home/model/models/hotel_model.dart';
import 'package:hotelifoz/features/home/model/repositories/hotel_repository.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final HotelRepository _repository;

  SearchCubit(
    this._repository,
  ) : super(SearchInitial());

  void searchHotel(String value) async {
    emit(SearchLoading());
    final response = await _repository.getHotels();
    response.fold(
      (failed) => emit(SearchError(failed)),
      (result) {
        List<HotelModel> searchResult = [];
        for (HotelModel element in result) {
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
