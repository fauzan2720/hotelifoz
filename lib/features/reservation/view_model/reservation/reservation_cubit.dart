import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotelifoz/features/reservation/model/models/reservation_model.dart';
import 'package:hotelifoz/features/reservation/model/services/reservation_service.dart';

part 'reservation_state.dart';

class ReservationCubit extends Cubit<ReservationState> {
  final ReservationService _service;

  ReservationCubit(
    this._service,
  ) : super(ReservationInitial());

  void initData() async {
    emit(ReservationLoading());
    try {
      final response = await _service.getReservationStream().first;
      final List<ReservationModel> result = response.docs
          .map((reservation) => ReservationModel.fromMap(
              reservation.data() as Map<String, dynamic>))
          .toList();
      result.sort(
        (a, b) => b.createdAt!.compareTo(a.createdAt!),
      );
      emit(ReservationSuccess(result));
    } catch (e) {
      emit(ReservationError(e.toString()));
    }
  }

  Future<bool> checkout(ReservationModel query) async =>
      await _service.checkout(query);
}
