import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hotelifoz/features/bookmark/model/services/bookmark_local_service.dart';
import 'package:hotelifoz/features/home/domain/entities/hotel_entity.dart';

part 'bookmark_state.dart';

class BookmarkCubit extends Cubit<BookmarkState> {
  final BookmarkLocalService _service = BookmarkLocalService();
  List<HotelEntity> _bookmarks = [];

  BookmarkCubit() : super(BookmarkInitial()) {
    initData();
  }

  void initData() async {
    emit(BookmarkLoading());
    final response = await _service.getBookmarks();
    response.fold(
      (failed) => emit(BookmarkError(failed)),
      (result) {
        _bookmarks = result;
        emit(BookmarkSuccess(_bookmarks));
      },
    );
  }

  void saveBookmark(HotelEntity hotel) async {
    final response = await _service.saveBookmark(hotel);
    response.fold(
      (failed) => emit(BookmarkError(failed)),
      (result) {
        initData();
      },
    );
  }
}
