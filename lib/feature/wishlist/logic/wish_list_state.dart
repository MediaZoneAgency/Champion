part of 'wish_list_cubit.dart';

@immutable
sealed class WishListState {}

final class WishListInitial extends WishListState {}
final class AddToWishListLoading extends WishListState {}

final class AddToWishListSuccess extends WishListState {}

final class AddToWishListFailure extends WishListState {
  final ApiErrorModel error;
  AddToWishListFailure( this.error);
}

final class GetWishListLoading extends WishListState {}

final class GetWishListSuccess extends WishListState {}

final class GetWishListFailure extends WishListState {
  final ApiErrorModel error;
  GetWishListFailure( this.error);
}
final class WishListUpdated extends WishListState {}

final class RemoveFromWishListLoading extends WishListState {}

final class RemoveFromWishListSuccess extends WishListState {}

final class RemoveFromWishListFailure extends WishListState {
  final ApiErrorModel error;
  RemoveFromWishListFailure( this.error);
}