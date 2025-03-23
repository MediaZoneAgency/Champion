import 'package:bloc/bloc.dart';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../cart/data/models/billing.dart';
import '../data/repo/payment_repo.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentRepo paymentRepo;
  PaymentCubit(this.paymentRepo) : super(PaymentInitial());
  static PaymentCubit get(context) => BlocProvider.of(context);
  String? paymentKey;
  Future<void> pay(double amount,Billing billing) async {
    emit(PaymentLoading());
    var result=await paymentRepo.payWithPayMob(amount,billing);
    result.fold(
          (failure) => emit(PaymentFailure()),
          (response) {
            paymentKey=response;
            print('paymentKey ${response}');
            emit(PaymentSuccess());
          }
    );
  }
}
