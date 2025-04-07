import 'package:education/core/helpers/extensions.dart';
import 'package:education/core/theming/colors.dart';
import 'package:flutter_svg/svg.dart';
import 'package:education/core/sharedWidgets/custom_text.dart';
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
import '../../../../core/theming/theming_change/theme_cubit.dart';
import '../../../../generated/l10n.dart';
import '../../../sign_up/ui/widgets/enter_your.dart';
import '../../data/models/login_model.dart';
import '../../logic/sign_in_cubit.dart';
import '../widget/sign_in_state.dart';


class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {


  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isChecked = false;
  @override

  void dispose() {

    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInCubit,SignInState>(

      builder: (BuildContext context,SignInState state) {
        return Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 15.h),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpace(64),
                  Center(child: AppText(title: S.of(context).sign_in,description: S.of(context).HelloWelcome,)),
                  verticalSpace(34),
                  Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        EnterYour(text: S.of(context).Name),
                        verticalSpace(7),
                        AppTextFormField(
                          contentPadding: EdgeInsets.all(12.h),
                          hintText: S.of(context).Name,
                          controller: _emailController,),
                        verticalSpace(12),
                        EnterYour(
                          text: S.of(context).Password,
                        ),
                        verticalSpace(7),
                        AppTextFormField(
                          contentPadding: EdgeInsets.all(12.h),
                          controller: _passwordController,
                          hintText: S.of(context).Password,
                          isObscureText:SignInCubit.get(context).isObscureText2,
                          suffixIcon: GestureDetector(
                            onTap: () {
                              SignInCubit.get(context).obscureText2();
                            },
                            child: Icon(
                              SignInCubit.get(context).isObscureText2
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                          ),
                        ),
                        verticalSpace(12),


                        Align(
                          alignment: AlignmentDirectional.centerEnd,
                          child: GestureDetector(
                            onTap: () {
                              context.pushNamed(Routes.forgetPasswordScreen);
                            },
                            child: Text(
                              S.of(context).ForgotPassword,
                              style: TextStyles.poppinsRegular14Blue.copyWith(color:Color(0xFF992232),),
                            ),
                          ),
                        ),
                        verticalSpace(34),
                        AppTextButton(
                          borderRadius: 10,
                          buttonHeight: 58.h,
                          buttonWidth: 327,
                          buttonText: S.of(context).sign_in,
                          textStyle: TextStyles.poppinsMedium20white,
                          onPressed: () async {
                            // Check if the form is valid before proceeding
                            if (formKey.currentState!.validate()) {
                              // Perform login
                              await SignInCubit.get(context).login(
                                LoginModel(
                                  username: _emailController.text,
                                  password: _passwordController.text,
                                ),
                              );
                            }
                          },
                        ),

                        // verticalSpace(24),
                        // Row(
                        //   children: [
                        //     Expanded(child: Divider(  color: ThemeCubit.get(context).themeMode== ThemeMode.light ?ColorsManager.Blackmeduim:Colors.white)),
                        //     Padding(
                        //       padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        //       child: Text(S.of(context).Orsigninwith,
                        //           style:
                        //           ThemeCubit.get(context).themeMode== ThemeMode.light ?
                        //           TextStyles.poppinsMedium16BlackMeduim:   TextStyles.poppinsMedium16BlackMeduim.copyWith(color:Colors.white)),
                        //     ),
                        //     Expanded(child: Divider(color: ThemeCubit.get(context).themeMode== ThemeMode.light ?ColorsManager.Blackmeduim:Colors.white)),
                        //   ],
                        // ),
                        // verticalSpace(20),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        //     IconButton(
                        //       icon: SvgPicture.asset(
                        //         ThemeCubit.get(context).themeMode== ThemeMode.light ?
                        //         'assets/img/apple.svg': 'assets/img/apple (1).svg',
                        //       ),
                        //       onPressed: () {},
                        //     ),
                        //     SizedBox(width: 20.w),
                        //     IconButton(
                        //       icon: SvgPicture.asset(
                        //         ThemeCubit.get(context).themeMode== ThemeMode.light ?
                        //         'assets/img/google.svg':'assets/img/google (1).svg',
                        //       ),
                        //       onPressed: () {},
                        //     ),
                        //     SizedBox(width: 20.w),
                        //     IconButton(
                        //       icon: SvgPicture.asset(
                        //         ThemeCubit.get(context).themeMode== ThemeMode.light ?
                        //         'assets/img/facebook.svg':'assets/img/facebook (1).svg',
                        //       ),
                        //       onPressed: () {},
                        //     ),
                        //   ],
                        // ),
                       
                       
                        SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(S.of(context).NoAccount,style:ThemeCubit.get(context).themeMode== ThemeMode.light ? TextStyles.poppinsMedium16BlackMeduim:TextStyles.poppinsMedium16BlackMeduim.copyWith(color: Colors.white)),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, Routes.signUpScreen);
                              },
                              child: Text(
                                  S.of(context).SignUp,
                                  style: TextStyles.poppinsRegular16Blue.copyWith(
                                    decoration: TextDecoration.underline,
                                      decorationColor: TextStyles.poppinsRegular16Blue.color,
                                      color:Color(0xFF992232),
                                  )
                              ),
                            ),
                          ],
                        ),
                      ],


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
