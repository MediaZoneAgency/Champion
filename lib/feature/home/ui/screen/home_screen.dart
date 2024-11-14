import 'package:education/feature/home/logic/home_cubit.dart';
import 'package:education/feature/home/logic/product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
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
                        return Container();
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
                        return Skeletonizer(
                          enabled: true,
                          child: UiLoadingHome(),
                        );
                      }
                      if (HomeCubit.get(context).categoryModel.isNotEmpty) {
                        return CategoryListView();
                      }
                      return Container();
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
                      padding: const EdgeInsets.only(left: 5,right:5),
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
