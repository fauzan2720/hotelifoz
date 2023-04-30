import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotelifoz/core.dart';
import 'package:hotelifoz/core/utils/injector.dart' as di;
import 'package:hotelifoz/features/home/view/pages/main_page.dart';
import 'package:hotelifoz/features/launch/view/pages/splash_page.dart';
import 'package:hotelifoz/routes/routes.dart';

class App extends StatelessWidget {
  static final ValueNotifier<ThemeMode> themeNotifier =
      ValueNotifier(ThemeMode.light);

  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: themeNotifier,
      builder: (context, value, child) => MultiBlocProvider(
        providers: _providers,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppThemes.lightTheme(context),
          darkTheme: AppThemes.darkTheme(context),
          onGenerateRoute: Routes.generateRoute,
          themeMode: value,
          home: StreamBuilder<User?>(
            stream: FirebaseAuthService().authState,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.connectionState == ConnectionState.done ||
                  snapshot.connectionState == ConnectionState.active) {
                if (snapshot.hasData) {
                  context.read<AuthCubit>().initData();
                  return const MainPage();
                } else {
                  return const SplashPage();
                }
              } else {
                return Center(
                  child: Text('State: ${snapshot.connectionState}'),
                );
              }
            },
          ),
        ),
      ),
    );
  }

  static final List<BlocProvider> _providers = [
    BlocProvider<AuthCubit>(create: (context) => di.locator<AuthCubit>()),
    BlocProvider<PageCubit>(create: (context) => di.locator<PageCubit>()),
    BlocProvider<ThemeModeCubit>(
        create: (context) => di.locator<ThemeModeCubit>()),
    BlocProvider<HotelCubit>(create: (context) => di.locator<HotelCubit>()),
    BlocProvider<SearchCubit>(create: (context) => di.locator<SearchCubit>()),
    BlocProvider<BookmarkCubit>(
        create: (context) => di.locator<BookmarkCubit>()),
    BlocProvider<IsBookmarkCubit>(
        create: (context) => di.locator<IsBookmarkCubit>()),
    BlocProvider<CountGuestCubit>(
        create: (context) => di.locator<CountGuestCubit>()),
    BlocProvider<LengthOfStayCubit>(
        create: (context) => di.locator<LengthOfStayCubit>()),
    BlocProvider<PaymentSelectedCubit>(
        create: (context) => di.locator<PaymentSelectedCubit>()),
    BlocProvider<ReservationCubit>(
        create: (context) => di.locator<ReservationCubit>()),
  ];
}
