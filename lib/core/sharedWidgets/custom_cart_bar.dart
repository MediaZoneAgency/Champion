import 'package:education/core/helpers/extensions.dart';
import 'package:education/core/sharedWidgets/pop_back_button.dart';
import 'package:education/core/theming/theming_change/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors.dart';

import '../../../../generated/l10n.dart';
import '../theming/styles.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key, required this.title,
  });
final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: context.pop,
          child: SvgPicture.asset(
            'assets/img/Vector 8.svg',
          ),
        ),
        //
        horizontalSpace(70.w),
        
        Center(
          child: Text(
            title,
            style:
              ThemeCubit.get(context).themeMode== ThemeMode.light ?
             TextStyles.poppinsMedium18contantGray:TextStyles.poppinsMedium18contantGray.copyWith(color: Colors.white)
              ,
          ),
       
        ),
        Spacer()
      ],
    );
  }
}