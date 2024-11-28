import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:education/feature/coursedetails/data/models/product_model.dart';
import 'package:flutter/foundation.dart';
import '../../../../core/error/error_model.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/network/network_constant.dart';
import '../../../wishlist/data/models/wish_list_model.dart';
import '../models/category_model.dart';

class HomeRepo {
  final Dio _dio;
  HomeRepo(this._dio);


  Future<Either<ApiErrorModel,List <CategoryModel>>> getCategories() async {
    List<CategoryModel> categories = [];
    try {
      final response = await _dio.get(NetworkConstant.categories);
      for (var item in response.data) {
        categories.add(CategoryModel.fromMap(item));
      }
      return right( categories  );

    } catch (e) {
      log(e.toString());
      return left(ApiErrorHandler.handle(e));

    }
  }

  Future<Either<ApiErrorModel,List <ProductModel>>> getProduct() async {
    List<ProductModel> products = [];
    try {
      final response = await _dio.get(NetworkConstant.products);
      for (var item in response.data) {
        products.add(ProductModel.fromMap(item));
      }
      return right(products);

    } catch (e) {
      log(e.toString());
      return left(ApiErrorHandler.handle(e));

    }
  }
  Future<Either<ApiErrorModel,List <ProductModel>>> getCategoryProducts( {required int categoryName}) async {
    List<ProductModel> categoryProducts = [];
    try {
      final response = await _dio.get(NetworkConstant.products,queryParameters: {
        'category': categoryName
      });
      for (var item in response.data) {
        categoryProducts.add(ProductModel.fromMap(item));
      }
      return right(categoryProducts);

    } catch (e) {
      log(e.toString());
      return left(ApiErrorHandler.handle(e));

    }
  }

  Future<Either<ApiErrorModel, String>> addToWishList(
      {required int productId}) async {
    try {
      Response response = await _dio
          .post(NetworkConstant.addToWishList, data: {"product_id": productId});
      return Right(response.data["message"]);
    } catch (e) {
      return Left(ApiErrorHandler.handle(e));
    }
  }
  Future<Either<ApiErrorModel, List<WishListModel>>> getWishList() async {
    List<WishListModel> fav = [];
    try {
      Response response = await _dio.get(NetworkConstant.getWishList);
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
      Response response = await _dio.delete(
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