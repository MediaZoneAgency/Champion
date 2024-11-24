import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/helpers/extensions.dart';
import '../../../core/routes/routes.dart';
import '../../../core/theming/colors.dart';
import '../../../core/theming/styles.dart';
import '../../../generated/l10n.dart';
import '../logic/nav_bar_cubit.dart';

class NavigationBarApp extends StatefulWidget {
  const NavigationBarApp({super.key});

  @override
  State<NavigationBarApp> createState() => _NavigationBarAppState();
}

class _NavigationBarAppState extends State<NavigationBarApp> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavBarCubit, NavBarState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: const Color(0xff1a1a1a).withOpacity(.5),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          body: NavBarCubit.get(context).screens[NavBarCubit.get(context).selectedIndex],
          bottomNavigationBar: ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20.r),
              bottomRight: Radius.circular(20.r),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: SizedBox(
                height: 75, // Adjust height
                child: BottomNavigationBar(
                  iconSize: 24.sp,
                  type: BottomNavigationBarType.shifting ,
                  currentIndex: NavBarCubit.get(context).selectedIndex,
                  onTap: (index) {
                    final cubit = NavBarCubit.get(context);
                    if (!cubit.isClosed) { // تحقق من أن الكيوبت لم يُغلق
                      cubit.changeIndex(index);
                    }
                  },
                  selectedItemColor: ColorsManager.primaryColorLight,
                  unselectedItemColor: ColorsManager.darkGray,
                  selectedLabelStyle: TextStyles.poppinsLight12PrimaryColor.copyWith(
                    color: ColorsManager.primaryColorLight,
                  ),
                  unselectedLabelStyle: TextStyles.poppinsLight12PrimaryColor.copyWith(
                    color: ColorsManager.darkGray,
                  ),
                  items: [
                    BottomNavigationBarItem(
                      icon:NavBarCubit.get(context).selectedIndex == 0
                      ?SvgPicture.asset(

                        'assets/img/home-filled.svg',
                      ):SvgPicture.asset(
                        'assets/img/home-2.svg'
                           ,
                      ),
                      label:S.of(context).Home,
                    ),
                    BottomNavigationBarItem(
                      icon:NavBarCubit.get(context).selectedIndex == 1
                      ?SvgPicture.asset(
                        'assets/img/bookfilled.svg',
                      ):SvgPicture.asset(
                        'assets/img/book.svg',
                      ),
                      label:S.of(context).MyCourses,
                    ),
                    BottomNavigationBarItem(
                      icon:  NavBarCubit.get(context).selectedIndex == 2
                          ?SvgPicture.asset(
                        'assets/img/heartfilled.svg',
                      ):SvgPicture.asset(
                        'assets/img/heart.svg',
                      ),
                      label:S.of(context).WishList,
                    ),
                    BottomNavigationBarItem(
                      icon: NavBarCubit.get(context).selectedIndex == 3
                      ?SvgPicture.asset(
                        'assets/img/shopping-cartfilled.svg',
                      ):SvgPicture.asset(
                        'assets/img/shopping-cart.svg',
                      ),
                      label: S.of(context).Cart,
                    ),
                    BottomNavigationBarItem(
                      icon: NavBarCubit.get(context).selectedIndex == 4
                      ?SvgPicture.asset(
                        'assets/img/profilefilled.svg',
                      ):SvgPicture.asset(
                        'assets/img/profile.svg',
                      ),
                      label: S.of(context).Profile,
                    ),
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
