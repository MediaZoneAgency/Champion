import 'package:cached_network_image/cached_network_image.dart';
import 'package:education/core/sharedWidgets/network_image.dart';
import 'package:education/core/theming/styles.dart';
import 'package:education/feature/cart/data/models/cart_item_model.dart';
import 'package:education/feature/coursedetails/data/models/product_model.dart';
import 'package:education/feature/home/logic/product_cubit.dart';
import 'package:education/feature/search/data/models/search_result_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/routes/routes.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/theming_change/theme_cubit.dart';
import '../../../cart/logic/cart_cubit.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget(this.product, {super.key, this.onremove});
  final SearchResult product;
  final Function()? onremove;

  @override
  Widget build(BuildContext context) {
    const String placeholderImageUrl =
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR7jXQjq1xMEMnB6Pirx0zJOHsi4DhYrhJ4txVuOzRw59k9PUSajaQCdmlGaDcqrarWxko&usqp=CAU';

    final imageUrl = product.images.isNotEmpty
        ? product.images.first.src
        : placeholderImageUrl;

    return Container(
      width: 375.w,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                // Navigator.pushNamed(context, Routes.DetailsScreen,
                //     arguments: product);
              },
              child: AppCachedNetworkImage(
                image: imageUrl,
                width: 70.w,
                height: 70.h,
                radius: 5,
              ),
            ),
            SizedBox(width: 13.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: ThemeCubit.get(context).themeMode== ThemeMode.light ?TextStyles.poppinsMedium16DarkGray
                        .copyWith(fontSize: 14):TextStyles.poppinsMedium16DarkGray
                        .copyWith(fontSize: 14,color: Colors.white),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    "No description available",
                    style:ThemeCubit.get(context).themeMode== ThemeMode.light ? TextStyles.poppinsRegular20lightGray
                        .copyWith(fontSize: 12): TextStyles.poppinsRegular20lightGray
                        .copyWith(fontSize: 12,color: Colors.white),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4.h),
                  Row(
                    children: [
                      Text(
                        "${product.salePrice} EGP",
                        style:ThemeCubit.get(context).themeMode== ThemeMode.light ? TextStyles.poppinsMedium20Blue:TextStyles.poppinsMedium20Blue.copyWith(color: Colors.white),
                      ),
                      SizedBox(width: 10.w),
                      SvgPicture.asset(
                        'assets/img/star.svg',
                        height: 16.h,
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        product.price + " EGP",
                        style:ThemeCubit.get(context).themeMode== ThemeMode.light ? TextStyles.poppinsRegular14lightGray
                            .copyWith(fontSize: 14):TextStyles.poppinsRegular14lightGray
                            .copyWith(fontSize: 14,color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
