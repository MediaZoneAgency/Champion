
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../theming/colors.dart';
import '../theming/styles.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(left: 14,right: 14,),
      child: Container(
        height: 44.h,
        width: 330.w,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(10),

            ),
            border: Border.all(color: ColorsManager.GrayLIght),
            ),
        child: TextFormField(
          decoration: InputDecoration(
           // contentPadding: EdgeInsets.only(left: 20.w,top: 15.h,bottom: 15.h),
            hintStyle: TextStyles.poppinsRegular14lightGray,
              border: InputBorder.none,
              hintText: 'Search for Your profession',
              prefixIcon: SvgPicture.asset(
                'assets/img/ri_search-line.svg',
                fit: BoxFit.scaleDown,
              ),
            suffixIcon:  SvgPicture.asset(
              'assets/img/ri_equalizer-fill.svg',
              fit: BoxFit.scaleDown,
            ),
          ),
        ),

      ),
    );

  }
}