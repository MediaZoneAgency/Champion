import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../generated/l10n.dart';

class AdContainer extends StatelessWidget {
  const AdContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 330.w,
      height: 141.h,
      decoration: BoxDecoration(
        color: ColorsManager.BlueLIght,
        borderRadius: BorderRadius.circular(20), // اختصار لتحديد الزوايا
      ),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 17.w, right: 15.w, top: 20.h, bottom: 4.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // محاذاة النصوص إلى اليسار
              children: [
                Text(
                  S.of(context).Todaysspecial,
                  style: TextStyles.poppinsMedium20white,
                ),
                SizedBox(height: 4.h),
                SizedBox(
                  width: 165.w, // تحديد عرض لضمان احتواء النص
                  child: Text(
                    S.of(context).bestfeatures,
                    style: TextStyles.poppinsMedium12white,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    softWrap: true,
                  ),
                ),
              ],
            ),

          ),
          Padding(
            padding: EdgeInsets.only(left:16.w, top: 30.h,right: 3.w),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center, // محاذاة النصوص إلى اليسار
              children: [
                Text(
                  S.of(context).Endsin,
                  style: TextStyles.poppinsRegular14white,
                ),
                SizedBox(height: 4.h),
                Text(
                  "5h 51m 16s",
                  style: TextStyles.poppinsMedium20white,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  softWrap: true,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
