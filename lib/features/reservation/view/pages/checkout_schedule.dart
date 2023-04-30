import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotelifoz/core.dart';
import 'package:hotelifoz/features/home/model/models/hotel_model.dart';
import 'package:hotelifoz/features/reservation/view/pages/checkout_customer_detail.dart';
import 'package:hotelifoz/features/reservation/view/widgets/scaffold_checkout_info.dart';

class CheckoutSchedule extends StatelessWidget {
  final HotelModel hotel;

  const CheckoutSchedule({
    super.key,
    required this.hotel,
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
            Text(
              "Tamu",
              style: TextStyle(
                fontWeight: FW.medium,
                color: context.color.textPrimary,
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
                            color: AppColors.white,
                          ),
                        ),
                      ),
                      10.0.width,
                      Container(
                        height: 36.0,
                        width: 36.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: context.color.background,
                          border: Border.all(
                            color: AppColors.primary,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            state.toString(),
                            style: TextStyle(
                              color: context.color.textPrimary,
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
                            color: AppColors.white,
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
