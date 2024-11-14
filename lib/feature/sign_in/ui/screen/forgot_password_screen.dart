import 'package:education/core/helpers/extensions.dart';
import 'package:education/core/theming/colors.dart';
import 'package:education/feature/sign_in/ui/widget/forget_password_stata_ui.dart';
import 'package:flutter_svg/svg.dart';
import 'package:icon_checkbox/icon_checkbox.dart';
import 'package:education/core/sharedWidgets/custom_text.dart';
import 'package:education/feature/sign_up/logic/sign_up_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/db/cash_helper.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/sharedWidgets/app_text_button.dart';
import '../../../../core/sharedWidgets/app_text_form_field.dart';
import '../../../../core/theming/styles.dart';
import '../../../../generated/l10n.dart';
import '../../../sign_up/ui/widgets/enter_your.dart';
import '../../logic/sign_in_cubit.dart';
import '../widget/sign_in_state.dart';


class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {

  final TextEditingController _emailController = TextEditingController();

  @override

  void dispose() {

    _emailController.dispose();

    super.dispose();
  }
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInCubit,SignInState>(

      builder: (BuildContext context,SignInState state) {
        return Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpace(50),
                  AppText(title: S.of(context).ForgotPassword,description: S.of(context).EnterEmail,),
                  verticalSpace(16),
                  Form(
                    key: formKey,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 24, right: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          EnterYour(text: S.of(context).Email),
                          verticalSpace(7),
                          AppTextFormField(hintText:S.of(context).EnterEmail,controller: _emailController,),
                          verticalSpace(227),

                          AppTextButton(
                            borderRadius: 10,
                            buttonHeight: 64.h,
                            buttonWidth: 327.w,
                            buttonText: S.of(context).Next,
                            textStyle: TextStyles.poppinsMedium20white,
                            onPressed: ()  {
                              if (formKey.currentState!.validate()) {
                                 CashHelper.putString(
                                  key: Keys.email,
                                  value: _emailController.text,
                                );
                                SignInCubit.get(context).forgetPaswword(_emailController.text);

                              }
                            },
                          ),

                          verticalSpace(24),

                        ],


                      ),
                    ),
                  ),
                  ForgetPasswordStateUi(),
                ],

              ),
            ),
          ),

        );
      },
    );

  }
}
