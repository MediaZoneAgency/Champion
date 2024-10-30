import 'package:education/core/helpers/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/sharedWidgets/app_text_button.dart';
import '../../../../core/sharedWidgets/custom_text.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';

import '../../../../generated/l10n.dart';
import '../../logic/sign_up_cubit.dart';

class VerifyCode extends StatefulWidget {
  const VerifyCode({super.key});
  @override
  State<VerifyCode> createState() => _VerifyCodeState();
}

class _VerifyCodeState extends State<VerifyCode> {
  final formKey = GlobalKey<FormState>();
  List<TextEditingController> otpController =
  List.generate(4, (index) => TextEditingController());

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    for (var element in otpController) {
      element.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
        child: _generateTextFormField(),
      ),
    );
  }
  Widget _generateTextFormField() {
    return SafeArea(
      child: Form(
        key: formKey,
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            verticalSpace(50),
            AppText(title: S.of(context).VerifyCode,description:S.of(context).Enterthecode,),

            verticalSpace(30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                otpController.length,
                    (index) {
                  return _textFormField(index);
                },
              ),
            ),
            verticalSpace(35),
            Text(S.of(context).DontreceiveOTPcode,
                style: TextStyles.poppinsRegular16Graymeduim),
            AppTextButton(
              horizontalPadding: 0,
              verticalPadding: 0,
              borderRadius: 10,
              buttonHeight: 58.h,
              buttonWidth: 327.w,
              buttonText: S.of(context).ResendOTP,
              textStyle: TextStyles.poppinsMedium16BlackMeduim,
              backgroundColor: Colors.transparent,
              onPressed: () {},
            ),
            verticalSpace(23),
            AppTextButton(
              borderRadius: 10,

              horizontalPadding: 0,
              buttonText: S.of(context).Verify, //S.of(context).Login,
              textStyle: TextStyles.poppinsMedium20white,
              verticalPadding: 3,
              buttonWidth: 327.w,
              buttonHeight: 55.h,
              onPressed: () async {
                if (formKey.currentState!.validate()) {
                  context.pushNamed(Routes.forgetPasswordScreen);
                }
              },

            ),
          ],
        ),
      ),
    );
  }

  Widget _textFormField(int index) {
    return Center(
      child: SizedBox(
        height: 44,
        width: 56,
        child: TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "";
            }
            return null;
          },
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          controller: otpController[index],
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(1),
          ],
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:  BorderSide(
                  color: ColorsManager.GrayLIght,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: ColorsManager.darkBlue,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Colors.red,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Colors.red,
                ),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 40,
              )
          ),

          onChanged: (value) {
            if (value.isEmpty) {
              SignUpCubit.get(context).focusPreviousField(context);
            } else {
              SignUpCubit.get(context).focusNextField(context);
            }
          },
        ),
      ),
    );
  }


}
