import 'package:education/feature/wishlist/logic/cubit/fav_cubit.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:education/feature/cart/ui/screen/cart_screen.dart';
import 'package:education/feature/courses/ui/screen/courses_screen.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../core/di/dependency_inj.dart';

import '../../cart/logic/cart_cubit.dart';
import '../../home/logic/home_cubit.dart';
import '../../home/logic/product_cubit.dart';
import '../../home/ui/screen/home_screen.dart';
import '../../profile/logic/profile_cubit.dart';
import '../../profile/ui/screen/profile_screen.dart';
import '../../wishlist/ui/screen/like_screen.dart';

part 'nav_bar_state.dart';

// class NavBarCubit extends Cubit<NavBarState> {
//   final AuthCubit authCubit;
//
//   NavBarCubit(this.authCubit) : super(NavBarInitial());
// }
class NavBarCubit extends Cubit<NavBarState> {
  NavBarCubit() : super(NavBarInitial());

  static NavBarCubit get(context) => BlocProvider.of(context);

  int selectedIndex = 0;

  List<Widget> screens = [
    MultiBlocProvider(
      providers: [
        BlocProvider<HomeCubit>.value(
          value: getIt<HomeCubit>(),
        ),
        BlocProvider<ProductCubit>.value(
          value: getIt<ProductCubit>(),
        ),
        BlocProvider<ProfileCubit>.value(
          value: getIt<ProfileCubit>(),
        ),
      ],
      child: const HomeScreen(),
    ),
    const CourseScreen(),
    MultiBlocProvider(
      providers: [
        BlocProvider<ProfileCubit>.value(
          value: getIt<ProfileCubit>(),
        ),
        BlocProvider<FavCubit>.value(
          value: getIt<FavCubit>(),
        ),
      ],
      child: const  WishListScreen(),
    ),

    const CartScreen(),
    BlocProvider<ProfileCubit>.value(
      value:getIt<ProfileCubit>(),
      child: const ProfileScreen(),
    ),
  ];

  void changeIndex(int newIndex) {
    if (!isClosed) { // التحقق من أن الكيوبت ما زال متاحًا
      selectedIndex = newIndex;
      emit(ChangeIndex());
    }
  }
}