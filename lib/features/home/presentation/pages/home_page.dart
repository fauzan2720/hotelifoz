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
import 'package:hotelifoz/features/home/presentation/pages/detail_hotel_page.dart';
import 'package:hotelifoz/features/home/presentation/pages/search_hotel_page.dart';
import 'package:hotelifoz/features/home/presentation/pages/see_all_hotel_page.dart';
import 'package:hotelifoz/features/home/presentation/widgets/nearby_card.dart';
import 'package:hotelifoz/features/home/presentation/widgets/popular_card.dart';
import 'package:hotelifoz/features/home/presentation/widgets/title_in_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        30.0.height,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSizes.primary),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Current location",
                    style: TextStyle(
                      fontSize: 12.0,
                      color: AppColors.secondary,
                    ),
                  ),
                  4.0.height,
                  Row(
                    children: [
                      const ImageIcon(
                        AppIcons.location,
                        color: AppColors.primary,
                      ),
                      8.0.width,
                      const Text(
                        "Jember, Jawa Timur",
                        style: TextStyle(
                          color: AppColors.dark,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              IconButton(
                onPressed: () {},
                icon: const ImageIcon(AppIcons.theme),
              ),
            ],
          ),
        ),
        24.0.height,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSizes.primary),
          child: FozFormInput(
            hint: "Search Hotel",
            icon: const ImageIcon(
              AppIcons.search,
              color: AppColors.secondary,
            ),
            onTap: () => context.pushNamed(SearchHotelPage.routeName),
          ),
        ),
        30.0.height,
        BlocBuilder<HotelCubit, HotelState>(
          builder: (context, state) {
            if (state is HotelLoading) {
              return const FozLoading();
            } else if (state is HotelError) {
              return FozError(message: state.error);
            } else if (state is HotelSuccess) {
              return Column(
                children: [
                  TitleInCard(
                    title: "Nearby your location",
                    onSeeAllTap: () => context.pushNamed(
                      SeeAllHotelPage.routeName,
                      SeeAllHotelPage(
                        title: "Nearby your location",
                        hotels: state.nearby,
                      ),
                    ),
                  ),
                  16.0.height,
                  SizedBox(
                    height: 310.0,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: 9,
                      padding: const EdgeInsets.symmetric(
                          horizontal: AppSizes.primary - 8.0),
                      itemBuilder: (context, index) {
                        return NearbyCard(
                          item: state.nearby[index],
                          onSelectedItem: (item) => context.pushNamed(
                            DetailHotelPage.routeName,
                            DetailHotelPage(item: item),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            } else {
              return Container();
            }
          },
        ),
        24.0.height,
        BlocBuilder<HotelCubit, HotelState>(
          builder: (context, state) {
            if (state is HotelLoading) {
              return const FozLoading();
            } else if (state is HotelError) {
              return FozError(message: state.error);
            } else if (state is HotelSuccess) {
              return Column(
                children: [
                  TitleInCard(
                    title: "Popular Destination",
                    onSeeAllTap: () => context.pushNamed(
                      SeeAllHotelPage.routeName,
                      SeeAllHotelPage(
                        title: "Popular Destination",
                        hotels: state.popular,
                      ),
                    ),
                  ),
                  8.0.height,
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 6,
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppSizes.primary - 8.0),
                    itemBuilder: (context, index) {
                      return PopularCard(
                        item: state.popular[index],
                        onSelectedItem: (item) => context.pushNamed(
                          DetailHotelPage.routeName,
                          DetailHotelPage(item: item),
                        ),
                      );
                    },
                  ),
                ],
              );
            } else {
              return Container();
            }
          },
        ),
      ],
    );
  }
}
