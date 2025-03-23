import 'package:education/core/di/dependency_inj.dart';
import 'package:education/feature/cart/data/models/cart_item_model.dart';
import 'package:education/feature/coursedetails/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/sharedWidgets/app_text_button.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/theming/theming_change/theme_cubit.dart';
import '../../../../generated/l10n.dart';
import '../../../cart/logic/cart_cubit.dart';
import '../../../home/ui/widget/courses_list_view.dart';
import '../widget/course_section.dart';
import '../widget/details_widget.dart';
import '../widget/review_widget.dart';
class DetailsScreen extends StatefulWidget {
  const DetailsScreen(this.product, {super.key,});

  final ProductModel product;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      bottomNavigationBar: BlocBuilder<CartCubit ,CartState>(
        builder: (context, state) {
          return SizedBox(
            height: 68.h,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(left: 8, right: 20),
              child: Row(

                  children: [
                    SizedBox(width: 25.w,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                        Text('Total Price',
                          style:
                          ThemeCubit.get(context).themeMode== ThemeMode.light?
                          TextStyles.poppinsRegular14LightGray: TextStyles.poppinsRegular14white,),
                        SizedBox(height: 4.h,),
                        Text('450 EGP',
                          style:
                          ThemeCubit.get(context).themeMode== ThemeMode.light?
                          TextStyles.poppinsMedium20NavyBlue: TextStyles.poppinsMedium20white.copyWith(color: Colors.white),),


                      ],),
                   Spacer(),
                    BlocBuilder<CartCubit, CartState>(
                      builder: (context, state) {
                        return AppTextButton(
                          horizontalPadding: 5.w,
                          verticalPadding:5.w,
                          borderRadius: 10,
                          buttonHeight: 48.h,
                          buttonWidth: 170.w,
                          buttonText:"Enrol Now",
                          //S.of(context).Enrol,
                          textStyle: TextStyles.poppinsMedium18white,
                          onPressed: () {
                            CartCubit.get(context).addToCart(context,
                                product: CartItemModel(
                                    productModel: widget.product));
                          },
                        );
                      },
                    ),
                  ]
              ),
            ),
          );
        },
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 // SizedBox(height: 50.h),
                  DetailsWidget(widget.product),
                  CourseSections(),
                  SizedBox(height: 40.h),
                  Text(
                      "    Reviews(12)",
                      style:
                      ThemeCubit.get(context).themeMode== ThemeMode.light?
                      TextStyles.poppinsMedium16DarkGray:TextStyles.poppinsMedium16DarkGray.copyWith(color: Colors.white)
                  ),
                  ReviewWidget(),
                  SizedBox(height: 12.h),
                  ReviewWidget(),
                  SizedBox(height: 20.h),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 10),
                    child: Center(
                      child: Text(
                          "See All Reviews",
                          style: TextStyles.poppinsRegular16blue
                      ),
                    ),
                  ),
                  SizedBox(height: 39.h),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      children: [
                        Text(
                            'For you',
                            style: ThemeCubit.get(context).themeMode== ThemeMode.light?
                            TextStyles.poppinsMedium18contantGray:TextStyles.poppinsMedium18contantGray.copyWith(color: Colors.white)
                        ),
                        SizedBox(width: 200.w,),
                        Text(
                            S
                                .of(context)
                                .Seeall,
                            style: TextStyles.poppinsRegular14babyblue
                        ),
            
                      ],
                    ),
                  ),
                  SizedBox(height: 16.h,),
                  CoursesListView(),
                  SizedBox(height: 24.h,),

                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
