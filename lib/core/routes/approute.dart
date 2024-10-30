
import 'package:education/core/routes/routes.dart';
import 'package:education/feature/category/ui/screen/popular_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../feature/sign_in/logic/sign_in_cubit.dart';
import '../../feature/sign_in/ui/screen/forgot_password_screen.dart';
import '../../feature/sign_in/ui/screen/reset_password.dart';
import '../../feature/sign_in/ui/screen/sign_in.dart';
import '../../feature/sign_up/logic/sign_up_cubit.dart';
import '../../feature/sign_up/ui/screen/otp_screen.dart';
import '../../feature/sign_up/ui/screen/sign_up.dart';
import '../../feature/splash/view/splashview.dart';
import '../di/dependency_inj.dart';


class AppRouter {
  Route generateRoute(RouteSettings settings) {
    //this arguments to be passed in any screen like this ( arguments as ClassName )
    //final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.splashScreen:
         return MaterialPageRoute(
         builder: (_) => const SplashView(),
        );
      //
      case Routes.signUpScreen:
     return MaterialPageRoute(
         builder: (_) =>
             BlocProvider(
              create: (context) => getIt<SignUpCubit>(),
             child: SignUpScreen(),
           ),
        );
      // case Routes.homeScreen:
      //   return MaterialPageRoute(
      //     builder: (_) =>
      //         BlocProvider<HomeCubit>.value(
      //           value: getIt<HomeCubit>(),
      //           child: HomeScreen(),
      //         ),
      //   );
      // case Routes.navBarScreen:
      //   return MaterialPageRoute(
      //     builder: (_) =>
      //         BlocProvider(
      //           create: (context) => getIt<NavBarCubit>(),
      //           child: const NavigationBarApp()
      //         ),
      //   );
       case Routes.loginScreen:
         return MaterialPageRoute(
          builder: (_) =>
               BlocProvider(
                 create: (context) => getIt<SignInCubit>(),
                child: SignInScreen(),
               ),
         );
      case Routes.OTPScreen:
        return MaterialPageRoute(
          builder: (_) =>
              BlocProvider(
                create: (context) => getIt<SignUpCubit>(),
                child: VerifyCode(),
              ),
        );
      case Routes.forgetPasswordScreen:
        return MaterialPageRoute(
          builder: (_) =>
              BlocProvider(
                create: (context) => getIt<SignInCubit>(),
                child: ForgetPasswordScreen(),
              ),
        );
      case Routes.resetPasswordScreen:
        return MaterialPageRoute(
          builder: (_) =>
              BlocProvider(
                create: (context) => getIt<SignInCubit>(),
                child: ResetPasswordScreen(),
              ),
        );

       case Routes.fieldScreen:
         return MaterialPageRoute(
         builder: (_) =>  FieldsScreen(),
       );
      //
      // case Routes.resetPasswordScreen:
      //   return MaterialPageRoute(
      //     builder: (_) => const ResetPassword(),
      //   );
      // case Routes.unitDetailsScreen:
      //   return MaterialPageRoute(
      //     builder: (_) =>
      //         BlocProvider(
      //           create: (context) => getIt<AuthCubit>(),
      //           child: UnitDetailsScreen(unit: settings.arguments as UnitModel,),
      //         ),
      //   );
      default:
        return MaterialPageRoute(
          builder: (_) =>
              Scaffold(
                body: Center(
                  child: Text('No route defined for ${settings.name}'),
                ),
              ),
        );
    }
  }
}