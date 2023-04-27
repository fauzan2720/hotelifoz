part of 'reservation_cubit.dart';

abstract class ReservationState extends Equatable {
  const ReservationState();

  @override
  List<Object> get props => [];
}

class ReservationInitial extends ReservationState {}

class ReservationLoading extends ReservationState {}

class ReservationSuccess extends ReservationState {
  final List<ReservationModel> data;

  const ReservationSuccess(this.data);

  @override
  List<Object> get props => [data];
}

class ReservationError extends ReservationState {
  final String error;

  const ReservationError(this.error);

  @override
  List<Object> get props => [error];
}
