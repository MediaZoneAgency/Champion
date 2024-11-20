import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:education/core/network/network_constant.dart';
import '../../../../core/error/error_model.dart';
import '../../../../core/error/failure.dart';
import '../models/wish_list_model.dart';

class FavRepo{
  FavRepo(this.dio);
  Dio dio;

  Future<Either<ApiErrorModel, String>> addToWishList(
      {required int productId}) async {
    try {
      Response response = await dio
          .post(NetworkConstant.addToWishList, data: {"product_id": productId});
      return Right(response.data["message"]);
    } catch (e) {
      return Left(ApiErrorHandler.handle(e));
    }
  }

  Future<Either<ApiErrorModel, List<WishListModel>>> getWishList() async {
    List<WishListModel> fav = [];
    try {
      Response response = await dio.get(NetworkConstant.getWishList);
      for (var item in response.data["favorites"]) {
        fav.add(WishListModel.fromMap(item));
      }
      return Right(fav);
    } catch (e) {
      log(e.toString());
      return Left(ApiErrorHandler.handle(e));
    }
  }

  Future<Either<ApiErrorModel, String>> removeFromWishList({required int productId}) async {
    try {
      Response response = await dio.delete(
          NetworkConstant.removeFromWishList,data: {
        "product_id": productId
      }
      );
      return Right(response
          .data["message"]); // Assuming the response has the profile dat
    } catch (e) {
      log(e.toString());
      return Left(ApiErrorHandler.handle(e));
    }
  }
}