
import 'package:dio/dio.dart';
import 'package:education/feature/sign_up/logic/sign_up_cubit.dart';
import 'package:get_it/get_it.dart';
import '../../feature/home/data/repo/home_repo.dart';
import '../../feature/home/logic/home_cubit.dart';
import '../../feature/sign_in/data/repo/signin_repo.dart';
import '../../feature/sign_in/logic/sign_in_cubit.dart';
import '../../feature/sign_up/data/repo/sign_up_repo.dart';
import '../network/dio_factory.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async
{

 Dio dio = DioFactory.getDio();
 getIt.registerFactory<SignUpRepo>(() => (SignUpRepo(dio)));
 getIt.registerFactory<SignUpCubit>(() => (SignUpCubit(getIt())));
 getIt.registerFactory<SignInRepo>(() => (SignInRepo(dio)));
 getIt.registerFactory<SignInCubit>(() => (SignInCubit(getIt())));
 getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(dio));
 getIt.registerLazySingleton<HomeCubit>(() => HomeCubit(getIt()));
}