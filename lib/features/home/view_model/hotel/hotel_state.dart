part of 'hotel_cubit.dart';

abstract class HotelState extends Equatable {
  const HotelState();

  @override
  List<Object> get props => [];
}

class HotelInitial extends HotelState {}

class HotelLoading extends HotelState {}

class HotelSuccess extends HotelState {
  final List<HotelModel> nearby;
  final List<HotelModel> popular;
  final List<HotelModel> lowBudget;

  const HotelSuccess({
    required this.nearby,
    required this.popular,
    required this.lowBudget,
  });

  @override
  List<Object> get props => [nearby];
}

class HotelError extends HotelState {
  final String error;

  const HotelError(this.error);

  @override
  List<Object> get props => [error];
}
