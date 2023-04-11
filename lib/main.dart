import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotelifoz/core/injector.dart' as di;
import 'package:hotelifoz/core/themes/colors.dart';
import 'package:hotelifoz/features/home/presentation/cubit/hotel_cubit.dart';
import 'package:hotelifoz/features/home/presentation/cubit/page_cubit.dart';
import 'package:hotelifoz/features/launch/presentation/pages/splash_page.dart';
import 'package:hotelifoz/routes/routes.dart';

void main() {
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
    BlocProvider<PageCubit>(create: (ctx) => di.locator<PageCubit>()),
    BlocProvider<HotelCubit>(create: (ctx) => di.locator<HotelCubit>()),
  ];
}
