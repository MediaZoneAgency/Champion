import 'dart:ui';
import 'package:education/core/helpers/extensions.dart';
import 'package:education/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';  // Import flutter_svg package

import '../../../core/routes/routes.dart';
import '../../../core/theming/colors.dart';
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
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: SizedBox(
                height: 75, // تحديد الارتفاع هنا
                child: BottomNavigationBar(
                  iconSize: 30,
                  type: BottomNavigationBarType.fixed,
                  unselectedItemColor: ColorsManager.darkGray,
                  selectedLabelStyle: TextStyles.poppinsLight12PrimaryColor,
                  currentIndex: NavBarCubit.get(context).selectedIndex,
                  onTap: (index) {
                    NavBarCubit.get(context).changeIndex(index);
                  },
                  items: [
                    BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        'assets/img/home-2.svg',
                        color: NavBarCubit.get(context).selectedIndex == 0
                            ? ColorsManager.primaryColorLight
                            : ColorsManager.LigGthGray,
                      ),
                      label: "Home",
                    ),
                    BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        'assets/img/book.svg',
                        color: NavBarCubit.get(context).selectedIndex == 1
                            ? ColorsManager.primaryColorLight
                            : ColorsManager.LigGthGray,
                      ),
                      label: 'My Courses',
                    ),
                    BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        'assets/img/heart.svg',
                        color: NavBarCubit.get(context).selectedIndex == 2
                            ? ColorsManager.primaryColorLight
                            : ColorsManager.LigGthGray,
                      ),
                      label: "WishList",
                    ),
                    BottomNavigationBarItem(
                      icon: GestureDetector(
                        onTap: () {
                          // context.pushNamed(Routes.cartScreen);
                        },
                        child: SvgPicture.asset(
                          'assets/img/shopping-cart.svg',
                          color: NavBarCubit.get(context).selectedIndex == 3
                              ? ColorsManager.primaryColorLight
                              : ColorsManager.LigGthGray,
                        ),
                      ),
                      label: 'Cart',
                    ),
                    BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        'assets/img/profile.svg',
                        color: NavBarCubit.get(context).selectedIndex == 4
                            ? ColorsManager.primaryColorLight
                            : ColorsManager.LigGthGray,
                      ),
                      label: 'Profile',
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
