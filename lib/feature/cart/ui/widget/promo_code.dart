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
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      height: 60.h,
      width: 327.w,
      child: TextField(


          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
          //    borderSide: BorderSide(color: ColorsManager.primaryColorLight),
              borderRadius: BorderRadius.circular(17.r),

            ),
            suffixIcon: Padding(
              padding: EdgeInsets.only(right: 8.0.w,top: 8.h,bottom: 8.h),
              child: AppTextButton(buttonText: 'Apply', textStyle: TextStyles.poppinsRegular16blue, onPressed: (){},borderRadius: 15.r,buttonHeight: 44.h,buttonWidth: 97,backgroundColor:  Colors.white,),
            ),
            hintText: 'Promo code',
            hintStyle: TextStyles.poppinsRegular16LightGray,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xffeeeeee)),
              borderRadius: BorderRadius.circular(17.r),

            ),
          )),
    );
  }
}