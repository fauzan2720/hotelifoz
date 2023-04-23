import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotelifoz/core/constants/colors.dart';
import 'package:hotelifoz/core/constants/font_weight.dart';
import 'package:hotelifoz/core/constants/sizes.dart';
import 'package:hotelifoz/core/extensions/build_context_ext.dart';
import 'package:hotelifoz/core/extensions/double_ext.dart';
import 'package:hotelifoz/core/extensions/string_ext.dart';
import 'package:hotelifoz/core/widgets/form_date_picker.dart';
import 'package:hotelifoz/features/home/model/models/hotel_model.dart';
import 'package:hotelifoz/features/reservation/view/pages/checkout_customer_detail.dart';
import 'package:hotelifoz/features/reservation/view/widgets/scaffold_checkout_info.dart';
import 'package:hotelifoz/features/reservation/view_model/count_guest/count_guest_cubit.dart';
import 'package:hotelifoz/features/reservation/view_model/length_of_stay/length_of_stay_cubit.dart';

class CheckoutSchedule extends StatelessWidget {
  final HotelModel hotel;

  const CheckoutSchedule({
    required this.hotel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    context.read<CountGuestCubit>().initial();
    context.read<LengthOfStayCubit>().initial();

    return ScaffoldCheckoutInfo(
      hotel: hotel,
      title: "Jadwalkan Penginapan",
      onNextTap: (state) {
        if (state > 0) {
          context.push(CheckoutCustomerDetail(
            hotel: hotel,
          ));
        } else {
          "Pastikan data terisi dengan benar".infoBar(context);
        }
      },
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSizes.primary),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            30.0.height,
            Row(
              children: [
                Flexible(
                  child: FormDatePicker(
                    title: "Check In",
                    onChanged: (value) =>
                        context.read<LengthOfStayCubit>().checkIn(value),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(4.0, 20.0, 4.0, 0.0),
                  child: Icon(
                    Icons.arrow_forward,
                    size: 16.0,
                  ),
                ),
                Flexible(
                  child: FormDatePicker(
                    title: "Check Out",
                    onChanged: (value) =>
                        context.read<LengthOfStayCubit>().checkOut(value),
                  ),
                ),
              ],
            ),
            20.0.height,
            const Text(
              "Tamu",
              style: TextStyle(
                fontWeight: FW.medium,
                color: AppColors.dark,
              ),
            ),
            8.0.height,
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                border: Border.all(color: AppColors.stroke),
              ),
              child: BlocBuilder<CountGuestCubit, int>(
                builder: (context, state) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 36.0,
                        width: 36.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: state == 1
                              ? AppColors.secondary
                              : AppColors.primary,
                        ),
                        child: InkWell(
                          onTap: () =>
                              context.read<CountGuestCubit>().reduceGuest(),
                          child: const Icon(
                            Icons.remove,
                            size: 24.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      10.0.width,
                      Container(
                        height: 36.0,
                        width: 36.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: AppColors.white,
                          border: Border.all(
                            color: AppColors.primary,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            state.toString(),
                            style: const TextStyle(
                              color: AppColors.dark,
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      ),
                      10.0.width,
                      Container(
                        height: 36.0,
                        width: 36.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: AppColors.primary,
                        ),
                        child: InkWell(
                          onTap: () =>
                              context.read<CountGuestCubit>().addGuest(),
                          child: const Icon(
                            Icons.add,
                            size: 24.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
