part of 'bookmark_cubit.dart';

abstract class BookmarkState extends Equatable {
  const BookmarkState();

  @override
  List<Object> get props => [];
}

class BookmarkInitial extends BookmarkState {}

class BookmarkLoading extends BookmarkState {}

class BookmarkSuccess extends BookmarkState {
  final List<HotelEntity> data;

  const BookmarkSuccess(this.data);

  @override
  List<Object> get props => [data];
}

class BookmarkError extends BookmarkState {
  final String error;

  const BookmarkError(this.error);

  @override
  List<Object> get props => [error];
}
