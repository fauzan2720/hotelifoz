import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotelifoz/features/launch/model/models/user_model.dart';
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
    final UserModel session = await _userService.getUser().first;
    final response = await _reservationService.getReservation(session.id).first;
    response.fold(
      (failed) => emit(ReservationError(failed)),
      (result) => emit(ReservationSuccess(result)),
    );
  }

  Future<bool> checkout(ReservationModel query) async =>
      await _reservationService.checkout(query);
}
