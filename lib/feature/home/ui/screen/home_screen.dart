import 'dart:developer';
import 'package:education/core/helpers/extensions.dart';
import 'package:education/feature/home/logic/home_cubit.dart';
import 'package:education/feature/home/logic/product_cubit.dart';
import 'package:education/feature/wishlist/logic/cubit/fav_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/theming/theming_change/theme_cubit.dart';
import '../../../../generated/l10n.dart';
import '../../../profile/logic/profile_cubit.dart';
import '../../../profile/ui/widget/ui_loading_profile.dart';
import '../widget/ad_container.dart';
import '../widget/courses_list_view.dart';
import '../widget/fields_list_view.dart';
import '../widget/home_bar.dart';
import '../widget/ui_loading_home.dart';
import '../widget/ui_loading_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     ProductCubit.get(context).getProducts();
    HomeCubit.get(context).getCategory();
    ProductCubit.get(context).getProducts();
        FavCubit.get(context).getWishList();
    ProfileCubit.get(context).getProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 1),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BlocBuilder<ProfileCubit, ProfileState>(
                      builder: (context, state) {
                        if (state is ProfileLoading) {
                          return const Skeletonizer(
                            enabled: true,
                            child: UiLoadingProfile(),
                          );
                        }
                        if (ProfileCubit.get(context).profileUser != null) {
                          return HomeBar();
                        }
                        return  Padding(
                            padding:  EdgeInsets.only(top: 30.h,),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 20,
                                  backgroundColor: Colors.grey.shade300,
                                  child: SvgPicture.asset('assets/img/Ellipse 10.svg'),
                                ),
                                horizontalSpace(11.w),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                    "geust mode"
                                      ,
                                      style: ThemeCubit.get(context).themeMode== ThemeMode.light ?
                                      TextStyles.poppinsRegular16ContantGray: TextStyles.poppinsRegular16ContantGray.copyWith(color: Colors.white),
                                    ),
                                    Text(
                                      "Guest Mode",
                                      style:
                                      TextStyles.poppinsRegular14LightGray,
                                    ),
                                  ],
                                ),

                                // Container(
                                //   height: 45.h,
                                //   width: 70.w,
                                //   decoration: BoxDecoration(
                                //     color: ThemeCubit.get(context).themeMode == ThemeMode.light
                                //         ? ColorsManager.mainGrray
                                //         : ColorsManager.mainGrray,
                                //     borderRadius: BorderRadius.circular(10),
                                //   ),
                                //   child: Row(
                                //      // Adjust alignment
                                //     children: [
                                //       Flexible( // Use Flexible to allow the Text to shrink if needed
                                //         child: Text(
                                //           "160",
                                //           style: ThemeCubit.get(context).themeMode == ThemeMode.light
                                //               ? TextStyles.poppinsRegular12ContantGray
                                //               : TextStyles.poppinsRegular12ContantGray,
                                //           //overflow: TextOverflow.ellipsis, // Handle text overflow
                                //         ),
                                //       ),
                                //       // IconButton(
                                //       //   icon: SvgPicture.asset(
                                //       //     width: 20.w,
                                //       //     height: 20.h,
                                //       //     'assets/img/coin.svg',
                                //       //     fit: BoxFit.scaleDown,
                                //       //   ),
                                //       //   onPressed: () {
                                //       //     context.pushNamed(Routes.rewardGridViewScreen);
                                //       //   },
                                //       // ),
                                //     ],
                                //   ),
                                // ),
                            
                            
                            IconButton(
                                              icon: SvgPicture.asset(
                                                width: 30,
                                                height: 30,
                                                ThemeCubit.get(context).themeMode== ThemeMode.light ?
                                                'assets/img/search-normal.svg':'assets/img/SearchDarkk.svg',
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
                                                ThemeCubit.get(context).themeMode== ThemeMode.light ?
                                                 'assets/img/notification.svg':'assets/img/notificationdark.svg',
                                                fit: BoxFit.scaleDown,
                                              ),
                                              onPressed: () {
                                                // Notification button tapped
                                              },
                                            ),


                              ],
                            ));

                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const AdCarousel(),
                    const SizedBox(
                      height: 20,
                    ),
                    BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
                      if (state is FetchCategoryLoading) {
                        log("leh yarb leh");
                        return Skeletonizer(
                          enabled: true,
                          child: UiLoadingHome(),
                        );
                      }
                      if (HomeCubit.get(context).categoryModel.isNotEmpty) {
                        log("thnx god");

                        return  CategoryListView();
                      }else {
                        log("offfffff");
                        return Container();
                      }
                    }),
                    SizedBox(
                      height: 20.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5,right: 6),
                      child: Row(
                        children: [
                          Text(S.of(context).Popularcourses,
                              style:
                              ThemeCubit.get(context).themeMode== ThemeMode.light ?
                              TextStyles.poppinsMedium18contantGray:TextStyles.poppinsMedium18contantGray.copyWith(color:Colors.white)),
                         Spacer(),
                          GestureDetector(
                            onTap: (){
                              context.pushNamed(Routes.coursesGridViewScreen);
                            },
                            child: Text(S.of(context).Seeall,
                                style: TextStyles.poppinsRegular14babyblue),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    BlocBuilder<ProductCubit, ProductState>(
                      builder: (context, state) {
                        if (state is FetchProductLoading) {
                          return Skeletonizer(
                            enabled: true,
                            child: UiLoadingWidget(),
                          );
                        }
                        if (state is FetchProductSuccess && ProductCubit.get(context).productModel.isNotEmpty) {
                          return CoursesListView();
                        }
                         print("roductCubit.get(context).productModel");
                        return Center(child: Text("No courses available")); // عرض رسالة عند عدم وجود بيانات
                      },
                    ),

                    SizedBox(
                      height: 10.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5,right:6),
                      child: Row(
                        children: [
                          Text(S.of(context).Foryou,
                              style: ThemeCubit.get(context).themeMode== ThemeMode.light ?
                              TextStyles.poppinsMedium18contantGray:TextStyles.poppinsMedium18contantGray.copyWith(color:Colors.white)),
                          Spacer(),
                          GestureDetector(
                            onTap: (){
                              context.pushNamed(Routes.coursesGridViewScreen);
                            },
                            child: Text(S.of(context).Seeall,
                                style: TextStyles.poppinsRegular14babyblue),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),

                    BlocBuilder<ProductCubit, ProductState>(
                        builder: (context, state) {
                          if (state is  FetchProductLoading) {
                            return Skeletonizer(
                              enabled: true,
                              child: UiLoadingWidget(),
                            );
                          }
                          if (ProductCubit.get(context).productModel.isNotEmpty) {
                            return const CoursesListView();
                          }
                          return Container();
                        }
                        ),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
