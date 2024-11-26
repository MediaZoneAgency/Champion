import 'package:education/core/di/dependency_inj.dart';
import 'package:education/feature/cart/data/models/cart_item_model.dart';
import 'package:education/feature/coursedetails/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/sharedWidgets/app_text_button.dart';
import '../../../../core/theming/styles.dart';
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
            height: 60.h,
            width: double.infinity,
            child: Row(
    
                children: [
                  SizedBox(width: 25.w,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
    
                    children: [
                      Text('Total Price',
                        style: TextStyles.poppinsRegular14LightGray,),
                      SizedBox(height: 4.h,),
                      Text('450 EGP',
                        style: TextStyles.poppinsMedium20NavyBlue,),
    
    
                    ],),
                  SizedBox(width: 54.w,),
                  BlocBuilder<CartCubit, CartState>(
                    builder: (context, state) {
                      return AppTextButton(
                        borderRadius: 10,
                        buttonHeight: 48.h,
                        buttonWidth: 170.w,
                        buttonText: 'Add to Cart',
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
                      style: TextStyles.poppinsMedium16DarkGray
                  ),
                  ReviewWidget(),
                  SizedBox(height: 12.h),
                  ReviewWidget(),
                  SizedBox(height: 20.h),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
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
                            style: TextStyles.poppinsMedium18contantGray
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
