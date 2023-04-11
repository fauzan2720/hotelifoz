import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotelifoz/core/extensions/build_context_ext.dart';
import 'package:hotelifoz/core/extensions/double_ext.dart';
import 'package:hotelifoz/core/themes/colors.dart';
import 'package:hotelifoz/core/themes/icons.dart';
import 'package:hotelifoz/core/themes/sizes.dart';
import 'package:hotelifoz/core/widgets/error.dart';
import 'package:hotelifoz/core/widgets/form_input.dart';
import 'package:hotelifoz/core/widgets/loading.dart';
import 'package:hotelifoz/features/home/presentation/cubit/hotel_cubit.dart';
import 'package:hotelifoz/features/home/presentation/pages/see_all_hotel_page.dart';

class SearchHotelPage extends StatelessWidget {
  static const String routeName = 'search_hotel_page';

  const SearchHotelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(AppSizes.primary),
        children: [
          30.0.height,
          const FozFormInput(
            hint: "Search Hotel",
            icon: ImageIcon(
              AppIcons.search,
              color: AppColors.secondary,
            ),
            isBackPage: true,
          ),
          16.0.height,
          BlocBuilder<HotelCubit, HotelState>(
            builder: (context, state) {
              if (state is HotelLoading) {
                return const FozLoading();
              } else if (state is HotelError) {
                return FozError(message: state.error);
              } else if (state is HotelSuccess) {
                return Row(
                  children: [
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: AppColors.secondary,
                        side: const BorderSide(
                          color: AppColors.stroke,
                        ),
                      ),
                      onPressed: () => context.pushReplacementNamed(
                        SeeAllHotelPage.routeName,
                        SeeAllHotelPage(
                          title: "Nearby your location",
                          hotels: state.nearby,
                        ),
                      ),
                      child: const Text("Nearby"),
                    ),
                    8.0.width,
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: AppColors.secondary,
                        side: const BorderSide(
                          color: AppColors.stroke,
                        ),
                      ),
                      onPressed: () => context.pushReplacementNamed(
                        SeeAllHotelPage.routeName,
                        SeeAllHotelPage(
                          title: "Popular Destination",
                          hotels: state.popular,
                        ),
                      ),
                      child: const Text("Popular"),
                    ),
                    8.0.width,
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: AppColors.secondary,
                        side: const BorderSide(
                          color: AppColors.stroke,
                        ),
                      ),
                      onPressed: () => context.pushReplacementNamed(
                        SeeAllHotelPage.routeName,
                        SeeAllHotelPage(
                          title: "Low Budget",
                          hotels: state.lowBudget,
                        ),
                      ),
                      child: const Text("Low Budget"),
                    ),
                  ],
                );
              } else {
                return Container();
              }
            },
          ),
          4.0.height,
          const Divider(),
          16.0.height,
          const Text(
            "Recent",
            style: TextStyle(
              fontSize: 16.0,
              color: AppColors.dark,
            ),
          ),
          ListView.builder(
            itemCount: 5,
            shrinkWrap: true,
            itemBuilder: (context, index) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "The Aston Vill Hotel",
                  style: TextStyle(color: AppColors.secondary),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const ImageIcon(AppIcons.close),
                  color: AppColors.secondary,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
