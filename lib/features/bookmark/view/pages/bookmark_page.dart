import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotelifoz/core.dart';
import 'package:hotelifoz/features/bookmark/view/widgets/bookmark_card.dart';
import 'package:hotelifoz/features/home/view/pages/detail_hotel_page.dart';

class BookmarkPage extends StatelessWidget {
  const BookmarkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSizes.primary),
        child: BlocBuilder<BookmarkCubit, BookmarkState>(
          builder: (context, state) {
            if (state is BookmarkLoading) {
              return const FozLoading();
            } else if (state is BookmarkError) {
              return FozError(message: "Error: ${state.error}");
            } else if (state is BookmarkSuccess) {
              if (state.data.isEmpty) {
                return const FozEmpty();
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
      ),
    );
  }
}
