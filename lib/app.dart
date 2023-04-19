import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotelifoz/core/utils/injector.dart' as di;
import 'package:hotelifoz/core/constants/colors.dart';
import 'package:hotelifoz/features/bookmark/view_model/bookmark/bookmark_cubit.dart';
import 'package:hotelifoz/features/bookmark/view_model/is_bookmark/is_bookmark_cubit.dart';
import 'package:hotelifoz/features/home/view_model/hotel/hotel_cubit.dart';
import 'package:hotelifoz/features/home/view_model/page/page_cubit.dart';
import 'package:hotelifoz/features/home/view_model/search/search_cubit.dart';
import 'package:hotelifoz/features/launch/view/pages/splash_page.dart';
import 'package:hotelifoz/routes/routes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: _providers,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          scaffoldBackgroundColor: AppColors.white,
          textTheme: GoogleFonts.openSansTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        initialRoute: SplashPage.routeName,
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }

  static final List<BlocProvider> _providers = [
    BlocProvider<PageCubit>(create: (context) => di.locator<PageCubit>()),
    BlocProvider<HotelCubit>(create: (context) => di.locator<HotelCubit>()),
    BlocProvider<SearchCubit>(create: (context) => di.locator<SearchCubit>()),
    BlocProvider<BookmarkCubit>(
        create: (context) => di.locator<BookmarkCubit>()),
    BlocProvider<IsBookmarkCubit>(
        create: (context) => di.locator<IsBookmarkCubit>()),
  ];
}
