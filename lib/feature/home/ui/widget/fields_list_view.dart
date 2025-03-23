import 'package:education/feature/home/logic/home_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/theming/theming_change/theme_cubit.dart';
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
                  width: MediaQuery.of(context).size.width - 100,
                  height: 100,
                  child: HomeCubit.get(context).categoryModel.isNotEmpty
                      ? ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    //HomeCubit.get(context).categoryModel.length, // استخدم الطول الفعلي
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: CategoryItem(
                          icon: HomeCubit.get(context).categoryModel[index].thumbnailUrl != null
                              ? HomeCubit.get(context).categoryModel[index].thumbnailUrl!
                              : "https://img.freepik.com/free-photo/abstract-surface-textures-white-concrete-stone-wall_74190-8189.jpg",
                          label: HomeCubit.get(context).categoryModel[index].name!,
                          id: HomeCubit.get(context).categoryModel[index].id!,
                        ),
                      );
                    },
                  )
                      : Center(child: CircularProgressIndicator()), // عرض مؤشر تحميل إذا لم تكن هناك بيانات
                ),


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
                      style: ThemeCubit.get(context).themeMode == ThemeMode.light
                          ?
                      TextStyles.poppinsMedium12contantGray:TextStyles.poppinsMedium12contantGray.copyWith(color: Colors.white),
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


// import 'package:education/feature/home/logic/home_cubit.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_svg/svg.dart';
// import '../../../../core/routes/routes.dart';
// import '../../../../core/theming/colors.dart';
// import '../../../../core/theming/styles.dart';
// import 'field_circle.dart';
//
// class CategoryListView extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<HomeCubit, HomeState>(
//       builder: (context, state) {
//         return SizedBox(
//           height: 100, // Constrain the height of the container
//
//           child: SingleChildScrollView(
//             physics:  NeverScrollableScrollPhysics(),
//             scrollDirection: Axis.horizontal,
//             child: Row(
//               children: [
//                 // Dynamic List
//                 Column(
//                   children: [
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.pushNamed(
//                           context,
//                           Routes.categoriesScreen,
//                         );
//                       },
//                       child: Container(
//                         width: 60,
//                         height: 60,
//                         decoration: BoxDecoration(
//                           color: ColorsManager.BabyBlue,
//                           shape: BoxShape.circle,
//                         ),
//                         child: SvgPicture.asset(
//                           'assets/img/American Circle Flag.svg',
//                           width: 30,
//                           height: 30,
//                           fit: BoxFit.scaleDown,
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 8),
//                     Text(
//                       "More",
//                       style: TextStyles.poppinsMedium12contantGray,
//                     ),
//                   ],
//
//                 ),
//
//                 Column(
//                   children: [
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.pushNamed(
//                           context,
//                           Routes.categoriesScreen,
//                         );
//                       },
//                       child: Container(
//                         width: 60,
//                         height: 60,
//                         decoration: BoxDecoration(
//                           color: ColorsManager.BabyBlue,
//                           shape: BoxShape.circle,
//                         ),
//                         child: SvgPicture.asset(
//                           'assets/img/Britsh.svg',
//                           width: 30,
//                           height: 30,
//                           fit: BoxFit.scaleDown,
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 8),
//                     Text(
//                       "More",
//                       style: TextStyles.poppinsMedium12contantGray,
//                     ),
//                   ],
//
//                 ),
//                 // Static More Button
//                 Column(
//                   children: [
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.pushNamed(
//                           context,
//                           Routes.categoriesScreen,
//                         );
//                       },
//                       child: Container(
//                         width: 60,
//                         height: 60,
//                         decoration: BoxDecoration(
//                           color: ColorsManager.BabyBlue,
//                           shape: BoxShape.circle,
//                         ),
//                         child: SvgPicture.asset(
//                           'assets/img/more-2.svg',
//                           width: 30,
//                           height: 30,
//                           fit: BoxFit.scaleDown,
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 8),
//                     Text(
//                       "More",
//                       style: TextStyles.poppinsMedium12contantGray,
//                     ),
//                   ],
//
//                 ),
//
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
