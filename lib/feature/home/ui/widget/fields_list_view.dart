import 'package:education/feature/home/logic/home_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/routes/routes.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import 'field_circle.dart';

class CategoryListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return SizedBox(
          height: 100, // Constrain the height of the container

          child: SingleChildScrollView(
            physics:  NeverScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                // Dynamic List
                SizedBox(
                  width: MediaQuery.of(context).size.width - 125,
                  height: 100,
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: 3, // Replace with actual length
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 7.0),
                        child: CategoryItem(
                          icon: HomeCubit.get(context)
                                      .categoryModel[index]
                                      .image !=
                                  null
                              ? HomeCubit.get(context)
                                  .categoryModel[index]
                                  .image!
                                  .src!
                              : "https://img.freepik.com/free-photo/abstract-surface-textures-white-concrete-stone-wall_74190-8189.jpg",
                          label:
                              HomeCubit.get(context).categoryModel[index].name!,
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(width: 7),
                // Static More Button
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          Routes.categoriesScreen,
                        );
                      },
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: ColorsManager.BabyBlue,
                          shape: BoxShape.circle,
                        ),
                        child: SvgPicture.asset(
                          'assets/img/more-2.svg',
                          width: 30,
                          height: 30,
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "More",
                      style: TextStyles.poppinsMedium12contantGray,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
