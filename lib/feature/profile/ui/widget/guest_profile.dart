import 'package:education/core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/theming/theming_change/theme_cubit.dart';
import '../../../../generated/l10n.dart';

class GuestProfile extends StatelessWidget {
  const GuestProfile({super.key});

  @override
  Widget build(BuildContext context) {
   return Container(
     height: 100.h,
     width: 327.w,
     decoration: BoxDecoration(
borderRadius: BorderRadius.circular(12.r),
       border: Border.all(color: ColorsManager.WhiteGray),
     ),
     child: Center(
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.center,
       mainAxisAlignment: MainAxisAlignment.center,
       children: [

       Text(S.of(context).Nicetomeetyou,
         style:
         ThemeCubit.get(context).themeMode== ThemeMode.light ?
       TextStyles.poppinsRegular16ContantGray: TextStyles.poppinsRegular16ContantGray.copyWith(color:Colors.white),),
         verticalSpace(8.h),
         GestureDetector(
           onTap: (){
             context.pushNamedAndRemoveUntil(Routes.signUpScreen,
                 predicate: (Route<dynamic> route) => false);
           },
           child: Container(
             height: 40.h,
             width: 250.h,
             padding: EdgeInsets.symmetric(vertical: 10.h),
             decoration: BoxDecoration(
                 color: ColorsManager.primaryColorLight,
                 borderRadius: BorderRadius.circular(10)),
             child: Center(
               child: Text(S.of(context).LoginSignup,
                   style: TextStyles.poppinsMedium12white),
             ),),
         )
       ],
          ),
     ),);
  }
}