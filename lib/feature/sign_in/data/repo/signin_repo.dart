import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../../core/error/failure.dart';
import '../../../sign_in/data/models/log_in_respone.dart';
import '../../../sign_in/data/models/login_model.dart';


class SignInRepo {
  final Dio _dio ;

  SignInRepo(this._dio);

  Future<Either<Failure, LoginResponseModel>> login(LogInModel loginModel) async {
    try {
      final response = await _dio.post('/login', data: loginModel.toMap());

      if (response.statusCode == 200 || response.statusCode == 201) {
        print("rrrrrrrr");
        return Right(LoginResponseModel.fromMap(response.data));
      } else {
        // Handle unexpected status codes if any
        print("hhhhhhhhh");
        return left(ServerFailure('Unexpected status code: ${response.statusCode}'));
      }
    } catch (e) {
      print("llllllllll");

      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }


  }


  // Logout API Call with Status Code Handling


  // A helper function to handle errors based on status code
  static void _handleError(int statusCode, dynamic data) {
    switch (statusCode) {
      case 400:
        print('Bad Request: $data');
        break;
      case 401:
        print('Unauthorized: Please check your credentials.');
        break;
      case 403:
        print('Forbidden: You do not have access.');
        break;
      case 404:
        print('Not Found: The requested resource does not exist.');
        break;
      case 500:
        print('Internal Server Error: Something went wrong on the server.');
        break;
      default:
        print('Received unknown error with status code $statusCode: $data');
    }
  }
}
