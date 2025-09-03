part of 'payment_cubit.dart';

@immutable
abstract class PaymentState {}

class PaymentInitial extends PaymentState {}

class PaymentLoading extends PaymentState {}

class PaymentSuccess extends PaymentState {
  final String productId;
  PaymentSuccess(this.productId);
}

class PaymentFailure extends PaymentState {
  final String error;
  PaymentFailure(this.error);
}
