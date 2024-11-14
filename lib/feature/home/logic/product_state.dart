part of 'product_cubit.dart';

@immutable
sealed class ProductState {}

final class ProductInitial extends ProductState {}
class FetchCategoryInitial extends ProductState {}
class FetchProductSuccess extends ProductState {
  final List<ProductModel> Products;
  FetchProductSuccess(this.Products);
}



class FetchProductLoading extends ProductState {}

class FetchProductFailure extends ProductState {
  final String errorMessage;
  FetchProductFailure(this.errorMessage);
}
final class AddToWishListLoading extends ProductState {}

final class AddToWishListSuccess extends ProductState {}

final class AddToWishListFailure extends ProductState {
  final ApiErrorModel error;
  AddToWishListFailure( this.error);
}

final class GetWishListLoading extends ProductState {}

final class GetWishListSuccess extends ProductState {}

final class GetWishListFailure extends ProductState {
  final ApiErrorModel error;
  GetWishListFailure( this.error);
}

final class RemoveFromWishListLoading extends ProductState {}

final class RemoveFromWishListSuccess extends ProductState {}

final class RemoveFromWishListFailure extends ProductState {
  final ApiErrorModel error;
  RemoveFromWishListFailure( this.error);
}