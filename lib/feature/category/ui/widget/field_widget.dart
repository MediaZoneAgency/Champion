
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/theming/styles.dart';
import '../../../../core/theming/theming_change/theme_cubit.dart';


class FieldWidget extends StatelessWidget {
  const FieldWidget({super.key, required this.title, required this.onPressed});
final String title ;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap:onPressed,
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20,bottom: 24),
        child: Row(
          children: [
            Text(
              title,
              style:ThemeCubit.get(context).themeMode== ThemeMode.light ?  TextStyles.poppinsRegular16contantGray:TextStyles.poppinsRegular16contantGray.copyWith(color: Colors.white),
            ),
            const Spacer(),
            SvgPicture.asset(
              ThemeCubit.get(context).themeMode== ThemeMode.light ?
              'assets/img/arrow-right (1).svg':'assets/img/arrow-rightdark.svg',
              fit: BoxFit.scaleDown,
            ),

          ],
        ),
      ),
    );

  }
}