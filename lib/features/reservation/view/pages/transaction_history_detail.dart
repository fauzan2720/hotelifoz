import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hotelifoz/core.dart';
import 'package:hotelifoz/features/reservation/model/models/reservation_model.dart';
import 'package:hotelifoz/features/reservation/view/widgets/detail_info_card.dart';

class TransactionHistoryDetail extends StatelessWidget {
  final ReservationModel history;

  const TransactionHistoryDetail({
    super.key,
    required this.history,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.color.background,
      appBar: AppBar(
        title: const Text("Transaction Detail"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppSizes.primary),
        child: SingleChildScrollView(
          controller: ScrollController(),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: context.color.background,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 16,
                      spreadRadius: 2,
                      color: AppThemes.isDarkMode(context)
                          ? Colors.grey.shade800
                          : Colors.grey.shade300,
                    ),
                  ],
                ),
                child: ListView(
                  padding: const EdgeInsets.all(AppSizes.primary),
                  shrinkWrap: true,
                  children: [
                    // HEADER
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(4.0),
                          child: Stack(
                            children: [
                              Hero(
                                tag: history.id,
                                child: CachedNetworkImage(
                                  imageUrl: history.hotel.imageUrl,
                                  width: 84.0,
                                  height: 84.0,
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) =>
                                      const CircularProgressIndicator(),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                ),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const ImageIcon(
                                        AppIcons.star,
                                        color: AppColors.yellow,
                                        size: 16.0,
                                      ),
                                      4.0.width,
                                      Text(
                                        history.hotel.rating
                                            .toString()
                                            .substring(0, 3),
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
                              width: context.fullWidth - 188.0,
                              child: Text(
                                history.hotel.name,
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
                                  width: context.fullWidth - 214.0,
                                  child: Text(
                                    history.hotel.address,
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
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      child: Divider(),
                    ),

                    // CUSTOMER INFO
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Customer",
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FW.semibold,
                            color: context.color.textPrimary,
                          ),
                        ),
                        16.0.height,
                        DetailInfoCard(
                          label: "Nama Customer",
                          value:
                              "${history.customerStatus} ${history.customerName}",
                        ),
                        DetailInfoCard(
                          label: "Nomor Telepon",
                          value: history.customerPhone,
                        ),
                        DetailInfoCard(
                          label: "Email",
                          value: history.customerEmail,
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      child: Divider(),
                    ),

                    // DETAIL RESERVASI
                    Column(
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
                        16.0.height,
                        DetailInfoCard(
                          label: "Check In",
                          value: history.checkIn,
                        ),
                        DetailInfoCard(
                          label: "Check Out",
                          value: history.checkOut,
                        ),
                        DetailInfoCard(
                          label: "Tamu",
                          value: "${history.guest} orang",
                        ),
                        DetailInfoCard(
                          label: "${history.duration} Malam",
                          value: history.price.currencyFormatIDR,
                        ),
                        DetailInfoCard(
                          label: "Taxes & Fees (10%)",
                          value: history.taxesAndFees.currencyFormatIDR,
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      child: Divider(),
                    ),

                    // DETAIL PEMBAYARAN
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Detail Pembayaran",
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FW.semibold,
                            color: context.color.textPrimary,
                          ),
                        ),
                        16.0.height,
                        Row(
                          children: [
                            Image.asset(
                              history.paymentMethod.iconUrl,
                              width: 70.0,
                              height: 70.0,
                              fit: BoxFit.contain,
                            ),
                            25.0.width,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  history.totalPayment.currencyFormatIDR,
                                  style: const TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FW.semibold,
                                    color: AppColors.primary,
                                  ),
                                ),
                                5.0.height,
                                Text(
                                  history.paymentMethod.name,
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ).animate(delay: 500.ms).scale(),
    );
  }
}
