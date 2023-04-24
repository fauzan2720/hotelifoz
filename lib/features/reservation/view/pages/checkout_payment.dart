import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotelifoz/core.dart';
import 'package:hotelifoz/features/home/model/models/hotel_model.dart';
import 'package:hotelifoz/features/reservation/model/models/checkout_query.dart';
import 'package:hotelifoz/features/reservation/model/models/payment_model.dart';
import 'package:hotelifoz/features/reservation/view/pages/checkout_detail.dart';
import 'package:hotelifoz/features/reservation/view/widgets/scaffold_checkout_info.dart';

class CheckoutPayment extends StatelessWidget {
  final HotelModel hotel;
  final String customerStatus;
  final String customerName;
  final String customerPhone;
  final String customerEmail;

  const CheckoutPayment({
    super.key,
    required this.hotel,
    required this.customerStatus,
    required this.customerName,
    required this.customerPhone,
    required this.customerEmail,
  });

  @override
  Widget build(BuildContext context) {
    int paymentMethodsIndex = context.read<PaymentSelectedCubit>().state;
    final List<PaymentModel> paymentMethods = [
      PaymentModel(
        index: 0,
        name: "Shopee Pay",
        iconUrl: AppImages.shopee,
      ),
      PaymentModel(
        index: 1,
        name: "Go Pay",
        iconUrl: AppImages.gopay,
      ),
      PaymentModel(
        index: 2,
        name: "OVO Pay",
        iconUrl: AppImages.ovo,
      ),
      PaymentModel(
        index: 3,
        name: "DANA",
        iconUrl: AppImages.dana,
      ),
      PaymentModel(
        index: 4,
        name: "Link Aja",
        iconUrl: AppImages.linkAja,
      ),
    ];

    return ScaffoldCheckoutInfo(
      hotel: hotel,
      title: "Pembayaran",
      onNextTap: (state) {
        if (state > 0 && context.read<PaymentSelectedCubit>().state != -1) {
          final CheckoutQuery query = CheckoutQuery(
            hotel: hotel,
            checkIn: context.read<LengthOfStayCubit>().checkInSelected!,
            checkOut: context.read<LengthOfStayCubit>().checkOutSelected!,
            duration: context.read<LengthOfStayCubit>().state,
            guest: context.read<CountGuestCubit>().state,
            customerStatus: customerStatus,
            customerName: customerName,
            customerPhone: customerPhone,
            customerEmail: customerEmail,
            paymentMethod: paymentMethods[paymentMethodsIndex].name,
          );
          context.push(CheckoutDetail(query: query));
        } else {
          "Pastikan data terisi dengan benar".infoBar(context);
        }
      },
      body: ListView.builder(
        padding: const EdgeInsets.all(AppSizes.primary),
        itemCount: paymentMethods.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            paymentMethodsIndex = index;
            context.read<PaymentSelectedCubit>().paymentSelect(index);
          },
          child: _PaymentCard(
            paymentMethods[index],
          ),
        ),
      ),
    );
  }
}

class _PaymentCard extends StatelessWidget {
  final PaymentModel payment;

  const _PaymentCard(this.payment);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentSelectedCubit, int>(
      builder: (context, state) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 7.0),
          padding: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(
              color:
                  state == payment.index ? AppColors.primary : AppColors.stroke,
            ),
          ),
          child: Row(
            children: [
              Image.asset(
                payment.iconUrl,
                height: 30.0,
                width: 30.0,
                fit: BoxFit.contain,
              ),
              12.0.width,
              Text(
                payment.name,
                style: const TextStyle(
                  fontWeight: FW.medium,
                  color: AppColors.dark,
                ),
              ),
              const Spacer(),
              Icon(
                state == payment.index ? Icons.circle : Icons.circle_outlined,
                size: 18.0,
                color: state == payment.index
                    ? AppColors.primary
                    : AppColors.stroke,
              ),
            ],
          ),
        );
      },
    );
  }
}
