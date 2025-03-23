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

import '../../../../core/routes/routes.dart';
import '../../../../core/theming/colors.dart';
import '../../../cart/logic/cart_cubit.dart';


class SearchWidget extends StatelessWidget {
  const SearchWidget( this.product,{super.key, this.onremove});
final ProductModel product;
 final Function()? onremove;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375.w,
      child: Padding(
        padding:EdgeInsets.only(left: 10.w,right: 10.w,),
        child:
            Row(children: [
              GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, Routes.DetailsScreen,arguments: product) ;
                },
                  child: AppCachedNetworkImage
                    (image:product.thumbnailUrl!,
                    width: 70.w,
                    height: 70.h,
                    radius: 5,)),

              SizedBox(width: 13.w,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                       product.title.toString(),
                        style: TextStyles.poppinsMedium16DarkGray.copyWith(fontSize: 14),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 4.h,),
                    ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: 222.w), // Limit text width
                      child: RichText(
                        maxLines: 2,
                        //overflow: TextOverflow.ellipsis,
                        text: TextSpan(

                          children: [
                            TextSpan(
                              text:
                              "${product.content!.substring(0,60)}..." ?? "Description not available",
                              style: TextStyles.poppinsRegular20lightGray.copyWith(fontSize: 12),),
                            TextSpan(
                              text:
                              ' See More',
                              style: TextStyles.poppinsRegular14babyblue.copyWith(
                                decoration: TextDecoration.underline,
                                fontSize: 12,
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 4.h,),
                    Row(

                        children: [
                          Text(product.salePrice.toString(),
                            style: TextStyles.poppinsMedium20Blue,),
                          SizedBox(width: 2.w),
                          Row(
                            children: [
                              SvgPicture.asset(
                                'assets/img/star.svg',
                              ),
                              Text(product.salePrice.toString() ,
                                style:TextStyles.poppinsRegular14lightGray.copyWith(fontSize: 16),),
                            ],
                          ),

                        ]

                    ),
                  ]
              ),



            ],
            ),


      ),
    );
  }
}