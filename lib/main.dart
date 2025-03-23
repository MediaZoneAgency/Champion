import 'package:education/feature/nav_bar/logic/nav_bar_cubit.dart';
import 'package:education/feature/wishlist/logic/cubit/fav_cubit.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sizer/sizer.dart';
import 'core/di/dependency_inj.dart';
import 'core/db/cash_helper.dart';
import 'core/loclization/localization_cubit.dart';
import 'core/routes/approute.dart';
import 'core/routes/routes.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'dart:ui' as ui;
import 'core/theming/theming_change/theme_cubit.dart';
import 'feature/cart/logic/cart_cubit.dart';
import 'feature/home/logic/home_cubit.dart';
import 'feature/home/logic/product_cubit.dart';
import 'firebase_options.dart';
import 'generated/l10n.dart'; // Import the AuthRepository

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CashHelper.init();
  SystemChrome.setPreferredOrientations([

    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await setupGetIt();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(EducationApp(
    appRouter: AppRouter(),
  ));
}

class EducationApp extends StatelessWidget {
  final AppRouter appRouter;

  const EducationApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(

      providers: [
        BlocProvider(create: (context) => LocalizationCubit()),
        BlocProvider<HomeCubit>.value(
          value: getIt<HomeCubit>(),
        ),
        BlocProvider<ProductCubit>.value(
          value: getIt<ProductCubit>(),
        ),
        BlocProvider<CartCubit>.value(
          value: getIt<CartCubit>(),
        ),
        BlocProvider<NavBarCubit>.value(
          value: getIt<NavBarCubit>(),
        ),
        BlocProvider<FavCubit>.value(
          value: getIt<FavCubit>(),
        ),
        BlocProvider<ThemeCubit>.value(
          value: getIt<ThemeCubit>(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        child: BlocBuilder<LocalizationCubit,LocalizationState>(
          builder: (context,localizationState) {
            // Determine the current locale
            Locale currentLocale;
            if (localizationState is LocalizationChanged) {
              currentLocale = localizationState.locale;
            } else {
              // Provide a default locale if no selection has been made
              currentLocale = ui.window.locale; // Default to English
            }

            return BlocBuilder<ThemeCubit, ThemeState>(
              builder: (context, themeState) {
                return MaterialApp(
                  navigatorKey: NavigationService.navigatorKey,
                  locale: currentLocale,
                  theme:   ThemeCubit.get(context).getTheme(),
                  title: 'CHAMPION',
                  debugShowCheckedModeBanner: false,
                  supportedLocales: const [
                    Locale('en'),
                    Locale('ar'),
                  ],
                  localizationsDelegates: const [
                    S.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],

                  initialRoute: Routes.splashScreen,
                  onGenerateRoute: appRouter.generateRoute,
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class NavigationService {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
}
