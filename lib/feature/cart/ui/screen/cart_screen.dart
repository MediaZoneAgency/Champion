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
import '../../logic/cart_cubit.dart';
import '../widget/cart_list_view.dart';
import '../widget/cart_widget.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [SingleChildScrollView(
            child: Column(
              children: [
                CartBar(username: 'Cart'),
                BlocBuilder<CartCubit, CartState>(
                  builder: (context, state) {
                    return Padding(
                      padding: EdgeInsets.only(left: 5,right: 10),
                      child: ListView.separated(
                        // Remove the fixed height
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(), // Let SingleChildScrollView handle scrolling
                        itemCount: CartCubit.get(context).cartList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return CartWidget(
                            CartCubit.get(context).cartList[index],
                            onremove: () {
                              CartCubit.get(context).removeFromCart(
                                  CartCubit.get(context).cartList[index]);
                            },
                          );
                        }, separatorBuilder: (BuildContext context, int index)
                      {  return Column(children: [
                      SizedBox(height: 10.h,),
                        Divider(
                          color: ColorsManager.LigGthGray,
                          indent: 10,
                          endIndent: 10,
                          thickness: 0.5,
                        ),
                        SizedBox(height: 10.h,),
        
        
                      ]);},
                      ),
                    );
                  },
                ),
                SizedBox(height: 28.h),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      Text(
                        'More Like This',
                        style: TextStyles.poppinsMedium18contantGray,
                      ),
          
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: CartListView(),
                ),
        
                verticalSpace(90.h)
          
              ],
            ),
          ),
          Column(
            children: [
              Spacer(),
              Positioned(
              bottom: 10,
              left: 0,
              right: 0,
        
              child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 40.0.h),
              child: CustomTextButton(
        
                borderRadius: 10,
                buttonHeight: 50.h,
                buttonWidth: 260.w,
                buttonText: S.of(context).ProceedTocheckout,
                textStyle: TextStyles.poppinsMedium20white.copyWith(fontSize: 18.sp),
                onPressed: () {
                  context.pushNamed(Routes.checkoutScreen);
                },
              ),
                  ),),
            ],
          )
             ] ),
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