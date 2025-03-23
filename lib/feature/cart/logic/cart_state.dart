part of 'cart_cubit.dart';

abstract class CartState {}

final class CartInitial extends CartState {}

final class CartAllOrderLoading extends CartState {}

final class CartAllOrderSuccess extends CartState {}

final class CartAllOrderError extends CartState {
  final ApiErrorModel error;

  CartAllOrderError(this.error);
}

final class AddToCartState extends CartState {}
final class RemoveFromCartState extends CartState {}


final class OrderLoadingStat extends CartState {}
final class OrderSuccessState extends CartState {}
final class OrderFalidState extends CartState {

  final ApiErrorModel error;

  OrderFalidState(this.error);
}
//RemoveFromCartState