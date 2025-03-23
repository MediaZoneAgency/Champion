import 'package:education/core/theming/colors.dart';
import 'package:education/feature/sign_up/data/models/register_model.dart';
import 'package:flutter_svg/svg.dart';
import 'package:education/feature/sign_up/logic/sign_up_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/sharedWidgets/app_text_button.dart';
import '../../../../core/sharedWidgets/app_text_form_field.dart';
import '../../../../core/sharedWidgets/show_dialog_error.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/theming/theming_change/theme_cubit.dart';
import '../../../../generated/l10n.dart';
import '../../../nav_bar/logic/nav_bar_cubit.dart';
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
                        // height: 72.h,
                        width: 280.w,
                         child: Column(

                           children: [
                             Text(
                              S.of(context).createAccount,
                               style:ThemeCubit.get(context).themeMode== ThemeMode.light ? TextStyles.poppinsMedium24ContantGray : TextStyles.poppinsMedium24ContantGray.copyWith(color: Color(0xffFFFFFF)),
                             ),
                                                 Text(
                                                   S.of(context).Fillaccount,
                                                   style: ThemeCubit.get(context).themeMode== ThemeMode.light ?TextStyles.poppinsRegular12ContantGray:TextStyles.poppinsRegular12ContantGray.copyWith(color:  Color(0xffFFFFFF)),
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
                                return S.of(context).Passwordsdontmatch;
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
                                  style:ThemeCubit.get(context).themeMode== ThemeMode.light ? TextStyles.poppinsRegular12LightGray:TextStyles.poppinsRegular12LightGray.copyWith(color:Colors.white)
                              ),GestureDetector(
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
                                  style:  ThemeCubit.get(context).themeMode== ThemeMode.light ?TextStyles.poppinsRegular12Blue.copyWith(
                                    decoration: TextDecoration.underline,
                                    decorationColor: TextStyles.poppinsRegular12Blue.color,
                                  ):TextStyles.poppinsRegular12Blue.copyWith(

                                  //  color: ColorsManager.primaryColorLight,
                                    decoration: TextDecoration.underline,
                                    decorationColor: TextStyles.poppinsRegular12Blue.color,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          verticalSpace(10),
                          AppTextButton(
                            horizontalPadding: 10,
                            verticalPadding: 10,
                            borderRadius: 10,
                            buttonHeight: 58.h,
                            buttonWidth: 340,
                            buttonText: S.of(context).SignUp,
                            textStyle: TextStyles.poppinsMedium20white,
                            onPressed: () async {
                              if (formKey.currentState!.validate()) {
                                if ( SignUpCubit.get(context).isChecked == true){
                                  await SignUpCubit.get(context).signUp(
                                    RegisterRequestModel(
                                        username: _nameController.text,
                                        email: _emailController.text,
                                        password: _passwordController.text,
                                        ),
                                  );
                                }
                                Fluttertoast.showToast(
                                  msg: "Check the terms and conditions",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  backgroundColor: ColorsManager.primaryColorLight,
                                  textColor: Colors.white,
                                  fontSize: 16.0,
                                );
                              }
                            },
                          ),
                          verticalSpace(24),
                          Row(
                            children: [
                              Expanded(
                                  child: Divider(
                                      color: ThemeCubit.get(context).themeMode== ThemeMode.light ?ColorsManager.Blackmeduim:Colors.white)),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 25.0),
                                child: Text(S.of(context).Orsignup,
                                    style:
                                    ThemeCubit.get(context).themeMode== ThemeMode.light ?   TextStyles.poppinsMedium16BlackMeduim :TextStyles.poppinsMedium16BlackMeduim.copyWith(color:Colors.white)),
                              ),
                              Expanded(
                                  child: Divider(
                                      color: ThemeCubit.get(context).themeMode== ThemeMode.light ?ColorsManager.Blackmeduim:Colors.white)),
                            ],
                          ),
                          verticalSpace(20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                icon: SvgPicture.asset(
                                  ThemeCubit.get(context).themeMode== ThemeMode.light ?
                                  'assets/img/apple.svg': 'assets/img/apple (1).svg',
                                ),
                                onPressed: () {},
                              ),
                              SizedBox(width: 20.w),
                              IconButton(
                                icon: SvgPicture.asset(
                                  ThemeCubit.get(context).themeMode== ThemeMode.light ?
                                  'assets/img/google.svg':'assets/img/google (1).svg',
                                ),
                                onPressed: () {},
                              ),
                              SizedBox(width: 20.w),
                              IconButton(
                                icon: SvgPicture.asset(
                                  ThemeCubit.get(context).themeMode== ThemeMode.light ?
                                  'assets/img/facebook.svg':'assets/img/facebook (1).svg',
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
                                  style:          ThemeCubit.get(context).themeMode== ThemeMode.light ? TextStyles.poppinsMedium16BlackMeduim:TextStyles.poppinsMedium16BlackMeduim.copyWith(color: Colors.white)),
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
                                NavBarCubit.get(context).changeIndex(0);
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
