import 'package:education/core/theming/colors.dart';
import 'package:education/core/theming/styles.dart';
import 'package:education/core/theming/theming_change/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class RewardsOffer extends StatelessWidget {
  const RewardsOffer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.only(left: 16.w, top: 28.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
               "",
                  width: 155.w, height: 161.h, fit: BoxFit.cover),
              SizedBox(height: 5.h),
              Text(
                'Redeem & Get 50%\noff on education course',
                style: TextStyles.poppinsRegular16ContantGray.copyWith(
                  color: ThemeCubit.get(context).themeMode == ThemeMode.light
                      ? ColorsManager.black
                      : Colors.white,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 5.h),
              Text('25 Points', style: TextStyles.poppinsRegular16ContantGray),
            ],
          ),
        );
      },
    );
  }
}
