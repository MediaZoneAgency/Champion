import 'package:education/core/helpers/extensions.dart';
import 'package:education/feature/wishlist/logic/cubit/fav_cubit.dart';
import 'package:education/feature/wishlist/ui/widget/ui_loading_wishlist.dart';
import 'package:education/feature/wishlist/ui/widget/wishlist_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:lottie/lottie.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../generated/l10n.dart';
import '../../../nav_bar/logic/nav_bar_cubit.dart';
import '../../../profile/logic/profile_cubit.dart';
import '../widget/wishlist_list_view.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({Key? key}) : super(key: key);

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  @override
  void initState() {
    super.initState();
    FavCubit.get(context).getWishList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          WishlistBar(username: 'WishList'),
          Expanded(
            child: BlocBuilder<ProfileCubit, ProfileState>(
  builder: (context, state) {
    return BlocBuilder<FavCubit, FavState>(
              builder: (context, state) {
                if (ProfileCubit.get(context).profileUser != null) {
                  if (state is GetWishListLoading) {
                    return const Skeletonizer(
                      enabled: true,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            UiLoadingWishlist(),
                            UiLoadingWishlist(),
                            UiLoadingWishlist(),
                            UiLoadingWishlist(),
                          ],
                        ),
                      ),
                    );
                  }
                  if (FavCubit.get(context).wishList.isNotEmpty) {
                    return WishListView();
                  }
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: 42.h),
                        Center(
                          child: Lottie.asset(
                              'assets/img/Animation - 1732019401672.json'),
                        ),
                        SizedBox(height: 48.h),
                        GestureDetector(
                          onTap: () {
                            NavBarCubit.get(context).changeIndex(0);
                          },
                          child: Container(
                            height: 40.h,
                            width: 250.h,
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 10.h),
                            decoration: BoxDecoration(
                              color: ColorsManager.primaryColorLight,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                S.of(context).Checknewcourses,
                                style: TextStyles.poppinsMedium12white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  return  Column(
                    children: [

                      SizedBox(height: 42.h,),
                      Center(
                        child: Lottie.asset('assets/img/Animation - 1732019401672.json'),
                      ),
                      SizedBox(height: 48.h,),
                      GestureDetector(
                        onTap: (){
                          context.pushNamedAndRemoveUntil(Routes.signUpScreen,
                              predicate: (Route<dynamic> route) => false);

                        },
                        child:Container(
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

                                Text(S.of(context).Nicetomeetyou,style: TextStyles.poppinsRegular16ContantGray,),
                                verticalSpace(8.h),
                                GestureDetector(
                                  onTap: (){
                                    context.pushNamedAndRemoveUntil(Routes.signUpScreen,
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
                                      child: Text(S.of(context).LoginSignup,
                                          style: TextStyles.poppinsMedium12white),
                                    ),),
                                )
                              ],
                            ),
                          ),)
                      )
                    ],
                  );
                }
              },
            );
  },
),
          ),
        ],
      ),
    );
  }
}
