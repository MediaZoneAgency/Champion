import 'package:bloc/bloc.dart';
import 'package:education/feature/wishlist/data/repo/wish_list_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import '../../../core/error/error_model.dart';
import '../data/models/wish_list_model.dart';
part 'wish_list_state.dart';

class WishListCubit extends Cubit<WishListState> {

  final WishListRepo  wishListRepo;
  WishListCubit(this.wishListRepo) : super(WishListInitial());
  static WishListCubit get(context) => BlocProvider.of(context);
  List<int> favorite=[];
  bool isFavorite= false;
  List<WishListModel> wishList = [];
  Future<void> addToWishList({required int productId}) async {
    emit(AddToWishListLoading());
    final List<ConnectivityResult> connectivityResult = await (Connectivity().checkConnectivity());
    if (!connectivityResult.contains(ConnectivityResult.none)) {
      final response = await wishListRepo.addToWishList(productId: productId);
      response.fold(
              (l) => emit(AddToWishListFailure( l )),
              (r)  {
            emit(AddToWishListSuccess());
          }
      );
    } else {
      emit(AddToWishListFailure(ApiErrorModel(message: 'No internet connection')));
    }
  }
  void toggleFavoriteStatus() {
    isFavorite = !isFavorite;
    emit(WishListUpdated()); // Emit a state to update the UI
  }
  Future<void> getWishList() async {
    emit(GetWishListLoading());
    final List<ConnectivityResult> connectivityResult = await (Connectivity().checkConnectivity());
    if (!connectivityResult.contains(ConnectivityResult.none)) {
      final response = await wishListRepo.getWishList();
      response.fold(
              (l) => emit(GetWishListFailure( l )),
              (r)  {
            favorite= [];
            wishList = r;
            for(var item in wishList){
              favorite.add(item.id!);
            }
            // log(favorite.toString());
            emit(GetWishListSuccess());

          }
      );
    } else {
      emit(GetWishListFailure(ApiErrorModel(message: 'No internet connection')));
    }
  }
  Future<void> removeFromWishList({required int productId}) async {
    emit(RemoveFromWishListLoading());
    final List<ConnectivityResult> connectivityResult = await (Connectivity().checkConnectivity());
    if (!connectivityResult.contains(ConnectivityResult.none)) {
      final response = await wishListRepo.removeFromWishList(productId: productId);
      response.fold(
              (error){ emit(RemoveFromWishListFailure(error));
          },
              (profileData) {
            emit(RemoveFromWishListSuccess());
          });

    }else{
      emit(RemoveFromWishListFailure(ApiErrorModel(message: 'No internet connection')));
    }
  }


}
