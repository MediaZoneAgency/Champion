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
          child: 
          Padding(padding: const EdgeInsets.only(left: 20,right: 20),
         child:  Row(

            children: [
              Text(S.of(context).Theme,
                  style: 
                  ThemeCubit.get(context).themeMode== ThemeMode.light ?
                  TextStyles.poppinsMedium16BlackMeduim: TextStyles.poppinsMedium16BlackMeduim.copyWith(color: Colors.white)),
              const Spacer(),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                      state.themeMode ==  ThemeMode.light
                        ? S.of(context).Light
                        : S.of(context).Dark,

                      style:  TextStyles. poppinsMedium16BlackDark.copyWith(color: ThemeCubit.get(context).themeMode== ThemeMode.light ? ColorsManager.mediumDarkGray : 
                       ColorsManager.lightGray
                      ,
                      )),
                  horizontalSpace(10),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 20.sp,
                    color: ColorsManager.primaryColorLight,
                  ),
                ],
              ),
            ],
          ),)
        );

      },
    );
  }
}

