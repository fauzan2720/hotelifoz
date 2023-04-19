import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hotelifoz/features/bookmark/model/services/bookmark_local_service.dart';
import 'package:hotelifoz/features/home/model/models/hotel_model.dart';

class IsBookmarkCubit extends Cubit<bool> {
  final BookmarkLocalServiceImpl _service;

  IsBookmarkCubit(this._service) : super(false);

  void isBookmark(HotelModel hotel) {
    try {
      final bool response = _service.isBookmark(hotel);
      emit(response);
    } catch (e) {
      emit(false);
    }
  }
}
