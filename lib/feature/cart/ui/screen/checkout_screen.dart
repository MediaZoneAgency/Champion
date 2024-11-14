import 'package:education/feature/cart/ui/widget/cart_bar.dart';
import 'package:education/feature/cart/ui/widget/promo_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/sharedWidgets/app_text_button.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../generated/l10n.dart';
import '../../../home/logic/product_cubit.dart';
import '../../data/models/billing.dart';
import '../../data/models/line_model.dart';
import '../../data/models/order_model.dart';
import '../../logic/cart_cubit.dart';
import '../widget/add_card_button.dart';
import '../widget/card_item.dart';
import '../widget/cart_widget.dart';

class CheckoutScreen extends StatefulWidget {

  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() =>_CheckoutScreenState();
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
        return Scaffold(

            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                const CartBar(username: 'Check Out'),
                BlocBuilder<CartCubit,CartState>(
                  builder: (context, state) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 24.0.w,
                      ),
                      child:SizedBox(
                        height: 200,
                        child: ListView.builder(
                          itemCount:CartCubit.get(context).cartList.length ,
                          itemBuilder: (BuildContext context, int index) {  return CartWidget(CartCubit.get(context).cartList[index] ,onremove:  (){

                            CartCubit.get(context).removeFromCart(
                                CartCubit.get(context).cartList[index]);
                          },);},
                        ),
                      ),
                    );
                  },
                ),

                PromoCode(),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(S.of(context).Paywith, style: TextStyles.poppinsMedium18Blue,),
                      verticalSpace(12.h),
                      buildCardItem(context,S.of(context).Cash,SvgPicture.asset("assets/img/dollar-circle.svg")),
                      buildCardItem(context,"xxx-4113",SvgPicture.asset("assets/img/card.svg")),
                      AddCardButton(onTap: (){}),

                      verticalSpace(200.h),
                      Row(
                          children: [
                            SizedBox(width: 25.w,),
                            Column(

                              children: [
                                Text('Total Price',
                                  style: TextStyles.poppinsRegular14LightGray,),
                                SizedBox(height:4.h,),
                                Text('450 EGP',
                                  style: TextStyles.poppinsMedium20NavyBlue,),


                              ],),
                            SizedBox(width: 54.w,),
                            AppTextButton(
                              borderRadius: 10,
                              buttonHeight: 48.h,
                              buttonWidth: 170.w,
                              buttonText:S.of(context).buynow,
                              textStyle: TextStyles.poppinsMedium18white,
                              onPressed: ()  async {

                                CartCubit.get(context).orderModel = OrderModel(
                                    paymentMethodTitle: '',
                                    paymentMethod: '',

                                    email: '',
                                    lineItems: [
                                      ...CartCubit.get(context).cartList.map((x) =>
                                          LineItems(
                                              quantity: x.quantity,
                                              productId: x.productModel.id!,
                                              variationId: x.variantId))
                                    ],
                                    setPaid: true);

                                await CartCubit.get(context).placeOrder();

                              },
                            ),
                          ]
                      ),
                    ],
                  ),
                ),


              ],
            )
        );
      },
    );
  }
}

CardItem buildCardItem(BuildContext context,String text,Widget icon) {
  return CardItem(cardNumber: text, onDelete: (){}, lastIcon:
  Checkbox(
      shape:const CircleBorder() ,
      fillColor: const WidgetStatePropertyAll(ColorsManager.primaryColorLight),
      value: true, onChanged:(state ){})
      , firstIcon:icon);
}