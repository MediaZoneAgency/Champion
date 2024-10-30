
import 'package:education/core/helpers/extensions.dart';
import 'package:education/core/sharedWidgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/sharedWidgets/app_text_button.dart';
import '../../../../core/sharedWidgets/app_text_form_field.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/utils/routes.dart';
import '../../../../generated/l10n.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../sign_up/ui/widgets/enter_your.dart';
import '../../logic/sign_in_cubit.dart';
import '../widget/sign_in_state.dart';


class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {

  final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override

  void dispose() {
   _passwordController.dispose();
    _confirmPasswordController.dispose();


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
                  AppText(title: S.of(context).NewPassword,description: "Enter Your new password",),
                  verticalSpace(16),
                  Form(
                    key: formKey,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 24, right: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          EnterYour(text: S.of(context).NewPassword),
                          verticalSpace(7),
                          AppTextFormField(hintText: "New Password",controller: _passwordController,
                            isObscureText:SignInCubit.get(context).isObscureText1,
                            suffixIcon:  GestureDetector(
                              onTap: () {
                  SignInCubit.get(context).obscureText1();
                  },
                    child: SignInCubit.get(context).isObscureText1
                        ? SvgPicture.asset(
                      'assets/img/eye.svg',
                      fit: BoxFit.scaleDown,
                    )
                        : SvgPicture.asset(
                      'assets/img/eye-slash.svg',
                      fit: BoxFit.scaleDown,
                    ),
                  ),
            ),
                          EnterYour(text: S.of(context).ConfirmPassword),
                          verticalSpace(7),
                          AppTextFormField(hintText: "Confirm Password",controller: _confirmPasswordController,
                            isObscureText:SignInCubit.get(context).isObscureText2,
                            suffixIcon: GestureDetector(
                              onTap: () {
                                SignInCubit.get(context).obscureText2();
                              },
                              child: SignInCubit.get(context).isObscureText2
                                  ? SvgPicture.asset(
                                'assets/img/eye.svg',
                                fit: BoxFit.scaleDown,
                              )
                                  : SvgPicture.asset(
                                'assets/img/eye-slash.svg',
                                fit: BoxFit.scaleDown,
                              ),
                            ),

                          ),
                          verticalSpace(138),
                          AppTextButton(
                            borderRadius: 10,
                            buttonHeight: 64.h,
                            buttonWidth: 326.w,
                            buttonText: S.of(context).Done,
                            textStyle: TextStyles.poppinsMedium20white,
                            onPressed: ()  async {
                              if (formKey.currentState!.validate()) {
                                context.pushNamed(Routes.loginScreen);
                              }
                            },
                          ),

                          verticalSpace(24),

                        ],


                      ),
                    ),
                  ),
                  SignInStateUi(),
                ],

              ),
            ),
          ),

        );
      },
    );

  }
}
