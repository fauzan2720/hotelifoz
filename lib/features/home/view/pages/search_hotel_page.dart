import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotelifoz/core.dart';
import 'package:hotelifoz/features/home/view/pages/detail_hotel_page.dart';
import 'package:hotelifoz/features/home/view/pages/see_all_hotel_page.dart';

class SearchHotelPage extends StatelessWidget {
  static const String routeName = 'search_hotel_page';

  const SearchHotelPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();
    final HotelState hotelState = context.read<HotelCubit>().state;

    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(AppSizes.primary),
        children: [
          30.0.height,
          FozFormInput(
            controller: searchController,
            hint: "Search Hotel",
            icon: const ImageIcon(
              AppIcons.search,
              color: AppColors.secondary,
            ),
            isBackPage: true,
            autofocus: true,
            onChanged: (value) {
              context.read<SearchCubit>().searchHotel(value);
            },
          ),
          16.0.height,
          Row(
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
                    hotels: hotelState is HotelSuccess ? hotelState.nearby : [],
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
                    hotels:
                        hotelState is HotelSuccess ? hotelState.popular : [],
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
                    hotels:
                        hotelState is HotelSuccess ? hotelState.lowBudget : [],
                  ),
                ),
                child: const Text("Low Budget"),
              ),
            ],
          ),
          4.0.height,
          const Divider(),
          BlocBuilder<SearchCubit, SearchState>(
            builder: (context, state) {
              if (state is SearchLoading) {
                return const FozLoading();
              } else if (state is SearchError) {
                return FozError(message: state.error);
              } else if (state is SearchEmpty) {
                return const FozEmpty();
              } else if (state is SearchResult) {
                return Column(
                  children: state.result
                      .map((item) => InkWell(
                            onTap: () => context.pushReplacementNamed(
                              DetailHotelPage.routeName,
                              DetailHotelPage(item: item),
                            ),
                            child: ListTile(
                              leading: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: CachedNetworkImage(
                                  imageUrl: item.imageUrl,
                                ),
                              ),
                              title: Text(item.name),
                              subtitle: Text(item.address),
                            ),
                          ))
                      .toList(),
                );
              } else {
                return Container();
              }
            },
          ),
        ],
      ),
    );
  }
}
