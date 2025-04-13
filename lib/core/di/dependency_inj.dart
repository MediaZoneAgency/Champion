
import 'package:dio/dio.dart';
import 'package:education/feature/cart/data/repo/cart_repo.dart';
import 'package:education/feature/cart/logic/cart_cubit.dart';
import 'package:education/feature/payment/data/repo/payment_repo.dart';
import 'package:education/feature/payment/logic/payment_cubit.dart';
import 'package:education/feature/profile/data/repo/profile_repo.dart';
import 'package:education/feature/search/logic/search_cubit.dart';
import 'package:education/feature/sign_up/logic/sign_up_cubit.dart';
import 'package:education/feature/splash/data/repo/splash_repo.dart';
import 'package:education/feature/splash/logic/splash_cubit.dart';
import 'package:education/feature/wishlist/data/repo/wish_list_repo.dart';
import 'package:education/feature/wishlist/logic/cubit/fav_cubit.dart';
import 'package:get_it/get_it.dart';
import '../../feature/home/data/repo/home_repo.dart';
import '../../feature/home/logic/home_cubit.dart';
import '../../feature/home/logic/product_cubit.dart';
import '../../feature/nav_bar/logic/nav_bar_cubit.dart';
import '../../feature/profile/logic/profile_cubit.dart';
import '../../feature/search/data/repo/search_repo.dart';
import '../../feature/sign_in/data/repo/signin_repo.dart';
import '../../feature/sign_in/logic/sign_in_cubit.dart';
import '../../feature/sign_up/data/repo/sign_up_repo.dart';
import '../network/dio_factory.dart';
import '../theming/theming_change/theme_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async
{

 Dio dio = DioFactory.getDio();
 getIt.registerFactory<SignUpRepo>(() => (SignUpRepo(dio)));
 getIt.registerFactory<SignUpCubit>(() => (SignUpCubit(getIt())));

 getIt.registerFactory<SignInRepo>(() => (SignInRepo(dio)));
 getIt.registerFactory<SignInCubit>(() => (SignInCubit(getIt())));

 getIt.registerFactory<HomeRepo>(() => HomeRepo(dio));
 getIt.registerLazySingleton<HomeCubit>(() => HomeCubit(getIt()));

 getIt.registerLazySingleton<NavBarCubit>(() => NavBarCubit());
getIt.registerFactory<PaymentRepo>(()=>PaymentRepo());
 getIt.registerLazySingleton<PaymentCubit>(() => PaymentCubit(getIt()));
 getIt.registerLazySingleton<ProductCubit>(() => ProductCubit(getIt()));
 getIt.registerFactory<SplashRepo>(() => SplashRepo(dio));
 getIt.registerLazySingleton<SplashCubit>(() => SplashCubit(getIt()));
 getIt.registerFactory<ProfileRepo>(() => ProfileRepo(dio));
 getIt.registerLazySingleton<ProfileCubit>(() => ProfileCubit(getIt()));
 
 getIt.registerFactory<CartRepo>(() => CartRepo(dio));
 getIt.registerLazySingleton<CartCubit>(() => CartCubit(getIt()));

 getIt.registerFactory<SearchRepo>(() => SearchRepo(dio));
 getIt.registerLazySingleton<SearchCubit>(() => SearchCubit(getIt()));

 getIt.registerLazySingleton<FavRepo>(()=>FavRepo(dio));
 getIt.registerLazySingleton<FavCubit>(()=>FavCubit(getIt()));
 getIt.registerLazySingleton<ThemeCubit>(() => ThemeCubit());

 
}