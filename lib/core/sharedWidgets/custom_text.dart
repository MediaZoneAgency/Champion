import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../generated/l10n.dart';
import '../helpers/spacing.dart';
import '../theming/colors.dart';

import '../theming/styles.dart';

class AppText extends StatelessWidget {

  const AppText({super.key, required this.title, required this.description, });
 final String title;
 final String description;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Center(
          child: Text(
           title,
            style: TextStyles.poppinsMedium24ContantGray,
          ),
        ),
        Center(
          child: Text(
            description,
            style: TextStyles.poppinsRegular12ContantGray,
            textAlign: TextAlign.center,
            maxLines: 1,
          ),
        ),
      ],
    );

  }
}