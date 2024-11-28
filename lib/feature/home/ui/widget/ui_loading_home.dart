import 'package:education/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../coursedetails/data/models/product_model.dart';
import 'course_widget.dart';
import 'field_circle.dart';

class UiLoadingHome extends StatelessWidget {
  UiLoadingHome({super.key});
 late List<ProductModel> productModel = [];
  @override
  Widget build(BuildContext context) {
  return SizedBox(
      height: 130.h,
      child: ListView.separated(
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return  const CategoryItem(icon: "https://img.freepik.com/free-photo/abstract-surface-textures-white-concrete-stone-wall_74190-8189.jpg", label: 'tessst', id: 0, );
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(
            width: 20.w,
          );
        },
      ),
    );
  }
}
