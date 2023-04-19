import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hotelifoz/features/bookmark/model/services/bookmark_local_service.dart';
import 'package:hotelifoz/features/home/model/models/hotel_model.dart';

part 'bookmark_state.dart';

class BookmarkCubit extends Cubit<BookmarkState> {
  final BookmarkLocalService _service = BookmarkLocalService();
  List<HotelModel> _bookmarks = [];

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

  void saveBookmark(HotelModel hotel) async {
    final response = await _service.saveBookmark(hotel);
    response.fold(
      (failed) => emit(BookmarkError(failed)),
      (result) {
        initData();
      },
    );
  }
}
