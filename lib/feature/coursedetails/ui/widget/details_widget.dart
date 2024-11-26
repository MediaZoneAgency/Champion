
import 'package:education/core/helpers/extensions.dart';
import 'package:education/feature/coursedetails/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';


class DetailsWidget extends StatelessWidget {
  const DetailsWidget(this.product,{super.key});
final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left: 20.w, ),
      child: Container(

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Add your content here
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 327.w,
                  height: 206.h,
                 foregroundDecoration: BoxDecoration(
                   color: Colors.black.withOpacity(.3),
                 ),
                  decoration:  BoxDecoration(

                     image: DecorationImage(
                       image:NetworkImage(
                           product.images![0].src!
                       ),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                  child: Stack(
                    children: [
                      Positioned(top: 10,
                          left: 10,
                          child: GestureDetector(
                            onTap: () {

                              context.pushNamed(Routes.cartScreen);
                            },
                            child: SvgPicture.asset(
                              'assets/img/cart-circle.svg',
                            ),
                          ), ),
                      Positioned(
                      top: 10,
                      right: 10,
                      child: GestureDetector(
                        onTap: () {

                          context.pushNamed(Routes.wishListScreen);
                        },
                        child: SvgPicture.asset(
                          'assets/img/heart-circle (4).svg',
                        ),
                      ),

                      ),

              ],
            ),
                      ),
                SizedBox(height: 8.h,),
                Text(product.name??" not valid",
                  style: TextStyles.poppinsMedium24contantGray,
                maxLines: 2,
                overflow: TextOverflow .ellipsis,),
                SizedBox(
                  width: 327.w,
                  height: 120.h,
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: product.description??"nnnn",
                            style: TextStyles.poppinsRegular20lightGray.copyWith(

                                overflow: TextOverflow .ellipsis
                            ),


                        ),
                        WidgetSpan(
                          child: GestureDetector(
                            onTap: () {
                              // Handle "Read More" tap
                            },
                            child: Text(
                                ' See More',
                                style: TextStyles.poppinsRegular14babyblue.copyWith(
                                  decoration: TextDecoration.underline
                                )
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
       Row(
          children: [
            Text(product.ratingCount.toString(),
            style: TextStyles.poppinsRegular14lightGray,),
            SizedBox(width: 4.w,),
            SvgPicture.asset(
              'assets/img/star2.svg',
            ),
            SvgPicture.asset(
              'assets/img/star2.svg',
            ),
            SvgPicture.asset(
              'assets/img/star2.svg',
            ),
            SvgPicture.asset(
              'assets/img/star2.svg',
            ),

            SizedBox(width: 16.w,),
            Text(product.ratingCount.toString(),
              style: TextStyles.poppinsRegular14lightGray,),
            SizedBox(width: 14.w,),

       ]
       ),
               Row(
                 children: [
                 Text('Created by',
                   style: TextStyles.poppinsMedium18contantGray,),
                 SizedBox(width: 4.w,),
                 Text('Mark Krov',
                   style: TextStyles.poppinsMedium18Blue.copyWith(
                     decoration: TextDecoration.underline
                   ),
                 ),
               ],
               ),
                SizedBox(height:20.h,),
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/img/calendar-2.svg',
                    ),
                    SizedBox(width: 4.w,),
                    Text('Last Update ${product.dateCreated}',
                      style: TextStyles.poppinsMedium16BlackDark
                    ),
                  ],
                ),
                SizedBox(height: 12.h,),
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/img/Group (2).svg',
                    ),
                    SizedBox(width: 4.w,),
                    Text('English',
                        style: TextStyles.poppinsMedium16BlackDark
                    ),
                  ],
                ),
                SizedBox(height: 12.h,),
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/img/cc.svg',
                    ),
                    SizedBox(width: 4.w,),
                    Text('English , Arabic ,Spanish',
                        style: TextStyles.poppinsMedium16BlackDark
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  children: [

                    Text(product.salePrice.toString(),
                      style: TextStyles.poppinsRegular28blue,),
                    SizedBox(width: 16.w,),
                    Text(product.regularPrice.toString(),
                      style: TextStyles.poppinsMedium18contantGray.copyWith(
                        decoration: TextDecoration.lineThrough
                      ),),
                  ],
                ),
                SizedBox(height: 44.h,),
                Text('Course Details',
                  style: TextStyles.poppinsMedium18contantGray,),
                SizedBox(height: 8.h,),
                Row(
                  children: [

                    SizedBox(width: 4.w,),
                    SizedBox(
                      width: 320.w,
                      height: 48.h,
                      child: Text('4 sections . 55 lectures.6h 56m total length',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyles.poppinsMedium16BlackDark
                      ),
                    ),
                  ],
                ),

                    ],
                  )
      ])
      ),
    );
  }
}

