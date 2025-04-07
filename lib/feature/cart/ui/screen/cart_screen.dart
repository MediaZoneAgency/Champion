import 'package:education/core/helpers/extensions.dart';
import 'package:education/feature/cart/ui/widget/cart_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/sharedWidgets/app_text_button.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../generated/l10n.dart';
import '../../../home/logic/product_cubit.dart';
import '../../../home/ui/widget/courses_list_view.dart';
import '../../../nav_bar/logic/nav_bar_cubit.dart';
import '../../logic/cart_cubit.dart';
import '../widget/cart_list_view.dart';
import '../widget/cart_widget.dart';
import 'package:lottie/lottie.dart';
import 'package:education/core/helpers/extensions.dart';
import 'package:education/feature/cart/ui/widget/cart_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/sharedWidgets/app_text_button.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../generated/l10n.dart';
import '../../../home/ui/widget/courses_list_view.dart';
import '../../../nav_bar/logic/nav_bar_cubit.dart';
import '../../logic/cart_cubit.dart';
import '../widget/cart_list_view.dart';
import '../widget/cart_widget.dart';
import 'package:lottie/lottie.dart';
class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final cartCubit = CartCubit.get(context);
    final cartList = cartCubit.cartList;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  CartBar(username: 'Cart'),
                  BlocBuilder<CartCubit, CartState>(
                    builder: (context, state) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: cartList.isNotEmpty
                            ? ListView.separated(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: cartList.length,
                                itemBuilder: (context, index) {
                                  if (index >= cartList.length) return const SizedBox();
                                  return CartWidget(
                                    cartList[index],
                                    onremove: () => cartCubit.removeFromCart(cartList[index]),
                                  );
                                },
                                separatorBuilder: (context, index) => Column(
                                  children: [
                                    SizedBox(height: 10.h),
                                    const Divider(color: ColorsManager.LigGthGray, thickness: 0.5),
                                    SizedBox(height: 10.h),
                                  ],
                                ),
                              )
                            : Column(
                                children: [
                                  Center(
                                    child: Lottie.asset(
                                      'assets/img/Animation.json',
                                      height: 200, // Adjust to prevent overflow
                                      width: 200,
                                      fit: BoxFit.cover,
                                      errorBuilder: (context, error, stackTrace) =>
                                          const Icon(Icons.error, size: 50, color: Colors.red),
                                    ),
                                  ),
                                  SizedBox(height: 30.h),
                                  GestureDetector(
                                    onTap: () => NavBarCubit.get(context).changeIndex(0),
                                    child: Container(
                                      height: 40,
                                      width: 250,
                                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                      decoration: BoxDecoration(
                                          color: ColorsManager.primaryColorLight,
                                          borderRadius: BorderRadius.circular(10)),
                                      child: Center(
                                        child: Text(S.of(context).Checknewcourses,
                                            style: TextStyles.poppinsMedium12white),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                      );
                    },
                  ),
                  if (cartList.isNotEmpty) ...[
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Row(
                        children: [
                          Text(S.of(context).MoreLikThis, style: TextStyles.poppinsMedium18contantGray),
                        ],
                      ),
                    ),
                    SizedBox(height: 18.h),
                    const Padding(padding: EdgeInsets.only(left: 20), child: CartListView()),
                  ],
                  verticalSpace(40.h),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: cartList.isNotEmpty
                    ? CustomTextButton(
                        borderRadius: 10,
                        buttonHeight: 50,
                        buttonWidth: 260,
                        buttonText: S.of(context).ProceedTocheckout,
                        textStyle: TextStyles.poppinsMedium20white.copyWith(fontSize: 18),
                        onPressed: () => context.pushNamed(Routes.checkoutScreen),
                      )
                    : const SizedBox(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class CustomTextButton extends StatelessWidget {
  final double? borderRadius;
  final Color? backgroundColor;
  final double? horizontalPadding;
  final double? verticalPadding;
  final double? buttonWidth;
  final double? buttonHeight;
  final String buttonText;
  final TextStyle textStyle;
  final VoidCallback onPressed;
  const CustomTextButton({
    super.key,
    this.borderRadius,
    this.backgroundColor,
    this.horizontalPadding,
    this.verticalPadding,
    this.buttonHeight,
    this.buttonWidth,
    required this.buttonText,
    required this.textStyle,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style:
      ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(borderRadius ?? 16.0),
              topRight: Radius.circular(borderRadius ?? 16.0),
              bottomRight: Radius.circular(borderRadius ?? 16.0),
              bottomLeft: Radius.circular(borderRadius ?? 16.0),
            ),

          ),
        ),
        backgroundColor: MaterialStatePropertyAll(
          backgroundColor ?? ColorsManager.mainBlUE,
        ),
        padding: MaterialStateProperty.all<EdgeInsets>(
          EdgeInsets.symmetric(
            horizontal: horizontalPadding?.w ?? 12.w,
            vertical: verticalPadding?.h ?? 13.h,
          ),
        ),
        fixedSize: MaterialStateProperty.all(
          Size(buttonWidth?.w ?? double.maxFinite, buttonHeight ?? 58.h),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        buttonText,
        style: textStyle,
      ),
    );
  }
}