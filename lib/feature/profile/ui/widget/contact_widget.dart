import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';

class ContactDetails extends StatelessWidget {
  const ContactDetails({super.key, required this.managerEmail, required this.managerPhone});
  final String managerEmail;
  final String managerPhone;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 22.0.h),
      child: Container(
        height: 44.h,
        width: 312.w,
        decoration: BoxDecoration(
          color: ColorsManager.mainThemeColor,
          borderRadius: BorderRadius.circular(30.r),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 15.0.w, right: 8.w),
              child: SvgPicture.asset('assets/img/mail-01.svg'),
            ),
            Text(
              managerEmail,
              style: TextStyles.poppinsMedium12ContantGray,
            ),
            Padding(
              padding:  EdgeInsets.only(bottom: 8.0.h,top: 14.h),
              //child: SvgPicture.asset(Images.line),
            ),
            Padding(
              padding: EdgeInsets.only(left: 9.0.w, right: 8.w),
              child: SvgPicture.asset('assets/img/call.svg'),
            ),
            Text(
              managerPhone,
              style: TextStyles.poppinsMedium12ContantGray,
            )
          ],
        ),
      ),
    );
  }
}