
import 'package:education/core/routes/routes.dart';
import 'package:education/feature/cart/logic/cart_cubit.dart';
import 'package:education/feature/category/ui/screen/field_type_screen.dart';
import 'package:education/feature/category/ui/screen/popular_fields.dart';
import 'package:education/feature/coursedetails/data/models/product_model.dart';
import 'package:education/feature/home/logic/product_cubit.dart';
import 'package:education/feature/profile/ui/screen/account_ifo.dart';
import 'package:education/feature/profile/ui/screen/edit_account.dart';
import 'package:education/feature/profile/ui/screen/profile_screen.dart';
import 'package:education/feature/search/ui/screen/search_result_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../feature/cart/ui/screen/cart_screen.dart';
import '../../feature/cart/ui/screen/checkout_screen.dart';
import '../../feature/coursedetails/ui/screen/details_screen.dart';
import '../../feature/home/logic/home_cubit.dart';
import '../../feature/home/ui/screen/home_screen.dart';
import '../../feature/nav_bar/logic/nav_bar_cubit.dart';
import '../../feature/nav_bar/ui/navigation_bar.dart';
import '../../feature/profile/logic/profile_cubit.dart';
import '../../feature/profile/ui/screen/delete_account_screen.dart';
import '../../feature/profile/ui/screen/setting_screen.dart';
import '../../feature/search/logic/search_cubit.dart';
import '../../feature/search/ui/screen/search_screen.dart';
import '../../feature/sign_in/logic/sign_in_cubit.dart';
import '../../feature/sign_in/ui/screen/forgot_password_screen.dart';
import '../../feature/sign_in/ui/screen/reset_password.dart';
import '../../feature/sign_in/ui/screen/sign_in.dart';
import '../../feature/sign_in/ui/screen/verify_code_screen (1).dart';
import '../../feature/sign_up/logic/sign_up_cubit.dart';
import '../../feature/sign_in/ui/screen/otp_screen.dart';
import '../../feature/sign_up/ui/screen/sign_up.dart';
import '../../feature/splash/view/splashview.dart';
import '../../feature/wishlist/ui/screen/like_screen.dart';
import '../di/dependency_inj.dart';
import '../loclization/localization_cubit.dart';


class AppRouter {
  Route? generateRoute(RouteSettings settings) {
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
      case Routes.homeScreen:
        return MaterialPageRoute(

    builder: (_) =>MultiBlocProvider(
        providers: [
          BlocProvider<HomeCubit>.value(
            value: getIt<HomeCubit>(),
          ),
          BlocProvider<ProductCubit>.value(
            value: getIt<ProductCubit>(),
          ),
          BlocProvider<CartCubit>.value(
            value: getIt<CartCubit>(),
          ),
        ], child: const HomeScreen()),
         );

      case Routes.navBarScreen:
        return MaterialPageRoute(
        builder: (_) =>
               BlocProvider(
                 create: (context) => getIt<NavBarCubit>(),
                 child: const NavigationBarApp()
               ),
         );
       case Routes.loginScreen:
         return MaterialPageRoute(
          builder: (_) =>
               BlocProvider(
                 create: (context) => getIt<SignInCubit>(),
                child: SignInScreen(),
               ),
         );
      case Routes.cartScreen:
        return MaterialPageRoute(
          builder: (_) =>
              BlocProvider(
                create: (context) => getIt<CartCubit>(),
                child: CartScreen(),
              ),
        );
      case Routes.checkoutScreen:
        return MaterialPageRoute(
          builder: (_) =>
              BlocProvider(
                create: (context) => getIt<ProductCubit>(),
                child: CheckoutScreen(),
              ),
        );
      case Routes.wishListScreen:
        return MaterialPageRoute(
          builder: (_) =>
              BlocProvider(
                create: (context) => getIt<ProductCubit>(),
                child: WishListScreen(),
              ),
        );

      case Routes.accountInfoScreen:
        return MaterialPageRoute(
          builder: (_) =>
              BlocProvider(
                create: (context) => getIt<ProductCubit>(),
                child: AccountInfoScreen(),
              ),
        );
      case Routes.editAccountInfoScreen:
        return MaterialPageRoute(
          builder: (_) =>
              BlocProvider(
                create: (context) => getIt<ProductCubit>(),
                child: EditAccountInfoScreen(),
              ),
        );
      case Routes.OTPScreen:
        return MaterialPageRoute(
          builder: (_) =>
              BlocProvider(
                create: (context) => getIt<SignInCubit>(),
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
      case Routes.typeFieldsScreen:
        return MaterialPageRoute(
          builder: (_) => TypeFieldsScreen(type: '',),
        );
      //
      case Routes.DetailsScreen:
         return MaterialPageRoute(
          builder: (_) =>
              BlocProvider(
                create: (context) => getIt<ProductCubit>(),
                child: DetailsScreen( settings.arguments as ProductModel),
              ),
        );

      case Routes.profileScreen:
        return MaterialPageRoute(
          builder: (_) =>
              BlocProvider(
                create: (context) => getIt<ProfileCubit>(),
                child: ProfileScreen(),
              ),
        );

      case Routes.settingsScreen:
        return MaterialPageRoute(
          builder: (_) =>
              BlocProvider(
                create: (context) => getIt<ProfileCubit>(),
                child:const SettingScreen() ,
              ),
        );
      case Routes.deleteAccountScreen:
        return MaterialPageRoute(
          builder: (_) =>
              BlocProvider(
                create: (context) => getIt<ProfileCubit>(),
                child: DeleteAccountScreen(),
              ),
        );

      case Routes.searchScreen:
        return MaterialPageRoute(
          builder: (_) =>
              BlocProvider.value(
                value: getIt<SearchCubit>(),
                child: SearchScreen(),
              ),
        );

      case Routes.resultScreen:
        return MaterialPageRoute(
          builder: (_) =>
              BlocProvider.value(
                value:  getIt<SearchCubit>(),
                child: SearchResultScreen(),
              ),
        );

    return null;
    }
  }
}