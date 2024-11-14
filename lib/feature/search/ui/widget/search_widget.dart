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
    return Padding(
      padding:EdgeInsets.only(left: 15.w, ),
      child:
          Row(children: [

            GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, Routes.DetailsScreen,arguments: product) ;
              },
                child: AppCachedNetworkImage
                  (image:product.images![0].src!,
                  width: 70.w,
                  height: 70.h,
                  radius: 5,)),

            SizedBox(width: 13.w,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                     product.name.toString(),
                      style: TextStyles.poppinsMedium16DarkGray.copyWith(fontSize: 14)
                  ),
                  SizedBox(height: 4.h,),
                  SizedBox(
                    width: 241,
                    height: 55,
                    child: Text(
                        product.description.toString(),
                        style: TextStyles.poppinsRegular12LightGray.copyWith(fontSize: 10)
                    ),
                  ),
                  SizedBox(height: 4.h,),
                  Row(
                    crossAxisAlignment:CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(product.salePrice.toString(),
                          style: TextStyles.poppinsMedium20Blue,),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                'assets/img/star.svg',
                              ),
                              Text(product.ratingCount.toString() ,
                                style: TextStyles.poppinsRegular14lightGray,),
                            ],
                          ),
                        ),
          SizedBox(width: 99.w,),
                        BlocBuilder<CartCubit, CartState>(
  builder: (context, state) {
    return GestureDetector(
                          onTap: onremove,
                          child: SvgPicture.asset(
                            'assets/img/trash.svg',
                          ),
                        );
  },
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