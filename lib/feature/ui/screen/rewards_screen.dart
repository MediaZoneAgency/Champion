import 'package:education/core/theming/colors.dart';
import 'package:education/core/theming/styles.dart';
import 'package:education/core/theming/theming_change/theme_cubit.dart';
import 'package:education/feature/ui/widgets/custom_svg.dart';
import 'package:education/feature/ui/widgets/rewards_offer.dart';
import 'package:education/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class RewardsScreen extends StatelessWidget {
  const RewardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: ThemeCubit.get(context).themeMode == ThemeMode.light
              ? Colors.white
              :Colors.black,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 18.w, top: 60.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back, // استبدال barIcon بأيقونة مناسبة
                          size: 25,
                          color: ThemeCubit.get(context).themeMode ==
                                  ThemeMode.light
                              ? ColorsManager.darkBlack
                              : Colors.white,
                        ),
                      ),
                      SizedBox(width: 50.w),
                      Text(
                        S.of(context).rewards,
                        style:
                            ThemeCubit.get(context).themeMode == ThemeMode.light
                                ? TextStyles.poppinsMedium12contantGray:TextStyles.poppinsMedium12contantGray.copyWith(color: Colors.white),
                      ),
                      SizedBox(width: 50.w),
                      Container(
                        width: 72.w,
                        height: 38.h,
                        decoration: BoxDecoration(
                          color: ThemeCubit.get(context).themeMode ==
                                  ThemeMode.light
                              ? Colors.white
                              : ColorsManager.darkBlack,
                          borderRadius: BorderRadius.circular(10.r),
                          boxShadow: [
                            BoxShadow(
                              color: ThemeCubit.get(context).themeMode ==
                                      ThemeMode.light
                                  ? ColorsManager.GrayLIght.withOpacity(0.5)
                                  : ColorsManager.gray.withOpacity(0.5),
                              blurRadius: 12.r,
                              spreadRadius: 0,
                              offset: Offset(0, 0),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '160',
                              style: TextStyles.poppinsRegular16ContantGray.copyWith(
                                color: ThemeCubit.get(context).themeMode ==
                                        ThemeMode.light
                                    ? ColorsManager.black
                                    : ColorsManager.WhiteGray,
                              ),
                            ),
                            SizedBox(width: 5.w),
                            const CustomSvg(
                              imgPath:"assets/img/reward.svg",
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const RewardsOffer(),
              ],
            ),
          ),
        );
      },
    );
  }
}
