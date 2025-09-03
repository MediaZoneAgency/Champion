import 'package:bloc/bloc.dart';
import 'package:education/feature/cart/logic/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import '../data/repo/payment_repo.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  final PaymentRepo paymentRepo;
  PaymentCubit(this.paymentRepo) : super(PaymentInitial());

  static PaymentCubit get(context) => BlocProvider.of(context);

  PurchaseDetails? purchaseDetails;
Future<void> buyProduct(BuildContext context, String productId) async {
  emit(PaymentLoading());

  final result = await paymentRepo.payWithInAppPurchase(productId);
  result.fold(
    (error) {
      print("Purchase Error: $error");
      emit(PaymentFailure(error));
      _showSnackBar(context, "فشل في عملية الشراء ❌");
    },
    (purchase) async {
      purchaseDetails = purchase;

      if (purchase.status == PurchaseStatus.purchased) {
        emit(PaymentSuccess(purchase.productID));
        _showSnackBar(context, "تم الشراء بنجاح 🎉");

        /// ✅ هنا استدعاء placeOrder من CartCubit
        await CartCubit.get(context).placeOrder();
      } else {
        emit(PaymentFailure("الشراء لم يكتمل"));
        _showSnackBar(context, "الشراء لم يكتمل");
      }
    },
  );
}

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
