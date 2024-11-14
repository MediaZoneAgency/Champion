import 'package:education/core/sharedWidgets/network_image.dart';
import 'package:education/core/theming/colors.dart';
import 'package:flutter/material.dart';

import '../../../../core/theming/styles.dart';

class CategoryItem extends StatelessWidget {
  final String icon;
  final String label;

  const CategoryItem({Key? key, required this.icon, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: ColorsManager.BabyBlue, // لون الخلفية الدائري
            shape: BoxShape.circle,
          ),
          child:

      AppCachedNetworkImage(image: icon, width: 24, height: 24, radius: 40,
            
          )
        ),
        SizedBox(height: 8),
        Text(
          label,
          style: TextStyles.poppinsMedium12contantGray,
        ),
      ],
    );
  }
}