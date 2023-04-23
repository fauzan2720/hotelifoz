import 'package:flutter_bloc/flutter_bloc.dart';

class CountGuestCubit extends Cubit<int> {
  CountGuestCubit() : super(1);

  void initial() {
    emit(1);
  }

  void addGuest() {
    emit(state + 1);
  }

  void reduceGuest() {
    if (state > 1) {
      emit(state - 1);
    }
  }
}
