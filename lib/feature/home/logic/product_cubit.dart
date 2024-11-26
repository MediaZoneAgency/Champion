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
  List<WishListModel> wishList = [
    WishListModel(
        name: "Product 1",
        price: "100",
        image:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR8rHkK301LBCvaTWN5TnJbc4t5h0Cnzxm1tQ&s',
        id: 3),
    WishListModel(
        name: "Product 2",
        price: "200",
        image:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR8rHkK301LBCvaTWN5TnJbc4t5h0Cnzxm1tQ&s',
        id: 4),
    WishListModel(
        name: "Product 3",
        price: "300",
        image:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR8rHkK301LBCvaTWN5TnJbc4t5h0Cnzxm1tQ&s',
        id: 4),
    WishListModel(
        name: "Product 3",
        price: "300",
        image:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR8rHkK301LBCvaTWN5TnJbc4t5h0Cnzxm1tQ&s',
        id: 4),
  ];
  List<int> favorite = [];
  List<ProductModel> productModel = [];
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

  // Future<void> addToWishList({required int productId}) async {
  //   emit(AddToWishListLoading());
  //   final List<ConnectivityResult> connectivityResult =
  //       await (Connectivity().checkConnectivity());
  //   if (!connectivityResult.contains(ConnectivityResult.none)) {
  //     final response = await _homeRepo.addToWishList(productId: productId);
  //     response.fold((l) => emit(AddToWishListFailure(l)), (r) {
  //       emit(AddToWishListSuccess());
  //     });
  //   } else {
  //     emit(AddToWishListFailure(
  //         ApiErrorModel(message: 'No internet connection')));
  //   }
  // }

  // Future<void> getWishList() async {
  //   emit(GetWishListLoading());
  //   final List<ConnectivityResult> connectivityResult =
  //       await (Connectivity().checkConnectivity());
  //   if (!connectivityResult.contains(ConnectivityResult.none)) {
  //     final response = await _homeRepo.getWishList();
  //     response.fold((l) => emit(GetWishListFailure(l)), (r) {
  //       favorite = [];
  //       wishList = r;
  //       for (var item in wishList) {
  //         favorite.add(item.id!);
  //       }
  //       //  log(favorite.toString());
  //       emit(GetWishListSuccess());
  //     });
  //   } else {
  //     emit(
  //         GetWishListFailure(ApiErrorModel(message: 'No internet connection')));
  //   }
  // }
  //
  // Future<void> removeFromWishList({required int productId}) async {
  //   emit(RemoveFromWishListLoading());
  //   final List<ConnectivityResult> connectivityResult =
  //       await (Connectivity().checkConnectivity());
  //   if (!connectivityResult.contains(ConnectivityResult.none)) {
  //     final response = await _homeRepo.removeFromWishList(productId: productId);
  //     response.fold((error) {
  //       emit(RemoveFromWishListFailure(error));
  //     }, (profileData) {
  //       emit(RemoveFromWishListSuccess());
  //     });
  //   } else {
  //     emit(RemoveFromWishListFailure(
  //         ApiErrorModel(message: 'No internet connection')));
  //   }
  // }
}
