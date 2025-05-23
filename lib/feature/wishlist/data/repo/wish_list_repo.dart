import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:education/core/network/network_constant.dart';
import '../../../../core/error/error_model.dart';
import '../../../../core/error/failure.dart';
import '../../../coursedetails/data/models/product_model.dart';
import '../models/wish_list_model.dart';

class FavRepo{
  FavRepo(this.dio);
  Dio dio;

  Future<Either<ApiErrorModel, String>> addToWishList(
      {required int productId}) async {
    try {
      Response response = await dio
          .post(NetworkConstant.addToWishList, data: {"course_id": productId});
      return Right(response.data["message"]);
    } catch (e) {
      return Left(ApiErrorHandler.handle(e));
    }
  }

  Future<Either<ApiErrorModel, List<ProductModel>>> getWishList() async {
    List<ProductModel> fav = [];
    try {
      Response response = await dio.get(NetworkConstant.getWishList);
      // response.data["favorites"].forEach((key,va){
      //   fav.add(ProductModel.fromMap(va));
      // });
      for (var item in response.data["favorites"]) {
        fav.add(ProductModel.fromMap(item));
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