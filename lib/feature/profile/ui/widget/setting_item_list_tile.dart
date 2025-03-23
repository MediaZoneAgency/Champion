
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/theming/theming_change/theme_cubit.dart';

class SettingItemListTile extends StatelessWidget {
  const SettingItemListTile({super.key, required this.title, required this.onTap});
  final String title;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(
                title,
                style:
                ThemeCubit.get(context).themeMode== ThemeMode.light ?
                TextStyles.poppinsMedium16BlackMeduim: TextStyles.poppinsMedium16BlackMeduim.copyWith(color: Colors.white)),
        trailing:  Icon(
              Icons.arrow_forward_ios,
              size: 20.sp,
              color: ColorsManager.primaryColorLight,
            ),
            onTap:onTap
    );
  }
}