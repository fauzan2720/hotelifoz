import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hotelifoz/features/bookmark/model/services/bookmark_local_service.dart';
import 'package:hotelifoz/features/home/domain/entities/hotel_entity.dart';

class IsBookmarkCubit extends Cubit<bool> {
  final BookmarkLocalService _service = BookmarkLocalService();

  IsBookmarkCubit() : super(false);

  void isBookmark(HotelEntity hotel) {
    try {
      final bool response = _service.isBookmark(hotel);
      emit(response);
    } catch (e) {
      emit(false);
    }
  }
}
