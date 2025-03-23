import 'package:education/core/helpers/extensions.dart';
import 'package:education/feature/cart/data/models/order_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:connectivity_plus/connectivity_plus.dart';
import '../../../Utils/color_manager.dart';
import '../../../core/error/error_model.dart';
import '../../../core/routes/routes.dart';
import '../../../core/sharedWidgets/show_dialog_error.dart';
import '../../../core/sharedWidgets/snack_bar.dart';
import '../../../generated/l10n.dart';
import '../../../main.dart';
import '../data/models/cart_item_model.dart';
import '../data/repo/cart_repo.dart';
part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(this.cartRepo) : super(CartInitial());
  final CartRepo cartRepo;
  late OrderModel orderModel;
  static CartCubit get(context) => BlocProvider.of(context);
  List<CartItemModel> cartList = [];
void addToCart( BuildContext context,{required CartItemModel product}) async {
  if (cartList.any((element) =>
        element.productModel.id == product.productModel.id &&
        element.variantId == product.variantId)) {
      emit(AddToCartState());
      showSnackBar(
          context: context,
          text: S.of(context).alreadyAddedToCart,
          color: ColorManager.colorRed);
      return;
    }
    cartList.add(product);
    showSnackBar(
        context: context,
        text: S.of(context).AddToCart,
        color: ColorManager.primaryColor);
    emit(AddToCartState());
  }
  void removeFromCart(CartItemModel product) async {
    cartList.removeWhere((element) =>
        element.productModel.id == product.productModel.id &&
        element.variantId == product.variantId);
    emit(RemoveFromCartState());
  }
  Future<void> placeOrder() async {
    emit(CartAllOrderLoading());
    var result = await cartRepo.placeOrder(orderModel);
    result.fold(
          (failure) {

        ShowDialogError.showErrorDialog(NavigationService.navigatorKey.currentContext!, "attention", failure.message!);
        emit(CartAllOrderError(failure));
      },
          (response) async {

        emit(CartAllOrderSuccess());
        NavigationService.navigatorKey.currentContext!
            .pushNamedAndRemoveUntil(Routes.navBarScreen,predicate:  (route) => false);
      },
    );
  }

}
