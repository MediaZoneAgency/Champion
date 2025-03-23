import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../generated/l10n.dart';
import '../helpers/spacing.dart';
import '../theming/colors.dart';

import '../theming/styles.dart';
import '../theming/theming_change/theme_cubit.dart';

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
            style:ThemeCubit.get(context).themeMode== ThemeMode.light ? TextStyles.poppinsMedium24ContantGray : TextStyles.poppinsMedium24ContantGray.copyWith(color: Color(0xffFFFFFF)),
          ),
        ),
        Center(
          child: Text(
            description,
            style: ThemeCubit.get(context).themeMode== ThemeMode.light ?TextStyles.poppinsRegular12ContantGray:TextStyles.poppinsRegular12ContantGray.copyWith(color:  Color(0xffFFFFFF)),

            textAlign: TextAlign.center,
            maxLines: 1,
          ),
        ),
      ],
    );

  }
}