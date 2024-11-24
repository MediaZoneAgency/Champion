import 'package:education/core/theming/colors.dart';
import 'package:education/feature/sign_up/data/models/register_model.dart';
import 'package:flutter_svg/svg.dart';
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
import 'package:url_launcher/url_launcher.dart';

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
  final TextEditingController _PasswordConfirmController =
      TextEditingController();

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
    return BlocBuilder<SignUpCubit, SignUpState>(
      builder: (BuildContext context, SignUpState state) {
        return Scaffold(
          body: SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24,vertical:24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    verticalSpace(20.h),
                     Center(
                       child: SizedBox(
                         height: 72.h,
                         width: 280.w,
                         child: Column(

                           children: [
                             Text(
                              S.of(context).createAccount,
                               style: TextStyles.poppinsMedium24ContantGray,
                             ),
                                                 Text(
                                                   S.of(context).Fillaccount,
                                                   style: TextStyles.poppinsRegular12ContantGray,
                                                   textAlign: TextAlign.center,
                                                   maxLines: 2,
                                                 ),
                           ],
                         ),
                       ),
                     ),
                    verticalSpace(16),
                    Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          verticalSpace(16),
                          AppTextFormField(
                            labeltext: S.of(context).Name ,
                            contentPadding: EdgeInsets.all(12.h),
                            hintText: "",
                            controller: _nameController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return S.of(context).namecannotbeempty;
                              }
                              return null;
                            },
                          ),
                          verticalSpace(16),
                          AppTextFormField(
                            labeltext: S.of(context).Email,
                            contentPadding: EdgeInsets.all(12.h),
                            hintText:"",
                            controller: _emailController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return S.of(context).Emailcannotbeempty;
                              }
                              // Regular expression for email validation
                              final emailRegex = RegExp(
                                  r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
                              if (!emailRegex.hasMatch(value)) {
                                return S.of(context).Enteravalidemailaddress;
                              }
                              return null;
                            },
                          ),

                          verticalSpace(16),
                          BlocBuilder<SignUpCubit, SignUpState>(
                            builder: (context, state) {
                              return AppTextFormField(
                                labeltext:S.of(context).Password ,
                                contentPadding: EdgeInsets.all(12.h),
                                controller: _passwordController,
                                hintText:"",
                                isObscureText:
                                    SignUpCubit.get(context).isObscureText1,
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    SignUpCubit.get(context).obscureText1();
                                  },
                                  child: Icon(
                                    SignUpCubit.get(context).isObscureText1
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return S.of(context).Emailcannotbeempty;
                                  }

                                  bool hasNumber = false;
                                  bool hasCapitalLetter = false;

                                  for (int i = 0; i < value.length; i++) {
                                    if ('0123456789'.contains(value[i])) {
                                      hasNumber = true;
                                    }
                                    if ('ABCDEFGHIJKLMNOPQRSTUVWXYZ'
                                        .contains(value[i])) {
                                      hasCapitalLetter = true;
                                    }
                                    if (hasNumber && hasCapitalLetter) {
                                      break;
                                    }
                                  }

                                  if (!hasNumber || !hasCapitalLetter) {
                                    return "must have a CapitalLetter and Number";
                                  }

                                  return null;
                                },
                              );
                            },
                          ),

                          verticalSpace(16),
                          AppTextFormField(
                            labeltext: S.of(context).ConfirmPassword,
                            controller: _PasswordConfirmController,
                            hintText: "",
                            borderRadius: 10.r,
                            backgroundColor: Colors.transparent,
                            contentPadding: EdgeInsets.only(left: 12,top:12,right: 12),
                            isObscureText:
                                SignUpCubit.get(context).isObscureText2,
                            suffixIcon: GestureDetector(
                                onTap: () {
                                  SignUpCubit.get(context).obscureText2();
                                },
                                child: Icon(
                                    SignUpCubit.get(context).isObscureText2
                                        ? Icons.visibility_off
                                        : Icons.visibility)),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return S.of(context).passwordcannotbeempty;
                              } else if (_passwordController.text !=
                                  _PasswordConfirmController.text) {
                                return S.of(context).passwordcannotbeempty;
                              }
                              return null;
                            },
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,

                            children: [
                              BlocBuilder<SignUpCubit, SignUpState>(
                                builder: (context, state) {
                                  return Checkbox(
                                    activeColor: ColorsManager.primaryColorLight,
                                 //   checkColor: ColorsManager.primaryColorLight,
                                    value: SignUpCubit.get(context).isChecked,
                                    onChanged: (newValue) {
                                      SignUpCubit.get(context)
                                          .changeCheckboxValue(newValue!);
                                    },
                                  );
                                },
                              ),
                              Text(S.of(context).Agreewith,
                                  style: TextStyles.poppinsRegular12LightGray),GestureDetector(
                                onTap: () async {
                                  final Uri url = Uri.parse('https://clusters.mediazoneag.com/privacy-policy/');
                                  if (await launchUrl(url)) {
                                    await launchUrl(url, mode: LaunchMode.externalApplication); // يفتح الرابط في المتصفح
                                  } else {
                                    throw 'Could not launch $url';
                                  }
                                },
                                child: Text(
                                  S.of(context).TermsConditions,
                                  style: TextStyles.poppinsRegular12Blue.copyWith(
                                    decoration: TextDecoration.underline,
                                    decorationColor: TextStyles.poppinsRegular12Blue.color,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          verticalSpace(16),
                          AppTextButton(
                            horizontalPadding: 10,
                            verticalPadding: 10,
                            borderRadius: 10,
                            buttonHeight: 58.h,
                            buttonWidth: 327.w,
                            buttonText: S.of(context).SignUp,
                            textStyle: TextStyles.poppinsMedium20white,
                            onPressed: () async {
                              if (formKey.currentState!.validate()) {
                                await SignUpCubit.get(context).signUp(
                                  RegisterRequestModel(
                                      username: _nameController.text,
                                      email: _emailController.text,
                                      password: _passwordController.text,
                                      phoneNumber: '01060938188'),
                                );
                              }
                            },
                          ),
                          verticalSpace(24),
                          Row(
                            children: [
                              Expanded(
                                  child: Divider(
                                      color: ColorsManager.Blackmeduim)),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 25.0),
                                child: Text(S.of(context).Orsignup,
                                    style:
                                        TextStyles.poppinsMedium16BlackMeduim),
                              ),
                              Expanded(
                                  child: Divider(
                                      color: ColorsManager.Blackmeduim)),
                            ],
                          ),
                          verticalSpace(20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                icon: SvgPicture.asset(
                                  'assets/img/apple.svg',
                                ),
                                onPressed: () {},
                              ),
                              SizedBox(width: 40),
                              IconButton(
                                icon: SvgPicture.asset(
                                  'assets/img/google.svg',
                                ),
                                onPressed: () {},
                              ),
                              SizedBox(width: 40),
                              IconButton(
                                icon: SvgPicture.asset(
                                  'assets/img/facebook.svg',
                                ),
                                onPressed: () {},
                              ),
                            ],
                          ),
                          SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(S.of(context).Alreadyhaveanaccount,
                                  style: TextStyles.poppinsMedium16BlackMeduim),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, Routes.loginScreen);
                                },
                                child: Text(S.of(context).Login,
                                    style: TextStyles.poppinsRegular16Blue
                                        .copyWith(
                                      decoration: TextDecoration.underline,
                                        decorationColor: TextStyles.poppinsRegular16Blue.color
                                    )),
                              ),
                            ],
                          ),
                          verticalSpace(16),
                          Center(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, Routes.navBarScreen);
                              },
                              child: Text(S.of(context).continueasguest,
                                  style:
                                      TextStyles.poppinsMedium20Blue.copyWith(
                                    fontSize: 16.sp,
                                    decoration: TextDecoration.underline,
                                          decorationColor: TextStyles.poppinsMedium20Blue.color

                                  )),
                            ),
                          ),
                          verticalSpace(20),
                        ],
                      ),
                    ),
                    SignUpStateUi(),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
