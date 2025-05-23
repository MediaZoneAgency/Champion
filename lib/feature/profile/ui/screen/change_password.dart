import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/sharedWidgets/app_text_button.dart';
import '../../../../core/sharedWidgets/app_text_form_field.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/theming/theming_change/theme_cubit.dart';
import '../../../../generated/l10n.dart';


class ChangePasswordScreen extends StatefulWidget {
  ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title:  Text(S.of(context).ChangePassword,
          style:
          ThemeCubit.get(context).themeMode== ThemeMode.light ?
        TextStyles.poppinsMedium18contantGray: TextStyles.poppinsMedium18contantGray.copyWith(color: Colors.white
          )),),
      backgroundColor: Colors.white,
      body: Column(
        children: [

          verticalSpace(15.h),

          SizedBox(height: 16.h,),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  S.of(context).Name,
                  style:
                  ThemeCubit.get(context).themeMode== ThemeMode.light ?
                  TextStyles.poppinsRegular16Gray:TextStyles.poppinsRegular16Gray.copyWith(color:Colors.white),
                ),
                SizedBox(height: 8.h,),
                AppTextFormField(hintText: S.of(context).Name,controller: _nameController,),
                SizedBox(height: 16.h,),
                Text(
                  S.of(context).Email,
                    style:
                    ThemeCubit.get(context).themeMode== ThemeMode.light ?
                    TextStyles.poppinsRegular16Gray:TextStyles.poppinsRegular16Gray.copyWith(color:Colors.white)
                ),
                SizedBox(height: 8.h,),
                AppTextFormField(hintText: S.of(context).Email,controller: _emailController,),
                SizedBox(height: 34,),
                AppTextButton(
                  borderRadius: 10,
                  buttonHeight: 58.h,
                  buttonWidth: 327.w,
                  buttonText: S.of(context).Done,
                  textStyle: TextStyles.poppinsMedium20white,
                  onPressed: ()  {
                    // Check if the form is valid before proceeding

                  },
                ),
              ],
            ),
          ),
          verticalSpace(51.h),

        ],
      ),

    );
  }
}
