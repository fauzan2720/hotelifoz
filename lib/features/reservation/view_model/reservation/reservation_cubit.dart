import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotelifoz/features/reservation/model/models/checkout_query.dart';

import 'package:hotelifoz/features/reservation/model/models/reservation_model.dart';
import 'package:hotelifoz/features/reservation/model/services/reservation_service.dart';

part 'reservation_state.dart';

class ReservationCubit extends Cubit<ReservationState> {
  final ReservationService _service;

  ReservationCubit(
    this._service,
  ) : super(ReservationInitial());

  int taxesAndFees(int price) => (price * (10 / 100)).toInt();

  int totalPayment(int price) => price + taxesAndFees(price);

  Future<bool> checkout(CheckoutQuery query) async =>
      await _service.checkout(query);
}
