import 'package:education/core/models/image_model.dart';
import 'package:education/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../coursedetails/data/models/product_model.dart';
import 'course_widget.dart';

class UiLoadingWidget extends StatelessWidget {
  UiLoadingWidget({super.key});
  ProductModel productModel = ProductModel(
      id: 1,
      name: "tesssst",
      description: "ccccccccccccccccccccccxxxxxxxxxxxxxxxxxxxxxxxxxx",
      price: "9000",
      regularPrice: "9000",
      images: [ImageModel(src: "https://img.freepik.com/free-photo/abstract-surface-textures-white-concrete-stone-wall_74190-8189.jpg",)],
      salePrice: "9000",
  );
  @override
  Widget build(BuildContext context) {
  return SizedBox(
      height: 250.h,
      child: ListView.separated(
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return CourseWidget( productModel, onTap: () {  }, isFavorite: false,);
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
