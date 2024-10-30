import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:education/core/network/network_constant.dart';
import '../../../../core/error/error_model.dart';
import '../../../../core/error/failure.dart';
import '../../../sign_in/data/models/log_in_respone.dart';
import '../../../sign_in/data/models/login_model.dart';

class SignInRepo {
  final Dio _dio;

  SignInRepo(this._dio);

  Future<Either<ApiErrorModel, LoginResponseModel>> login(LogInModel loginModel) async {
    try {
      final response = await _dio.post(NetworkConstant.login, data: loginModel.toMap());


        return Right(LoginResponseModel.fromMap(response.data));

    } catch (e) {
      return left(ApiErrorHandler.handle(e));

    }
  }
}
