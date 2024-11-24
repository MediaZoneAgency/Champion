import 'package:education/core/helpers/extensions.dart';
import 'package:education/feature/wishlist/logic/cubit/fav_cubit.dart';
import 'package:education/feature/wishlist/logic/cubit/fav_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/sharedWidgets/app_text_button.dart';
import '../../../../core/sharedWidgets/network_image.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../generated/l10n.dart';
import '../../logic/profile_cubit.dart';


class AccountInfoScreen extends StatelessWidget {
  const AccountInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavCubit ,FavState>(
  builder: (context, state) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title:  Text(S.of(context).accountprofile,style: TextStyles.poppinsMedium18contantGray,),),
      backgroundColor: Colors.white,
      body: Column(
        children: [

          verticalSpace(15.h),
      AppCachedNetworkImage(image:ProfileCubit.get(context).profileUser!.profilePicture, width: 54, height: 54, radius: 200,),

        SizedBox(height: 16.h,),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  S.of(context).Name,
                  style: TextStyles.poppinsRegular16LightGray,
                ),
                SizedBox(height: 8.h,),
                Container(
                  width: 326.w,
                  height: 44.h,
                  decoration: BoxDecoration(

                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(color: ColorsManager.GrayLIght),
                  ),
                  child:
                  Padding(
                    padding: const EdgeInsets.only(left: 15,top: 10,bottom: 10),
                    child: Text(
                      ProfileCubit.get(context).profileUser!.name!,
                      style: TextStyles.poppinsRegular16LightGray,
                    ),
                  ),

                ),
             SizedBox(height: 16.h,),
                Text(
                  S.of(context).Email,
                  style: TextStyles.poppinsRegular16LightGray,
                ),
                SizedBox(height: 8.h,),
                Container(
                  width: 326.w,
                  height: 44.h,
                  decoration: BoxDecoration(

                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(color: ColorsManager.GrayLIght),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15,top: 10,bottom: 10),
                    child: Text(
                      ProfileCubit.get(context).profileUser!.email!,
                      style: TextStyles.poppinsRegular16LightGray,
                    ),
                  ),
                ),
                SizedBox(height: 34,),
                AppTextButton(
                  borderRadius: 10,
                  buttonHeight: 58.h,
                  buttonWidth: 327.w,
                  buttonText: S.of(context).editaccount,
                  textStyle: TextStyles.poppinsMedium20white,
                  onPressed: ()  {
                    context.pushNamed(Routes.editAccountInfoScreen);
                  },
                ),
              ],
            ),
          ),verticalSpace(51.h),

        ],
      ),

    );
  },
);
  }
}
