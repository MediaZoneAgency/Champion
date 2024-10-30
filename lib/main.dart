
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sizer/sizer.dart';
import 'core/di/dependency_inj.dart';
import 'core/routes/approute.dart';
import 'core/routes/routes.dart';

import 'package:flutter_localizations/flutter_localizations.dart';

import 'generated/l10n.dart';  // Import the AuthRepository

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await CashHelper.init();

  await setupGetIt();
  runApp(EducationApp(
    appRouter: AppRouter(),
  ));
}

class EducationApp extends StatelessWidget {
  final AppRouter appRouter;

  const EducationApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: Sizer(
          builder: (context, orientation, deviceType) {
            return MaterialApp(
              navigatorKey: NavigationService.navigatorKey	,
              locale: const Locale('en'),
              theme: ThemeData(),
              title: 'Broker',
              debugShowCheckedModeBanner: false,
              localizationsDelegates: [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
              initialRoute: Routes.splashScreen,
              onGenerateRoute: appRouter.generateRoute,
            );
          }
      ),
    );
  }
}
class NavigationService {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
}