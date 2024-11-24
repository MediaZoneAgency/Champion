import 'package:education/core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/sharedWidgets/network_image.dart';
import '../../../../core/theming/styles.dart';
import '../../../profile/logic/profile_cubit.dart';

class HomeBar extends StatelessWidget {

  const HomeBar({
    Key? key,


  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.h,),
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [

          AppCachedNetworkImage(image:ProfileCubit.get(context).profileUser!.profilePicture, width: 40, height: 40, radius: 200,

           ),

                  const SizedBox(width: 11),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          ProfileCubit.get(context).profileUser!.name!,
                          style: TextStyles.poppinsRegular16ContantGray
                      ),
                      Text(
                          'UX Designer',
                          style: TextStyles.poppinsRegular12babyGray
                      ),
                    ],
                  ),
        Spacer(),
                //  SizedBox(width: 120.w),
                  IconButton(
                    icon: SvgPicture.asset(
                      width: 30,
                      height: 30,
                      'assets/img/search-normal.svg',
                      fit: BoxFit.scaleDown,
                    ),
                    onPressed: () {
                      context.pushNamed(Routes.searchScreen);
                    },
                  ),
                  IconButton(
                    icon: SvgPicture.asset(
                      width: 30,
                      height: 30,
                      'assets/img/notification.svg',
                      fit: BoxFit.scaleDown,
                    ),
                    onPressed: () {
                      // Notification button tapped
                    },
                  ),


                ],),
              SizedBox(height: 8.h,),

            ],
          );
        },
      ),

    );
  }
}