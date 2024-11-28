import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:education/core/db/cached_app.dart';
import 'package:education/feature/coursedetails/data/models/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import '../../../core/error/error_model.dart';
import '../../wishlist/data/models/wish_list_model.dart';
import '../data/repo/home_repo.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this._homeRepo) : super(ProductInitial());
  final HomeRepo _homeRepo;
  List<int> favorite = [];
  List<ProductModel> productModel = [];
  List<ProductModel> categoryProductModel = [];
  static ProductCubit get(context) => BlocProvider.of(context);
  Future<void> getProducts() async {
    try {
      productModel = CachedApp.getCachedData(CachedDataType.productHome.name);
      emit(FetchProductSuccess(productModel));
    } catch (e) {
      emit(FetchProductLoading());
      final result = await _homeRepo.getProduct();
      {
        result.fold(
          (failure) {
            emit(FetchProductFailure(failure.message));
          },
          (Products) {
            productModel = Products;
            CachedApp.saveData(productModel, CachedDataType.productHome.name);
            emit(FetchProductSuccess(Products));
          },
        );
      }
    }
  }


  Future<void> getCategoryProducts(int category) async {
    try {
      categoryProductModel = CachedApp.getCachedData("${CachedDataType.categoryProduct.name}$category");
      emit(FetchCategoryProductSuccess(categoryProductModel));
    } catch (e) {
      emit(FetchCategoryProductLoading());
      final result = await _homeRepo.getCategoryProducts(categoryName: category);
      {
        result.fold(
              (failure) {
            emit(FetchCategoryProductFailure(failure.message));
          },
              (categoryProducts) {
                categoryProductModel = categoryProducts;
            CachedApp.saveData(categoryProductModel, "${CachedDataType.categoryProduct.name}$category");
            emit(FetchCategoryProductSuccess(categoryProducts));
          },
        );
      }
    }
  }
}
