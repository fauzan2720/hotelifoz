import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotelifoz/core.dart';
import 'package:hotelifoz/features/bookmark/view/pages/bookmark_page.dart';
import 'package:hotelifoz/features/home/view/pages/home_page.dart';
import 'package:hotelifoz/features/home/view/widgets/bottom_nav_item.dart';
import 'package:hotelifoz/features/reservation/view/pages/transaction_history.dart';

class MainPage extends StatelessWidget {
  static const String routeName = 'main_page';

  const MainPage({super.key});

  PreferredSizeWidget? _handleAppBar(int currentIndex) {
    switch (currentIndex) {
      case 1:
        return AppBar(
          title: const Text("My Booking"),
        );
      case 2:
        return AppBar(
          title: const Text("Saved Destinations"),
        );
      default:
        return null;
    }
  }

  Widget _handleBody(int currentIndex) {
    switch (currentIndex) {
      case 0:
        return const HomePage();
      case 1:
        return const TransactionHistory();
      case 2:
        return const BookmarkPage();
      case 3:
        return const Center(
          child: Text("Info Page"),
        );
      default:
        return const HomePage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PageCubit, int>(
      builder: (context, state) {
        return Scaffold(
          appBar: _handleAppBar(state),
          body: Padding(
            padding: const EdgeInsets.only(bottom: 80.0),
            child: _handleBody(state),
          ),
          floatingActionButton: Container(
            height: 55.0,
            margin: const EdgeInsets.symmetric(horizontal: AppSizes.primary),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.0),
              color: AppColors.white,
              boxShadow: AppBoxShadow.primary,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                BottomNavItem(
                  index: 0,
                  imageIcon: AppIcons.home,
                ),
                BottomNavItem(
                  index: 1,
                  imageIcon: AppIcons.maps,
                ),
                BottomNavItem(
                  index: 2,
                  imageIcon: AppIcons.bookmark,
                ),
                BottomNavItem(
                  index: 3,
                  imageIcon: AppIcons.info,
                ),
              ],
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
        );
      },
    );
  }
}
