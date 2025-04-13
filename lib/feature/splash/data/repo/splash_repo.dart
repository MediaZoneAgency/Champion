import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';


class SplashRepo {
  Dio dio;
  SplashRepo(
     this.dio,
  );

Future<Either<void, void>> checkToken(String token) async {
    try {
      dio.post('custom-api/v1/manual-validate',data: {"token":token});
      return const Right("welcome");
    } catch (e) {
   return   const Left("error");
    }
  }

}