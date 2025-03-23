import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:education/core/network/network_constant.dart';
import '../../../../core/error/error_model.dart';
import '../../../../core/error/failure.dart';
import '../../../sign_in/data/models/log_in_respone.dart';
import '../../../sign_in/data/models/login_model.dart';
import '../models/register_model.dart';
import '../models/register_response.dart';


class SignUpRepo {
  final Dio _dio;

  SignUpRepo(this._dio);

  // Registration API Call
  Future<Either<ApiErrorModel, RegisterResponseModel>> register(RegisterRequestModel registerModel) async {
    try {
      final response = await _dio.post( NetworkConstant.register, data: registerModel.toMap());


        return Right(RegisterResponseModel.fromMap(response.data));
    } catch (e) {
      return left(ApiErrorHandler.handle(e));

    }
  }



  // Logout API Call
  // Future<Either<ApiErrorModel, void>> logout(String token) async {
  //   try {
  //     final response = await _dio.post(
  //       NetworkConstant.logout,
  //       options: Options(
  //         headers: {'Authorization': 'Bearer $token'},
  //       ),
  //     );
  //
  //     return const Right(null);
  //   } catch (e) {
  //     return left(ApiErrorHandler.handle(e));
  //
  //   }
  //
  //   }

}