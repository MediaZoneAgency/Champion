import 'package:education/core/helpers/extensions.dart';
import 'package:education/feature/coursedetails/data/models/product_model.dart';
import 'package:education/feature/coursedetails/ui/screen/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';

class MoreLikeWidget extends StatelessWidget {
  const MoreLikeWidget(this.product,
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Add your content here
        Container(
          width: 105.w,
          height: 75.h,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
             image: (product.thumbnailUrl != null && product.thumbnailUrl!.isNotEmpty && product.thumbnailUrl != "false")
    ? NetworkImage(product.thumbnailUrl!)
    : const AssetImage('assets/img/WhatsApp Image 2024-11-17 at 10.11.25 AM.jpeg') as ImageProvider,

            ),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(9),
              topRight: Radius.circular(9),
              bottomLeft: Radius.circular(9),
              bottomRight: Radius.circular(9),
            ),
          ),
          child: Stack(children: [
            Positioned(
                top: 3,
                right: 2,
                child: SizedBox(
                  width: 30,
                  height: 30,
                  child: GestureDetector(
                      onTap: addToFavourite,
                      child: isFavorite
                          ? SvgPicture.asset(
                              "assets/img/heart-circle (2).svg",

                              fit: BoxFit.scaleDown,
                            )
                          : SvgPicture.asset(
                              "assets/img/heart-circle (1).svg",
                              fit: BoxFit.scaleDown,
                            )),
                ))
          ]),
        ),
        SizedBox(
          height: 8.h,
        ),
        GestureDetector(
          onTap: (){
            Navigator.pushNamed(context, Routes.DetailsScreen,
                arguments: product);
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.title!,
                style: TextStyles.poppinsRegular16contantGray.copyWith(fontSize: 11.sp),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              Row(children: [
                SvgPicture.asset(
                  'assets/img/star.svg',
                  fit: BoxFit.scaleDown,
                ),
                SizedBox(width: 2.w,),
                Text(
                  product.salePrice.toString(),
                  style: TextStyles.poppinsRegular14lightGray.copyWith(fontSize: 10.sp),
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
                  style: TextStyles.poppinsRegular14lightGray.copyWith(fontSize: 10.sp),
                ),
                SizedBox(
                  width: 14.w,
                ),
              ]),
              SizedBox(
                height: 8.h,
              ),
              Text(
                product.salePrice.toString() ?? "not vaild",
                style: TextStyles.poppinsRegular16blue.copyWith(fontSize: 11.sp),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
