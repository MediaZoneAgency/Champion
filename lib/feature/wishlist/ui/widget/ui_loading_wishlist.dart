import 'package:education/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/sharedWidgets/network_image.dart';

class UiLoadingWishlist extends StatelessWidget {
  const UiLoadingWishlist({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 375.w,
      child: Padding(
        padding: EdgeInsets.only(left: 15.w,right: 15.w,top: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 2),
              child: AppCachedNetworkImage(
                image: "https://img.freepik.com/free-photo/abstract-surface-textures-white-concrete-stone-wall_74190-8189.jpg",
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
                    "testttttt",
                    style: TextStyles.poppinsMedium18contantGray,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4.h),

                  ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 220.w), // Limit text width
                    child: RichText(
                      maxLines: 2,
                      //overflow: TextOverflow.ellipsis,
                      text: TextSpan(

                        children: [
                          TextSpan(
                            text:
                            "tesssssttttttttt..." ?? "Description not available",
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

                  SizedBox(height: 4.h),
                  Row(
                    children: [
                      Text("450EGP",
                        style: TextStyles.poppinsMedium20Blue.copyWith(fontSize: 18),
                      ),
                      SizedBox(width: 4.h),
                      Row(
                        children: [

                          Text(
                           '23393',
                            style: TextStyles.poppinsRegular14lightGray.copyWith(fontSize: 16),
                          ),
                        ],
                      ),

                      Spacer(),

                        GestureDetector(
                            onTap: () {},
                            child: SvgPicture.asset('assets/img/trash.svg'),
                          )

                     // Push trash icon to the right
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
