import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentSelectedCubit extends Cubit<int> {
  PaymentSelectedCubit() : super(-1);

  void paymentSelect(int index) {
    emit(index);
  }
}
