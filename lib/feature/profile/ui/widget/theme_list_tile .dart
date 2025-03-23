import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/theming/theming_change/theme_cubit.dart';
import '../../../../generated/l10n.dart';
class ThemeListTile extends StatelessWidget {
  const ThemeListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () async {
            await  ThemeCubit.get(context).toggleTheme();
          },
          child: Row(
            children: [
              Text(S.of(context).Theme,
                  style: TextStyles.poppinsMedium16BlackMeduim),
              const Spacer(),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                      state.themeMode ==  ThemeMode.light
                        ? S.of(context).Light
                        : S.of(context).Dark,

                      style:  TextStyles. poppinsMedium16BlackDark.copyWith(color: ThemeCubit.get(context).themeMode== ThemeMode.light ? ColorsManager.lightGray : ColorsManager.mediumDarkGray,
                      )),
                  horizontalSpace(10),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 20.sp,
                    //color: ColorsManager.kPrimaryColor,
                  ),
                ],
              ),
            ],
          ),
        );

      },
    );
  }
}

