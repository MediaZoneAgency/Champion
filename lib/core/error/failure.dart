import 'package:dio/dio.dart';
abstract class Failure {
  final String errMessage;

  const Failure(this.errMessage);
}
class ServerFailure extends Failure {
  ServerFailure(super.errMessage);
  factory ServerFailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with ApiServer');

      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout with ApiServer');

      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout with ApiServer');

      case DioExceptionType.badResponse:
      // Check if dioError.response is not null before accessing it
        if (dioError.response != null) {
          return ServerFailure.fromResponse(
              dioError.response!.statusCode, dioError.response!.data);
        } else {
          return ServerFailure('Received invalid response from ApiServer');
        }

      case DioExceptionType.cancel:
        return ServerFailure('Request to ApiServer was canceled');

      case DioExceptionType.unknown:
      // Check if dioError.message is not null
        if (dioError.message != null && dioError.message!.contains('SocketException')) {
          return ServerFailure('No Internet Connection');
        }
        return ServerFailure('Unexpected Error, Please try again!');

      default:
        return ServerFailure('Oops, There was an Error, Please try again');
    }
  }

  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response != null && response['message'] != null
          ? response['message']
          : 'email or password is not correct');
    } else if (statusCode == 404) {
      return ServerFailure('Your request not found, Please try later!');
    } else if (statusCode == 500) {
      return ServerFailure('Internal Server error, Please try later');
    } else {
      return ServerFailure('Oops, There was an Error, Please try againn');
    }
  }

}