import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotelifoz/core/constants/colors.dart';
import 'package:hotelifoz/core/constants/font_weight.dart';
import 'package:hotelifoz/core/constants/sizes.dart';
import 'package:hotelifoz/core/extensions/int_ext.dart';
import 'package:hotelifoz/core/widgets/form_button.dart';
import 'package:hotelifoz/features/home/model/models/hotel_model.dart';
import 'package:hotelifoz/features/reservation/view_model/count_guest/count_guest_cubit.dart';
import 'package:hotelifoz/features/reservation/view_model/length_of_stay/length_of_stay_cubit.dart';

class ScaffoldCheckoutInfo extends StatelessWidget {
  final HotelModel hotel;
  final String title;
  final void Function(int state) onNextTap;
  final Widget body;

  const ScaffoldCheckoutInfo({
    super.key,
    required this.hotel,
    required this.title,
    required this.onNextTap,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: body,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSizes.primary),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                BlocBuilder<LengthOfStayCubit, int>(
                  builder: (context, state) {
                    return Text(
                      "Total ${(hotel.price * state).currencyFormatRp}",
                      style: const TextStyle(
                        fontWeight: FW.semibold,
                        color: AppColors.primary,
                        fontSize: 18.0,
                      ),
                    );
                  },
                ),
                BlocBuilder<CountGuestCubit, int>(
                  builder: (context, state) {
                    return Text(
                      "$state orang",
                      style: const TextStyle(
                        fontWeight: FW.light,
                        color: AppColors.secondary,
                      ),
                    );
                  },
                ),
              ],
            ),
            BlocBuilder<LengthOfStayCubit, int>(
              builder: (context, state) {
                return FozFormButton(
                  label: "Next",
                  onPressed: () => onNextTap(state),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
