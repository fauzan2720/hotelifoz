import 'package:hotelifoz/features/home/presentation/pages/detail_hotel_page.dart';
import 'package:hotelifoz/features/home/presentation/pages/main_page.dart';
import 'package:hotelifoz/features/home/presentation/pages/search_hotel_page.dart';
import 'package:hotelifoz/features/home/presentation/pages/see_all_hotel_page.dart';
import 'package:hotelifoz/features/launch/presentation/pages/splash_page.dart';
import 'package:hotelifoz/features/launch/presentation/pages/welcome_page.dart.dart';
import 'package:hotelifoz/routes/routes.dart';

class Nav {
  static final List<RouteConfig> routes = [
    RouteConfig(
      path: SplashPage.routeName,
      builder: (state) => const SplashPage(),
    ),
    RouteConfig(
      path: WelcomePage.routeName,
      builder: (state) => const WelcomePage(),
    ),
    RouteConfig(
      path: MainPage.routeName,
      builder: (state) => const MainPage(),
    ),
    RouteConfig(
      path: SeeAllHotelPage.routeName,
      builder: (state) {
        final SeeAllHotelPage args = state.arguments as SeeAllHotelPage;
        return SeeAllHotelPage(title: args.title, hotels: args.hotels);
      },
    ),
    RouteConfig(
      path: SearchHotelPage.routeName,
      builder: (state) => const SearchHotelPage(),
    ),
    RouteConfig(
      path: DetailHotelPage.routeName,
      builder: (state) {
        final DetailHotelPage args = state.arguments as DetailHotelPage;
        return DetailHotelPage(item: args.item);
      },
    ),
  ];
}
