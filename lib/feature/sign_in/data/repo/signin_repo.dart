import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:education/core/network/network_constant.dart';
import '../../../../core/error/error_model.dart';
import '../../../../core/error/failure.dart';
import '../../../sign_in/data/models/log_in_respone.dart';
import '../../../sign_in/data/models/login_model.dart';
import '../models/otp_model.dart';
import '../models/reset_password_model.dart';

class SignInRepo {
  final Dio _dio;

  SignInRepo(this._dio);

  Future<Either<ApiErrorModel, LoginResponseModel>> login(LoginModel loginModel) async {
    try {
      final response = await _dio.post(NetworkConstant.login, data: loginModel.toMap());


        return Right(LoginResponseModel.fromMap(response.data));

    } catch (e) {
      return left(ApiErrorHandler.handle(e));

    }
  }
  Future<Either<ApiErrorModel, String >> forgetpassword({
    required String email,
  }) async {
    try {
      Response response =
      await _dio.post(NetworkConstant.otpsend, data: {"email":email});
      return Right(response.data['message']);
    }catch (e) {
      return Left(ApiErrorHandler.handle(e));
    }
  }
  Future<Either<ApiErrorModel, String>> resendCode({
    required String email,
  }) async {
    try {
      Response response =
      await _dio.post(NetworkConstant.otpResend, data: {"email":email});
      return Right(response.data['message']);
    }catch (e) {
      return Left(ApiErrorHandler.handle(e));
    }
  }

  Future<Either<ApiErrorModel, String>> otp({
    required OtpModel otpModel,
  }) async {
    try {
      Response response =
      await _dio.post(NetworkConstant.otpValidate, data: otpModel.toMap());
      return Right(response.data['message']);
    }catch (e) {
      return Left(ApiErrorHandler.handle(e));
    }
  }

  Future<Either<ApiErrorModel, String>> resetPssword({
    required ResetPasswordModel resetPasswordModel,
  }) async {
    try {
      Response response =
      await _dio.post(NetworkConstant.resetPassword, data: resetPasswordModel.toMap());
      return Right(response.data['message']);
    }catch (e) {
      return Left(ApiErrorHandler.handle(e));
    }
  }
}
