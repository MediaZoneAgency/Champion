
import 'package:education/core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../generated/l10n.dart';
import '../../../cart/ui/widget/cart_bar.dart';
import '../../../nav_bar/logic/nav_bar_cubit.dart';
class CourseScreen extends StatelessWidget {

  const CourseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body: Column(
        children: [
          SizedBox(height: 32.h,),
          CartBar(username: 'My Courses'),
          SizedBox(height: 42.h,),
          Center(
            child: Lottie.asset('assets/img/Animation - 1732019401672.json'),
          ),
          SizedBox(height: 48.h,),
          GestureDetector(
            onTap: (){
              NavBarCubit.get(context).changeIndex(0);
              context.pushNamedAndRemoveUntil(Routes.navBarScreen,
                  predicate: (Route<dynamic> route) => false);
            },
            child: Container(
              height: 40.h,
              width: 250.h,
              padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
              decoration: BoxDecoration(
                  color: ColorsManager.primaryColorLight,
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Text(S.of(context).Checknewcourses,
                    style: TextStyles.poppinsMedium12white),
              ),),
          )
        ],
      ),
    );
  }
}