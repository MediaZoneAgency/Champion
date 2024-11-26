import 'package:education/core/helpers/extensions.dart';
import 'package:education/core/sharedWidgets/network_image.dart';
import 'package:education/feature/coursedetails/data/models/product_model.dart';
import 'package:education/feature/coursedetails/ui/screen/details_screen.dart';
import 'package:education/feature/wishlist/data/models/wish_list_model.dart';
import 'package:education/feature/wishlist/logic/cubit/fav_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';

class CourseWidget extends StatelessWidget {
  const CourseWidget(this.product,
      {super.key,
      required this.isFavorite,
      required this.onTap,
      this.addToFavourite});
  final ProductModel product;
   final bool isFavorite;
  final Function() onTap;
  final Function()? addToFavourite;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, Routes.DetailsScreen,
            arguments: product);
      },
      child: Container(
          width: 155.w,
          height: 220.h,
          decoration:  BoxDecoration(
            borderRadius:  BorderRadius.all(
               Radius.circular(9),
            ),
           // border: Border.all(color:   Colors.transparent),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Add your content here
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Stack(children: [

                  AppCachedNetworkImage(
                    width: 155.w,
                    height: 111.h,
                    image:  product.images![0].src!,
                    radius: 9,
                  ),
                       Positioned(
                          top: 8,
                          right: 8,
                          child: GestureDetector(
                              onTap: (){
                                onTap();
                              },
                              child: SizedBox(
                                width: 44,
                                height: 44,
                                child: isFavorite
                                    ? SvgPicture.asset(
                                        "assets/img/heart-circle (2).svg")
                                    : SvgPicture.asset(
                                        "assets/img/heart-circle (1).svg",
                                      ),
                              )))

                ]),
              ]),
              GestureDetector(
                onTap: () {
              //    Navigator.pushNamed(context, Routes.DetailsScreen, arguments: product);
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 3),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 8.h,
                      ),
                      Text(
                        product.name!,
                        style: TextStyles.poppinsRegular16contantGray,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Row(children: [
                        SvgPicture.asset(
                          'assets/img/star.svg',
                        ),
                        Text(
                          product.price.toString(),
                          style: TextStyles.poppinsRegular14lightGray,
                        ),
                        SizedBox(
                          width: 4.w,
                        ),
                        SvgPicture.asset(
                          'assets/img/Line 3.svg',
                        ),
                        SizedBox(
                          width: 14.5.w,
                        ),
                        Text(
                          '144',
                          style: TextStyles.poppinsRegular14lightGray,
                        ),
                        SizedBox(
                          width: 14.w,
                        ),
                      ]),
                      SizedBox(
                        height: 8.h,
                      ),
                      Text(
                          product.price.toString()+"EGP" ,
                        style: TextStyles.poppinsRegular16blue,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
