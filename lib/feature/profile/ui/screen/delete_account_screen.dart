
import 'package:education/core/helpers/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/sharedWidgets/app_text_button.dart';
import '../../../../core/theming/font_weight.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/theming/theming_change/theme_cubit.dart';
import '../../../../generated/l10n.dart';
import '../../logic/profile_cubit.dart';
import '../widget/delete_account_state_ui.dart';

class DeleteAccountScreen extends StatelessWidget {
  const DeleteAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 150),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.warning_rounded,
                    color: Colors.red,
                    size: 35, // Adjust size to your liking
                  ),
                  horizontalSpace(3),
                  Padding(
                    padding: EdgeInsets.only(top: 5.0.h),
                    child: Text(
                      S.of(context).Deletingyouraccountwill,
                      style:
                      ThemeCubit.get(context).themeMode== ThemeMode.light ?
                      TextStyles.poppinsMedium20BlackMeduim:  TextStyles.poppinsMedium20BlackMeduim.copyWith(color:Colors.white)
                    ),
                  ),
                ],
              ),
              verticalSpace(
                      15,
                    ),
              Text(
                "- ${S.of(context).Deleteyouraccountinfo}\n"
                "- ${S.of(context).Removeallyourdata}\n"
                "- ${S.of(context).Deleteyourhistory}\n",
                style: TextStyles.poppinsMedium16BlackDark.copyWith(fontWeight: FontWeightHelper.regular),
              ),
              verticalSpace(100),
              AppTextButton(
                  buttonText: S.of(context).DeleteYourAccount,
                  textStyle: TextStyles.poppinsMedium18LightGray.copyWith(color: Colors.white),
                  onPressed: () {
                      ProfileCubit.get(context).deletUserAccount();
                  },
                  buttonWidth: 330.w,
                  verticalPadding: 10,
                ),
                verticalSpace(20),
                AppTextButton(
                  buttonText: S.of(context).Cansel,
                  textStyle: TextStyles.poppinsMedium18LightGray.copyWith(color: Colors.white),
                  onPressed: () {
                    context.pop();
                  },
                  buttonWidth: 330.w,
                  //backgroundColor: Colors.transparent,
                  verticalPadding: 10,
                ),
                const DeleteAccountStateUi(),
            ],
          ),
        ),
      ),
    );
  }
}
