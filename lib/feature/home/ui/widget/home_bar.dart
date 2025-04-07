import 'package:education/core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/sharedWidgets/network_image.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/theming/theming_change/theme_cubit.dart';
import '../../../profile/logic/profile_cubit.dart';



class HomeBar extends StatelessWidget {
  const HomeBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 30.h, left: 15.w, right: 15.w),
    child: BlocBuilder<ProfileCubit, ProfileState>(
    builder: (context, state) {
    var profileUser = ProfileCubit.get(context).profileUser;

    if (profileUser == null) {
    return const Center(child: CircularProgressIndicator()); // عرض لودينج إذا كان null
    }

    return BlocBuilder<ThemeCubit, ThemeState>(
    builder: (context, themeState) {
    var themeMode = ThemeCubit.get(context).themeMode;

    return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Row(
    children: [
    Image.asset(
    "assets/img/avvvatar.png",
    //profileUser.profilePicture ?? 'assets/img/default_avatar.png',
    width: 38.w,
    height: 40.h,
    
    ),
    horizontalSpace(11.w),
    Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Text(
    profileUser.name ?? "Guest User",
    style: ThemeCubit.get(context).themeMode== ThemeMode.light
    ? TextStyles.poppinsRegular16ContantGray
        : TextStyles.poppinsRegular16ContantGray.copyWith(color: Colors.white),
    ),
    Text(
    'AMRICAN',
    style: TextStyles.poppinsRegular12babyGray,
    ),
    ],
    ),

    // Container(
    // margin: EdgeInsets.symmetric(horizontal: 10.w),
    // decoration: BoxDecoration(
    // color:
    // ThemeCubit.get(context).themeMode== ThemeMode.light?
    // ColorsManager.mainGrray : ColorsManager.mainGrray,
    // borderRadius: BorderRadius.circular(10),
    // ),
    // child: IconButton(
    // icon: SvgPicture.asset(
    // width: 30,
    // height: 30,
    // 'assets/img/coin.svg',
    // fit: BoxFit.scaleDown,
    // ),
    // onPressed: () {
    // context.pushNamed(Routes.searchScreen);
    // },
    // ),
    // ),
   
   Spacer(),
    IconButton(
    icon: SvgPicture.asset(
    width: 30,
    height: 30,
      ThemeCubit.get(context).themeMode== ThemeMode.light
    ? 'assets/img/search-normal.svg'
        : 'assets/img/SearchDarkk.svg',
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
      ThemeCubit.get(context).themeMode== ThemeMode.light
    ? 'assets/img/notification.svg'
        : 'assets/img/notificationdark.svg',
    fit: BoxFit.scaleDown,
    ),
    onPressed: () {
    // Notification button tapped
    },
    ),
    ],
    ),
    ],
    );
    },
    );
    },
    )
    );
  }

}
