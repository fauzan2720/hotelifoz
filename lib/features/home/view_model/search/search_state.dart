part of 'search_cubit.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchEmpty extends SearchState {}

class SearchResult extends SearchState {
  final List<HotelModel> result;

  const SearchResult({
    required this.result,
  });

  @override
  List<Object> get props => [result];
}

class SearchError extends SearchState {
  final String error;

  const SearchError(this.error);

  @override
  List<Object> get props => [error];
}
