import 'dart:developer';

import 'package:education/core/helpers/extensions.dart';
import 'package:education/feature/home/logic/home_cubit.dart';
import 'package:education/feature/home/logic/product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/theming/styles.dart';
import '../../../../generated/l10n.dart';
import '../../../profile/logic/profile_cubit.dart';
import '../../../profile/ui/widget/ui_loading_profile.dart';
import '../widget/ad_container.dart';
import '../widget/course_widget.dart';
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
    HomeCubit.get(context).getCategory();
    ProductCubit.get(context).getProducts();
    ProfileCubit.get(context).getProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // backgroundColor: ColorsManager.primaryColorLight,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
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
                            padding:  EdgeInsets.only(top: 30.h,left: 15.w,right: 15.w),
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
                                      S.of(context).Nicetomeetyou,
                                      style: TextStyles.poppinsRegular16ContantGray,
                                    ),
                                    Text(
                                      "Guest Mode",
                                      style: TextStyles.poppinsRegular14LightGray,
                                    ),
                                  ],
                                ),
                                Spacer(),
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


                              ],
                            ));

                      },
                    ),
                    const SizedBox(
                      height: 15,
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

                        return CategoryListView();
                      }else {
                        log("offfffff");

                        return Container();
                      }
                    }),

                    Padding(
                      padding: const EdgeInsets.only(left: 5,right: 5),
                      child: Row(
                        children: [
                          Text(S.of(context).Popularcourses,
                              style: TextStyles.poppinsMedium18contantGray),
                         Spacer(),
                          Text(S.of(context).Seeall,
                              style: TextStyles.poppinsRegular14babyblue),
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
                        return CoursesListView();
                      }
                      return Container();
                    }),

                    Padding(
                      padding: const EdgeInsets.only(left: 5,right:6),
                      child: Row(
                        children: [
                          Text('For you',
                              style: TextStyles.poppinsMedium18contantGray),
                          Spacer(),
                          Text(S.of(context).Seeall,
                              style: TextStyles.poppinsRegular14babyblue),
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
                            return CoursesListView();
                          }
                          return Container();
                        }),



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
