import 'package:education/feature/home/logic/product_cubit.dart';
import 'package:education/feature/home/ui/widget/course_widget.dart';
import 'package:education/feature/wishlist/data/models/wish_list_model.dart';
import 'package:education/feature/wishlist/logic/cubit/fav_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'field_circle.dart';

class CoursesListView extends StatelessWidget {
  const CoursesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        return BlocBuilder<FavCubit, FavState>(
  builder: (context, state) {
    return SizedBox(
          height: 225.h,
          child: Padding(
            padding: const EdgeInsets.only(left: 4),
            child: ListView.separated(
              itemCount: ProductCubit.get(context).productModel.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return CourseWidget(
                  ProductCubit.get(context).productModel[index],
                  onTap: () {
                    if( FavCubit.get(context).favorite.contains(
                        ProductCubit.get(context).productModel[index].id)
                    ){
                      FavCubit.get(context).removeFromWishList(
                          WishListModel(
                              id:   ProductCubit.get(context).productModel[index].id,
                              name:   ProductCubit.get(context).productModel[index].name,
                              description:   ProductCubit.get(context).productModel[index].description,
                              price:   ProductCubit.get(context).productModel[index].price,
                              image:   ProductCubit.get(context).productModel[index].images![0].src!
                          )
                      );
                    }else{
                      FavCubit.get(context).addToWishList(model: ProductCubit
                          .get(context)
                          .productModel[index]);
                    }
                  },
                  isFavorite: FavCubit.get(context).favorite.contains(
                      ProductCubit.get(context).productModel[index].id),
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
      },
    );
  }
}
