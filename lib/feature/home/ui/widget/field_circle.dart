import 'dart:developer';

import 'package:education/core/helpers/extensions.dart';
import 'package:education/core/sharedWidgets/network_image.dart';
import 'package:education/core/theming/colors.dart';
import 'package:education/feature/home/logic/product_cubit.dart';
import 'package:flutter/material.dart';

import '../../../../core/routes/routes.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/theming/theming_change/theme_cubit.dart';

class CategoryItem extends StatelessWidget {
  final String icon;
  final String label;
final int id;
  const CategoryItem({Key? key, required this.icon, required this.label, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: ()async {
            log(id.toString());
            ProductCubit.get(context).getCategoryProducts(id);
            context.pushNamed(Routes.girdviewScreen,
                arguments:label
            );
          },
          child: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: ColorsManager.BabyBlue, // لون الخلفية الدائري
              shape: BoxShape.circle,
            ),
            child: SizedBox(
              width: 14,
              height: 14,
              child: AppCachedNetworkImage(
                image: icon,
                width: 14,
                height: 14,
                radius: 40,

              ),
            ),
          ),
        ),
        SizedBox(height: 8),
        Text(
         label,
          style:
          ThemeCubit.get(context).themeMode == ThemeMode.light
              ?
          TextStyles.poppinsMedium12contantGray:TextStyles.poppinsMedium12contantGray.copyWith(color: Colors.white),
        ),
      ],
    );
  }
}