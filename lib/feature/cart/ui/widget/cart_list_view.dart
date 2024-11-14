import 'package:education/feature/home/logic/product_cubit.dart';
import 'package:education/feature/home/ui/widget/course_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'more_like_widget.dart';

class CartListView extends StatelessWidget {
  const CartListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        return SizedBox(
          height: 150.h,
          child: ListView.separated(
            itemCount: ProductCubit.get(context).productModel.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return MoreLikeWidget( ProductCubit.get(context).productModel[index], isFavorite: false, onTap: () {  },);
            },
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                width: 5.w,
              );
            },
          ),
        );
      },
    );
  }
}
