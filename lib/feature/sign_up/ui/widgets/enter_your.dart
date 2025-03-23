
import 'package:flutter/material.dart';

import '../../../../core/theming/styles.dart';
import '../../../../core/theming/theming_change/theme_cubit.dart';

class EnterYour extends StatelessWidget {
  final String text;
  const EnterYour ({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text,
      style:
      ThemeCubit.get(context).themeMode== ThemeMode.light ?
    TextStyles.poppinsRegular16Gray:
    TextStyles.poppinsRegular16Gray.copyWith(color: Colors.white),);
  }
}