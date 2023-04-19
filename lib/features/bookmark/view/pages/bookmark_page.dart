import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotelifoz/core/extensions/build_context_ext.dart';
import 'package:hotelifoz/core/extensions/double_ext.dart';
import 'package:hotelifoz/core/constants/colors.dart';
import 'package:hotelifoz/core/constants/font_weight.dart';
import 'package:hotelifoz/core/constants/sizes.dart';
import 'package:hotelifoz/core/widgets/error.dart';
import 'package:hotelifoz/core/widgets/loading.dart';
import 'package:hotelifoz/features/bookmark/view_model/bookmark/bookmark_cubit.dart';
import 'package:hotelifoz/features/bookmark/view_model/is_bookmark/is_bookmark_cubit.dart';
import 'package:hotelifoz/features/bookmark/view/widgets/bookmark_card.dart';
import 'package:hotelifoz/features/home/view/pages/detail_hotel_page.dart';

class BookmarkPage extends StatelessWidget {
  const BookmarkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSizes.primary),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            50.0.height,
            const Text(
              "Saved Destinations",
              style: TextStyle(
                color: AppColors.dark,
                fontSize: 16.0,
                fontWeight: FW.bold,
              ),
            ),
            20.0.height,
            BlocBuilder<BookmarkCubit, BookmarkState>(
              builder: (context, state) {
                if (state is BookmarkLoading) {
                  return const FozLoading();
                } else if (state is BookmarkError) {
                  return FozError(message: "Error: ${state.error}");
                } else if (state is BookmarkSuccess) {
                  if (state.data.isEmpty) {
                    return const Center(
                      heightFactor: 40.0,
                      child: Text("Data Kosong"),
                    );
                  } else {
                    return ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      reverse: true,
                      itemCount: state.data.length,
                      itemBuilder: (context, index) {
                        return BookmarkCard(
                          item: state.data[index],
                          onBookmarkTap: (item) {
                            context.read<BookmarkCubit>().saveBookmark(item);
                            context.read<IsBookmarkCubit>().isBookmark(item);
                          },
                          onSelectedItem: (item) => context.pushNamed(
                            DetailHotelPage.routeName,
                            DetailHotelPage(item: item),
                          ),
                        );
                      },
                    );
                  }
                } else {
                  return Container();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
