import 'package:education/core/helpers/extensions.dart';
import 'package:education/feature/cart/ui/widget/cart_bar.dart';
import 'package:education/feature/cart/ui/widget/promo_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/db/cash_helper.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/network/dio_factory.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/sharedWidgets/app_text_button.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../generated/l10n.dart';
import '../../../home/logic/product_cubit.dart';
import '../../data/models/line_model.dart';
import '../../data/models/order_model.dart';
import '../../logic/cart_cubit.dart';
import '../widget/add_card_button.dart';
import '../widget/card_item.dart';
import '../widget/cart_widget.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  void initState() {
    super.initState();
    ProductCubit.get(context).getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  SizedBox(
                    width: 25.w,
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Total Price',
                        style: TextStyles.poppinsRegular14LightGray,
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      Text(
                        '450 EGP',
                        style: TextStyles.poppinsMedium20NavyBlue,
                      ),
                    ],
                  ),
                  const Spacer(),
                  AppTextButton(
                    borderRadius: 10,
                    buttonHeight: 48.h,
                    buttonWidth: 170.w,
                    buttonText: S.of(context).buynow,
                    textStyle: TextStyles.poppinsMedium18white,
                    onPressed: () async {
                      CartCubit.get(context).orderModel = OrderModel(
                        paymentMethodTitle: '',
                        paymentMethod: '',
                        email: '',
                        lineItems: [
                          ...CartCubit.get(context).cartList.map(
                                (x) => LineItems(
                              quantity: x.quantity,
                              productId: x.productModel.id!,
                              variationId: x.variantId,
                            ),
                          ),
                        ],
                        setPaid: true,
                      );

                      String token =
                      await CashHelper.getStringSecured(key: Keys.token);

                      if (token == '') {
                        context.pushReplacementNamed(Routes.signUpScreen);
                      } else {
                        DioFactory.setTokenIntoHeaderAfterLogin(token);
                        CartCubit.get(context).placeOrder();
                      }
                    },
                  ),
                ],
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CartBar(username: 'Check Out'),
                  BlocBuilder<CartCubit, CartState>(
                    builder: (context, state) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: CartCubit.get(context).cartList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return CartWidget(
                              CartCubit.get(context).cartList[index],
                              onremove: () {
                                CartCubit.get(context).removeFromCart(
                                    CartCubit.get(context).cartList[index]);
                              },
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return Column(
                              children: [
                                SizedBox(height: 10.h),
                                Divider(
                                  color: ColorsManager.LigGthGray,
                                  indent: 10,
                                  endIndent: 10,
                                  thickness: 0.5,
                                ),
                                SizedBox(height: 10.h),
                              ],
                            );
                          },
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 16.h),
                  Padding(
                    padding: const EdgeInsets.only(left: 26),
                    child: Text(
                      S.of(context).Promocode,
                      style: TextStyles.poppinsRegular16ContantGray,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: PromoCode(),
                  ),
                  SizedBox(height: 28.h),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          S.of(context).Paywith,
                          style: TextStyles.poppinsMedium18Blue,
                        ),
                        verticalSpace(12.h),
                        buildCardItem(context, "xxx-4113",
                            SvgPicture.asset("assets/img/card.svg")),
                        AddCardButton(onTap: () {}),

                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}


CardItem buildCardItem(BuildContext context, String text, Widget icon) {
  return CardItem(
    cardNumber: text,
    onDelete: () {},
    lastIcon: Checkbox(
      shape: const CircleBorder(),
      fillColor:
      const WidgetStatePropertyAll(ColorsManager.primaryColorLight),
      value: true,
      onChanged: (state) {},
    ),
    firstIcon: icon,
  );
}
