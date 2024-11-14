import 'package:education/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/helpers/spacing.dart';

class UiLoadingProfile extends StatelessWidget {
  const UiLoadingProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 26.0.w),
        child: Row(
          children: [
            CircleAvatar(
              radius: 27,
              backgroundColor: Colors.grey.shade300,
              child: SvgPicture.asset('assets/img/Ellipse 10.svg'),
            ),
            horizontalSpace(17),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "test user",
                  style: TextStyles.poppinsRegular16contantGray,
                ),
                Text(
                  "test@gmail.coooom",
                  style: TextStyles.poppinsRegular16LightGray,
                ),
              ],
            )
          ],
        ));
  }
}
