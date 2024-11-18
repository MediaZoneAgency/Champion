import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/sharedWidgets/app_text_button.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';

class PromoCode extends StatelessWidget {
  const PromoCode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(


        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(12.h),
         // contentPadding: EdgeInsets.all(12.h),
          focusedBorder: OutlineInputBorder(
        //    borderSide: BorderSide(color: ColorsManager.primaryColorLight),
            borderRadius: BorderRadius.circular(10.r),

          ),
          suffixIcon: Padding(
            padding: EdgeInsets.only(right: 20.0.w,top: 10.h),
            child: Text( 'Apply',
             style:  TextStyles.poppinsRegular16blue,

            )

          ),
          hintText: 'Promo code',
          hintStyle: TextStyles.poppinsRegular16LightGray,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xffeeeeee)),
            borderRadius: BorderRadius.circular(10.r),

          ),
        ));
  }
}