import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotelifoz/core.dart';
import 'package:hotelifoz/features/bookmark/view/pages/bookmark_page.dart';
import 'package:hotelifoz/features/home/view/pages/home_page.dart';
import 'package:hotelifoz/features/home/view/pages/profile_page.dart';
import 'package:hotelifoz/features/home/view/widgets/bottom_nav_item.dart';
import 'package:hotelifoz/features/reservation/view/pages/transaction_history.dart';

class MainPage extends StatelessWidget {
  static const String routeName = 'main_page';

  const MainPage({super.key});

  PreferredSizeWidget? _handleAppBar(int currentIndex) {
    switch (currentIndex) {
      case 1:
        return AppBar(
          title: const Text("My Booking").animate().fadeIn(),
        );
      case 2:
        return AppBar(
          title: const Text("Saved Destinations").animate().fadeIn(),
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
        return const ProfilePage();
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
              color: context.color.background,
              boxShadow: AppBoxShadow.primary(context),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const BottomNavItem(
                  index: 0,
                  imageIcon: AppIcons.home,
                ),
                const BottomNavItem(
                  index: 1,
                  imageIcon: AppIcons.maps,
                ),
                const BottomNavItem(
                  index: 2,
                  imageIcon: AppIcons.bookmark,
                ),
                BlocBuilder<AuthCubit, AuthState>(
                  builder: (context, state) {
                    if (state is AuthSuccess) {
                      return BottomNavItem(
                        index: 3,
                        imageNetworkIcon: state.data.photo,
                      );
                    } else {
                      return const BottomNavItem(
                        index: 3,
                        imageIcon: AppIcons.info,
                      );
                    }
                  },
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
