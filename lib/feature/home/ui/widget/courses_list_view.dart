import 'package:education/feature/home/logic/product_cubit.dart';
import 'package:education/feature/home/ui/widget/course_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../wishlist/logic/wish_list_cubit.dart';
import 'field_circle.dart';

class CoursesListView extends StatelessWidget {
  const CoursesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        return SizedBox(
          height: 227.h,
          child: Padding(
            padding: const EdgeInsets.only(left: 5),
            child: ListView.separated(
              itemCount: ProductCubit.get(context).productModel.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return CourseWidget( ProductCubit.get(context).productModel[index],  onTap: () {  }, isFavorite:WishListCubit.get(context).isFavorite!
                   );
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  width: 20.w,
                );
              },
            ),
          ),
        );
      },
    );
  }
}
