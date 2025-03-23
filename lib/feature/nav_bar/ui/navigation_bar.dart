import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/helpers/extensions.dart';
import '../../../core/routes/routes.dart';
import '../../../core/theming/colors.dart';
import '../../../core/theming/styles.dart';
import '../../../core/theming/theming_change/theme_cubit.dart';
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
                        ThemeCubit.get(context).themeMode== ThemeMode.light ?
                        'assets/img/home-2fillnew.svg':'assets/img/home-2darkfilld.svg',
                      ):SvgPicture.asset(
                        'assets/img/home-2.svg'
                           ,
                      ),
                      label:S.of(context).Home,
                    ),
                    BottomNavigationBarItem(
                      icon:NavBarCubit.get(context).selectedIndex == 1
                      ?SvgPicture.asset(
                        ThemeCubit.get(context).themeMode== ThemeMode.light ?
                        'assets/img/bookneeeew.svg':'assets/img/bookdarkfilled.svg',
                      ):SvgPicture.asset(
                        'assets/img/book.svg',
                      ),
                      label:S.of(context).MyCourses,
                    ),
                    BottomNavigationBarItem(
                      icon:  NavBarCubit.get(context).selectedIndex == 2
                          ?SvgPicture.asset(
                        ThemeCubit.get(context).themeMode== ThemeMode.light ?
                        'assets/img/heartnewfill.svg':'assets/img/heartfilleddark.svg',
                      ):SvgPicture.asset(
                        'assets/img/heart.svg',
                      ),
                      label:S.of(context).WishList,
                    ),
                    BottomNavigationBarItem(
                      icon: NavBarCubit.get(context).selectedIndex == 3
                      ?SvgPicture.asset(
                        ThemeCubit.get(context).themeMode== ThemeMode.light ?
                        'assets/img/shopping-cart (1)new.svg':'assets/img/shopping-cartdarkdilled.svg',
                      ):SvgPicture.asset(
                        'assets/img/shopping-cart.svg',
                      ),
                      label: S.of(context).Cart,
                    ),
                    BottomNavigationBarItem(
                      icon: NavBarCubit.get(context).selectedIndex == 4
                      ?SvgPicture.asset(
                        ThemeCubit.get(context).themeMode== ThemeMode.light ?
                        'assets/img/profile (1).svg':'assets/img/profiledarkfilled.svg',
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
