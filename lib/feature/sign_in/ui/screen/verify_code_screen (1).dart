
import 'package:education/feature/sign_in/logic/sign_in_cubit.dart';
import 'package:flutter/material.dart';

import '../../../../core/db/cash_helper.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/sharedWidgets/app_text_button.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../generated/l10n.dart';
import '../../data/models/otp_model.dart';
import '../widget/app_otp_text_field.dart';
import '../widget/otp_state_ui.dart';

class VerifyCode extends StatefulWidget {
  const VerifyCode({super.key});

  @override
  State<VerifyCode> createState() => _VerifyCodeState();
}

class _VerifyCodeState extends State<VerifyCode> {
  final formKey = GlobalKey<FormState>();

  List<TextEditingController> otpControllers =
      List.generate(6, (index) => TextEditingController());
  List<FocusNode> focusNodes = List.generate(6, (index) => FocusNode());

  @override
  void dispose() {
    for (var controller in otpControllers) {
      controller.dispose();
    }
    for (var focusNode in focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
        child: SafeArea(
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  verticalSpace(50),
                  Text(S.of(context).VerifyCode,
                      style: TextStyles.poppinsMedium24ContantGray),
                  Text(S.of(context).Enterthecode,
                      style: TextStyles.poppinsRegular12ContantGray),
                  Text('yaraafifi106@gmail.com',
                      style: TextStyles.poppinsRegular12ContantGray),
                  verticalSpace(100),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                      otpControllers.length,
                      (index) {
                        return OtpInputField(
                          controller: otpControllers[index],
                          focusNode: focusNodes[index],
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "!!!!";
                            }
                            return null;
                          },
                          onChanged: (value) {
                            if (value.isEmpty) {
                              SignInCubit.get(context).focusPreviousField(context);
                            } else {
                              SignInCubit.get(context).focusNextField(context);
                            }
                          },
                        );
                      },
                    ),
                  ),
                  verticalSpace(20),
                  Text(S.of(context).DontreceiveOTPcode,
                      style: TextStyles.poppinsRegular16Graymeduim),
                  AppTextButton(
                    buttonText: S.of(context).ResendOTP,
                    textStyle: TextStyles.poppinsMedium16BlackMeduim,
                    backgroundColor: Colors.transparent,
                    onPressed: () {
                      SignInCubit.get(context).clearOtpFields(otpControllers);
                      // SignInCubit.get(context).resendCode("${CashHelper.getString(key: Keys.email)}");
                    },
                  ),
                  verticalSpace(70),
                  AppTextButton(
                    buttonText: S.of(context).Verify,
                    textStyle: TextStyles.poppinsMedium20white,
                    verticalPadding: 3,
                    buttonHeight: 55,
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        final otpValue = otpControllers.map((controller) => controller.text).join();
                        CashHelper.putString(key: Keys.otp, value: otpValue);
                        SignInCubit.get(context).otp(OtpModel(
                          email: CashHelper.getString(key: Keys.email),
                          otp: otpValue,
                        ));
                      }
                    },
                  ),
                  const OtpStateUi(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
