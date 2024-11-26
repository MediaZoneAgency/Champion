
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/error/error_model.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/network/network_constant.dart';
import '../models/edit_profile_model.dart';
import '../models/edit_profile_response.dart';
import '../models/profile_model.dart';

class ProfileRepo {
  final Dio _dio;

  ProfileRepo(this._dio);


  Future<Either<ApiErrorModel, ProfileModel>> fetchProfile() async {
    try {
      var response = await _dio.get(NetworkConstant.profile);
      return right(ProfileModel.fromMap(response.data));
    } catch (e) {
      log(e.toString());
      return left(ApiErrorHandler.handle(e));
    }
  }
  Future<Either<ApiErrorModel,String>> deletAccount() async {
    try {
      Response response = await _dio.delete(

        NetworkConstant.deleteAccount,
      );
      return Right(response
          .data["message"]); // Assuming the response has the profile dat
    } catch (e) {
      log(e.toString());
      return Left(ApiErrorHandler.handle(e));
    }
  }
  Future<Either<ApiErrorModel, ProfileModel>> featchProfileNew(
      {required ProfileModel editProfile }) async {
    try {
      Response response =
      await _dio.put(NetworkConstant.profile, data: editProfile.toMap());

      return Right(ProfileModel.fromMap(response.data));
    } catch (e) {
      return Left(ApiErrorHandler.handle(e));
    }
  }
  // Future<Either<ApiErrorModel, ProfileModel>> editProfile(ProfileModel profile) async {
  //
  //
  //   try {
  //     var data = await apiService.put(endPoint: 'wp/v2/users/me', data: profile);
  //
  //     profile = ProfileModel.fromJson(data);
  //
  //
  //     return right(profile);
  //   } catch (e) {
  //     log(e.toString());
  //     return left(ApiErrorHandler.handle(e));
  //   }
  // }
}
