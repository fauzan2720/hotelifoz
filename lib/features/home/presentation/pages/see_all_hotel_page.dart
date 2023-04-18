import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:hotelifoz/core/extensions/build_context_ext.dart';
import 'package:hotelifoz/core/extensions/double_ext.dart';
import 'package:hotelifoz/core/constants/colors.dart';
import 'package:hotelifoz/core/constants/font_weight.dart';
import 'package:hotelifoz/core/constants/icons.dart';
import 'package:hotelifoz/core/constants/sizes.dart';
import 'package:hotelifoz/core/widgets/form_input.dart';
import 'package:hotelifoz/features/home/domain/entities/hotel_entity.dart';
import 'package:hotelifoz/features/home/presentation/pages/detail_hotel_page.dart';
import 'package:hotelifoz/features/home/presentation/pages/search_hotel_page.dart';
import 'package:hotelifoz/features/home/presentation/widgets/see_all_hotel_card.dart';

class SeeAllHotelPage extends StatelessWidget {
  static const String routeName = 'see_all_page';
  final String title;
  final List<HotelEntity> hotels;

  const SeeAllHotelPage({
    required this.title,
    required this.hotels,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          30.0.height,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSizes.primary),
            child: FozFormInput(
              hint: "Search Hotel",
              icon: const ImageIcon(
                AppIcons.search,
                color: AppColors.secondary,
              ),
              isBackPage: true,
              onTap: () => context.pushNamed(SearchHotelPage.routeName),
            ),
          ),
          30.0.height,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSizes.primary),
            child: Text(
              title,
              style: const TextStyle(
                color: AppColors.dark,
                fontSize: 16.0,
                fontWeight: FW.bold,
              ),
            ),
          ),
          20.0.height,
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: AppSizes.primary - 5.0),
            child: MasonryGridView.count(
              shrinkWrap: true,
              controller: ScrollController(),
              itemCount: hotels.length,
              primary: false,
              crossAxisCount: 2,
              mainAxisSpacing: 4,
              crossAxisSpacing: 4,
              itemBuilder: (context, index) {
                return SeeAllHotelCard(
                  width: context.fullWidth / 2,
                  height: index % 2 == 1 ? 250 : 200,
                  item: hotels[index],
                  onSelectedItem: (item) {
                    context.pushNamed(
                      DetailHotelPage.routeName,
                      DetailHotelPage(item: item),
                    );
                  },
                );
              },
            ),
          ),
          30.0.height,
        ],
      ),
    );
  }
}
