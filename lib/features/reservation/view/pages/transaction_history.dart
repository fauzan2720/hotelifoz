import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotelifoz/core.dart';
import 'package:hotelifoz/features/reservation/model/models/reservation_model.dart';
import 'package:hotelifoz/features/reservation/view/pages/transaction_history_detail.dart';

class TransactionHistory extends StatelessWidget {
  const TransactionHistory({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<ReservationCubit>().initData();

    return BlocBuilder<ReservationCubit, ReservationState>(
      builder: (context, state) {
        if (state is ReservationLoading) {
          return const FozLoading();
        } else if (state is ReservationError) {
          return FozError(message: "Error: ${state.error}");
        } else if (state is ReservationSuccess) {
          if (state.data.isEmpty) {
            return const FozEmpty();
          } else {
            return ListView.builder(
              itemCount: state.data.length,
              padding: const EdgeInsets.symmetric(horizontal: AppSizes.primary),
              itemBuilder: (context, index) {
                final ReservationModel history = state.data[index];

                return GestureDetector(
                  onTap: () {
                    context.push(TransactionHistoryDetail(history: history));
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    padding: const EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppSizes.radius),
                      boxShadow: AppBoxShadow.primary,
                      color: AppColors.white,
                    ),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(4.0),
                          child: Stack(
                            children: [
                              CachedNetworkImage(
                                imageUrl: history.hotel.imageUrl,
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
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(12.0),
                                    ),
                                    color: AppColors.white,
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
                                        style: const TextStyle(
                                          fontWeight: FW.bold,
                                          color: AppColors.dark,
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
                                style: const TextStyle(
                                  fontWeight: FW.bold,
                                  color: AppColors.dark,
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
                        const Icon(Icons.chevron_right),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        } else {
          return Container();
        }
      },
    );
  }
}
