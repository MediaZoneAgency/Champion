import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/error/error_model.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/network/network_constant.dart';
import '../../../coursedetails/data/models/product_model.dart';



class SearchRepo {
  SearchRepo(this.dio);
  final Dio dio;

  Future<Either<ApiErrorModel, List<ProductModel>>> getSearch(
      {required String search,
      required double minPrice ,
      required double maxPrice,
      required String categoryName}) async {
    try {
      //?search=rice&min_price=10&max_price=50&category?name=humanitarian
      Response response = await dio.get(NetworkConstant.search, queryParameters: {
        'search': search,
        'category_name': categoryName,

      });
      List<ProductModel> products = (response.data as List)
          .map((item) => ProductModel.fromMap(item))
          .toList();
      return Right(products);
    } catch (e) {
      return Left(ApiErrorHandler.handle(e));
    }
  }
}