import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotelifoz/features/launch/model/services/user_service.dart';
import 'package:hotelifoz/features/reservation/model/models/reservation_model.dart';
import 'package:hotelifoz/features/reservation/model/services/reservation_service.dart';

part 'reservation_state.dart';

class ReservationCubit extends Cubit<ReservationState> {
  final UserService _userService;
  final ReservationService _reservationService;

  ReservationCubit(
    this._userService,
    this._reservationService,
  ) : super(ReservationInitial());

  void initData() async {
    emit(ReservationLoading());
    final sessionResponse = await _userService.getUser().first;
    sessionResponse.fold(
      (failed) => emit(ReservationError(failed)),
      (result) async {
        final response =
            await _reservationService.getReservation(result.id).first;
        response.fold(
          (failed) => emit(ReservationError(failed)),
          (result) => emit(ReservationSuccess(result)),
        );
      },
    );
  }

  Future<bool> checkout(ReservationModel query) async =>
      await _reservationService.checkout(query);
}
