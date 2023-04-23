import 'package:flutter_bloc/flutter_bloc.dart';

class LengthOfStayCubit extends Cubit<int> {
  String? checkInSelected;
  String? checkOutSelected;

  LengthOfStayCubit() : super(0);

  void initial() {
    checkInSelected = null;
    checkOutSelected = null;
    emit(0);
  }

  void checkIn(String checkIn) {
    checkInSelected = checkIn;
    duration();
  }

  void checkOut(String checkOut) {
    checkOutSelected = checkOut;
    duration();
  }

  void duration() {
    if (checkInSelected != null && checkOutSelected != null) {
      final DateTime checkIn = DateTime.parse(checkInSelected!);
      final DateTime checkOut = DateTime.parse(checkOutSelected!);

      Duration difference = checkOut.difference(checkIn);
      int days = difference.inDays;
      emit(days);
    } else {
      emit(0);
    }
  }
}
