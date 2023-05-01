import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotelifoz/core.dart';
import 'package:hotelifoz/features/reservation/model/models/reservation_model.dart';
import 'package:hotelifoz/features/reservation/view/widgets/detail_info_card.dart';

class CheckoutDetail extends StatelessWidget {
  final ReservationModel query;

  const CheckoutDetail({
    super.key,
    required this.query,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(AppSizes.primary),
        child: ListView(
          children: [
            // HEADER
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSizes.radius),
                boxShadow: AppBoxShadow.primary(context),
                color: context.color.background,
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4.0),
                    child: Stack(
                      children: [
                        CachedNetworkImage(
                          imageUrl: query.hotel.imageUrl,
                          width: 84.0,
                          height: 84.0,
                          fit: BoxFit.cover,
                          placeholder: (context, url) =>
                              const CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                        Container(
                          alignment: Alignment.topRight,
                          width: 84.0,
                          child: Container(
                            height: 30.0,
                            width: 45.0,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(12.0),
                              ),
                              color: context.color.background,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const ImageIcon(
                                  AppIcons.star,
                                  color: AppColors.yellow,
                                  size: 16.0,
                                ),
                                4.0.width,
                                Text(
                                  query.hotel.rating.toString().substring(0, 3),
                                  style: TextStyle(
                                    fontWeight: FW.bold,
                                    color: context.color.textPrimary,
                                    fontSize: 12.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  16.0.width,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: context.fullWidth - 164.0,
                        child: Text(
                          query.hotel.name,
                          style: TextStyle(
                            fontWeight: FW.bold,
                            color: context.color.textPrimary,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      8.0.height,
                      Row(
                        children: [
                          const ImageIcon(
                            AppIcons.location,
                            color: AppColors.primary,
                            size: 18.0,
                          ),
                          8.0.width,
                          SizedBox(
                            width: context.fullWidth - 190.0,
                            child: Text(
                              query.hotel.address,
                              style: const TextStyle(
                                color: AppColors.secondary,
                                fontSize: 12.0,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // DETAIL RESERVASI
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSizes.radius),
                boxShadow: AppBoxShadow.primary(context),
                color: context.color.background,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Detail Reservasi",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FW.semibold,
                      color: context.color.textPrimary,
                    ),
                  ),
                  DetailInfoCard(
                    label: "Check In",
                    value: query.checkIn,
                  ),
                  DetailInfoCard(
                    label: "Check Out",
                    value: query.checkOut,
                  ),
                  DetailInfoCard(
                    label: "Tamu",
                    value: "${query.guest} orang",
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSizes.radius),
                boxShadow: AppBoxShadow.primary(context),
                color: context.color.background,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DetailInfoCard(
                    label: "${query.duration} Malam",
                    value: query.price.currencyFormatIDR,
                  ),
                  DetailInfoCard(
                    label: "Taxes & Fees (10%)",
                    value: query.taxesAndFees.currencyFormatIDR,
                  ),
                ],
              ),
            ),

            // DETAIL PEMBAYARAN
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSizes.radius),
                boxShadow: AppBoxShadow.primary(context),
                color: context.color.background,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Detail Pembayaran",
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FW.semibold,
                          color: context.color.textPrimary,
                        ),
                      ),
                      InkWell(
                        onTap: () => context.pop(),
                        child: const Text(
                          "Ubah",
                          style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FW.light,
                            color: AppColors.secondary,
                          ),
                        ),
                      ),
                    ],
                  ),
                  16.0.height,
                  Row(
                    children: [
                      Image.asset(
                        query.paymentMethod.iconUrl,
                        width: 70.0,
                        height: 70.0,
                        fit: BoxFit.contain,
                      ),
                      25.0.width,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            query.totalPayment.currencyFormatIDR,
                            style: const TextStyle(
                              fontSize: 18.0,
                              fontWeight: FW.semibold,
                              color: AppColors.primary,
                            ),
                          ),
                          5.0.height,
                          Text(
                            query.paymentMethod.name,
                            style: const TextStyle(
                              fontWeight: FW.light,
                              color: AppColors.secondary,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ).animate().scale(),
      bottomNavigationBar: FozFormButton(
        label: "Selesaikan Pesanan",
        onPressed: () async {
          final bool response =
              await context.read<ReservationCubit>().checkout(query);
          if (response && context.mounted) {
            context.popToRoot();
            "Reservasi berhasil!".succeedBar(context);
            context.read<PageCubit>().setPage(1);
          } else {
            "Oppss! ada yang salah".failedBar(context);
          }
        },
        width: context.fullWidth,
      ),
    );
  }
}
