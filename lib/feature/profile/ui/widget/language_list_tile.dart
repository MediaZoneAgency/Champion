
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/loclization/localization_cubit.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../generated/l10n.dart';

class LanguageListTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocalizationCubit, LocalizationState>(
      builder: (context, state) {
        return ListTile(
          title: Text(S.of(context).Language,style: TextStyles.poppinsMedium16BlackMeduim),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(LocalizationCubit.get(context).locale.languageCode == 'en' ? S.of(context).English : S.of(context).Arabic, style: TextStyles. poppinsMedium16BlackDark),
              Icon(
                Icons.arrow_forward_ios,
                size: 20.sp,
                color: ColorsManager.primaryColorLight,
              ),
            ],
          ),
          onTap: () {
            LocalizationCubit.get(context).toggleLanguage();

          },
        );
      },
    );
  }
}
