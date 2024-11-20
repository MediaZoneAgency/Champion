import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/error_model.dart';
import '../../../coursedetails/data/models/product_model.dart';
import '../../data/models/wish_list_model.dart';
import '../../data/repo/wish_list_repo.dart';

part 'fav_state.dart';

class FavCubit extends Cubit<FavState> {
  FavCubit(this.favRepo) : super(FavInitial());

  static FavCubit get(context) => BlocProvider.of(context);
  final FavRepo favRepo;

  List<int> favorite = [];

  List<WishListModel> wishList = [
    WishListModel(
        name: "Product 1",
        price: "100",
        image:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR8rHkK301LBCvaTWN5TnJbc4t5h0Cnzxm1tQ&s'),
    WishListModel(
        name: "Product 2",
        price: "200",
        image:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR8rHkK301LBCvaTWN5TnJbc4t5h0Cnzxm1tQ&s'),
    WishListModel(
        name: "Product 3",
        price: "300",
        image:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR8rHkK301LBCvaTWN5TnJbc4t5h0Cnzxm1tQ&s'),
    WishListModel(
        name: "Product 3",
        price: "300",
        image:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR8rHkK301LBCvaTWN5TnJbc4t5h0Cnzxm1tQ&s'),
  ];

  Future<void> addToWishList({required ProductModel model}) async {
    final List<ConnectivityResult> connectivityResult =
    await (Connectivity().checkConnectivity());
    if (!connectivityResult.contains(ConnectivityResult.none)) {
      wishList.add(WishListModel(
          name: model.name,
          price: model.price,
          image: model.images![0].src,
          id: model.id));
      favorite.add(model.id!);
      emit(AddToWishListLoading());
      final response = await favRepo.addToWishList(productId: model.id!);
      response.fold((l) {
        wishList.removeWhere((element) => element.id == model.id);
        favorite.removeWhere((element) => element == model.id);
        emit(AddToWishListFailure(l));
      }, (r) {
        emit(AddToWishListSuccess());
      });
    } else {
      emit(AddToWishListFailure(
          ApiErrorModel(message: 'No internet connection')));
    }
  }

  Future<void> getWishList() async {
    emit(GetWishListLoading());
    final List<ConnectivityResult> connectivityResult =
    await (Connectivity().checkConnectivity());
    if (!connectivityResult.contains(ConnectivityResult.none)) {
      final response = await favRepo.getWishList();
      response.fold((l) => emit(GetWishListFailure(l)), (r) {
        favorite = [];
        wishList = r;
        for (var item in wishList) {
          favorite.add(item.id!);
        }
        emit(GetWishListSuccess());
      });
    } else {
      emit(
          GetWishListFailure(ApiErrorModel(message: 'No internet connection')));
    }
  }

  Future<void> removeFromWishList( WishListModel model) async {
    emit(RemoveFromWishListLoading());
    final List<ConnectivityResult> connectivityResult =
    await (Connectivity().checkConnectivity());
    if (!connectivityResult.contains(ConnectivityResult.none)) {
      wishList.removeWhere((element) => element.id == model.id);
      favorite.removeWhere((element) => element == model.id);
      final response = await favRepo.removeFromWishList(productId: model.id!);
      response.fold((error) {
        wishList.add(model);
        favorite.add(model.id!);
        emit(RemoveFromWishListFailure(error));
      }, (profileData) {
        emit(RemoveFromWishListSuccess());
      });
    } else {
      emit(RemoveFromWishListFailure(
          ApiErrorModel(message: 'No internet connection')));
    }
  }
}
