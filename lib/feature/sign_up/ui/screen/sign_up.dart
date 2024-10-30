import 'package:education/core/theming/colors.dart';
import 'package:flutter_svg/svg.dart';
import 'package:icon_checkbox/icon_checkbox.dart';
import 'package:education/core/sharedWidgets/custom_text.dart';
import 'package:education/feature/sign_up/logic/sign_up_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/sharedWidgets/app_text_button.dart';
import '../../../../core/sharedWidgets/app_text_form_field.dart';
import '../../../../core/theming/styles.dart';
import '../../../../generated/l10n.dart';
import '../widgets/enter_your.dart';
import '../widgets/sign_up_state.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _PasswordConfirmController = TextEditingController();
  bool _isChecked = false;
  @override

  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
    _PasswordConfirmController.dispose();

    super.dispose();
  }
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit,SignUpState>(

      builder: (BuildContext context,SignUpState state) {
        return Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpace(64),
                  AppText(title:S.of(context).createAccount,description:S.of(context).Fillaccount),
                  verticalSpace(16),
                  Form(
                    key: formKey,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 24, right: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          EnterYour(text: S.of(context).Name),
                          verticalSpace(7),
                          AppTextFormField(hintText: S.of(context).Name,controller: _nameController,),
                          verticalSpace(12),

                          EnterYour(text: S.of(context).Email),
                          verticalSpace(7),
                          AppTextFormField(hintText: S.of(context).Email,controller: _emailController,),
                          verticalSpace(12),
                          EnterYour(
                            text: S.of(context).Password,
                          ),
                          verticalSpace(7),
                          AppTextFormField(
                            controller: _passwordController,
                            hintText: S.of(context).Password,
                            isObscureText:SignUpCubit.get(context).isObscureText2,
                            suffixIcon: GestureDetector(
                              onTap: () {
                                SignUpCubit.get(context).obscureText2();
                              },
                              child: Icon(
                               SignUpCubit.get(context).isObscureText2
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                            ),
                          ),
                          verticalSpace(12),
                          Row(
                            children: [
                              Checkbox(
                                value: _isChecked,
                                onChanged: (bool? value) {
                                  setState(() {
                                    _isChecked = value ?? false;
                                  });
                                },
                              ),
                              Text(S.of(context).Agreewith,

                              style: TextStyles.poppinsRegular12LightGray),
                              GestureDetector(
                                onTap: () {
                                  // Handle Terms & Conditions tap
                                },
                                child: Text(
                                 S.of(context).TermsConditions,
                                  style: TextStyles.poppinsRegular12Blue
                                ),
                              ),
                            ],
                          ),

                          verticalSpace(20),
                          AppTextButton(
                            borderRadius: 10,
                            buttonHeight: 58.h,
                            buttonWidth: 327.w,
                            buttonText: S.of(context).SignUp,
                            textStyle: TextStyles.poppinsMedium20white,
                            onPressed: ()  async {
                              Navigator.pushNamed(context, Routes.OTPScreen);
                            },
                          ),

                          verticalSpace(24),
                          Row(
                            children: [
                              Expanded(child: Divider(color:ColorsManager.Blackmeduim)),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(S.of(context).Orsignup,
                                    style: TextStyles.poppinsMedium16BlackMeduim),
                              ),
                              Expanded(child: Divider(color: ColorsManager.Blackmeduim)),
                            ],
                          ),
                          verticalSpace(20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                icon: SvgPicture.asset(
                                  'assets/img/apple.svg',
                                ), onPressed: () {  },
                              ),
                              SizedBox(width: 40),
                              IconButton(
                                icon: SvgPicture.asset(
                                  'assets/img/google.svg',
                                ), onPressed: () {  },
                              ),
                              SizedBox(width: 40),
                              IconButton(
                                icon:SvgPicture.asset(
                                  'assets/img/facebook.svg',
                                ), onPressed: () {  },
                              ),
                            ],
                          ),
                          SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(S.of(context).Alreadyhaveanaccount,style: TextStyles.poppinsMedium16BlackMeduim),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, Routes.loginScreen);
                                },
                                child: Text(
                                  S.of(context).Login,
                                  style: TextStyles.poppinsRegular16Blue.copyWith(
                                    decoration: TextDecoration.underline,
                                  )
                                ),
                              ),
                            ],
                          ),
                        ],


                      ),
                    ),
                  ),
                  SignUpStateUi(),
                ],

              ),
            ),
          ),

        );
      },
    );

  }
}
