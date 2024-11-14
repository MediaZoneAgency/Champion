import 'package:cached_network_image/cached_network_image.dart';
import 'package:education/core/sharedWidgets/network_image.dart';
import 'package:education/core/theming/styles.dart';
import 'package:education/feature/cart/data/models/cart_item_model.dart';
import 'package:education/feature/coursedetails/data/models/product_model.dart';
import 'package:education/feature/home/logic/product_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/theming/colors.dart';


class LoadingCartWidget extends StatelessWidget {
  const LoadingCartWidget( this.product,{super.key, this.onremove});
  final CartItemModel product;
  final Function()? onremove;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:EdgeInsets.only(left: 15.w, ),
      child:
      Row(children: [

        AppCachedNetworkImage(image:product.productModel.images![0].src!, width: 75.w, height: 75.h, radius: 5,),

        SizedBox(width: 13.w,),
        Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                 "vvvvvvvvvvvvvvvvvvvv",
                  style: TextStyles.poppinsMedium16DarkGray.copyWith(fontSize: 14)
              ),
              SizedBox(height: 4.h,),
              SizedBox(
                width: 241,
                height: 54,
                child: Text(
                    "product.productModel.description.toString()vvvvvvvvvv",
                    style: TextStyles.poppinsRegular12LightGray.copyWith(fontSize: 10)
                ),
              ),
              SizedBox(height: 4.h,),
              Row(
                  crossAxisAlignment:CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("450 SAR",
                      style: TextStyles.poppinsMedium20Blue.copyWith(fontSize: 18),),

                    Row(
                      children: [
                        SizedBox(width: 4.h,),
                        SvgPicture.asset(
                          'assets/img/star.svg',
                        ),

                        Text(product.productModel.ratingCount.toString() ,
                          style: TextStyles.poppinsRegular14lightGray.copyWith(fontSize: 16),),
                      ],
                    ),
                    SizedBox(width: 99.w,),
                    SvgPicture.asset(
                            'assets/img/trash.svg',
                          ),
                  ]

              ),
            ]
        ),



      ],
      ),


    );
  }
}