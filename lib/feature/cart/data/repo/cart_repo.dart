import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:education/feature/cart/data/models/order_model.dart';
import 'package:education/feature/cart/data/models/order_response_model.dart';

import '../../../../core/error/error_model.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/network/network_constant.dart';

class CartRepo {
  final Dio dio;
  const CartRepo(this.dio);
  Future<Either<ApiErrorModel, OrderResponse>> order(OrderModel orderModel) async {
    try {
      final response = await dio.post(NetworkConstant.order, data: orderModel.toMap());


      return
        Right(OrderResponse.fromMap(response.data));

    } catch (e) {
      return left(ApiErrorHandler.handle(e));

    }
  }
  Future<Either<ApiErrorModel, String>> placeOrder(OrderModel orderModel)  async {

    try {
      var data = await dio.post(
        NetworkConstant.order, data: orderModel.toMap(),
        options: Options(headers: {  "authorization":  'Basic ${base64Encode(utf8.encode('ck_65f3c8c1444e58478083591b23622f44144e4cfe:cs_74925ff431ca8d29b7aa45d66d0aa7ebb334dbdc'))}'
        }),
      );
      return right(data.toString());
    } catch (e) {
      return left(ApiErrorHandler.handle(e));
    }
  }

}
