import 'package:education/feature/home/logic/product_cubit.dart';
import 'package:education/feature/home/ui/widget/course_widget.dart';
import 'package:education/feature/wishlist/data/models/wish_list_model.dart';
import 'package:education/feature/wishlist/logic/cubit/fav_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../core/theming/colors.dart';
import '../../../profile/logic/profile_cubit.dart';
import 'field_circle.dart';
class CoursesListView extends StatelessWidget {
  const CoursesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        var productCubit = ProductCubit.get(context);

        if (state is FetchProductLoading) {
          return Center(child: CircularProgressIndicator());
        }

        if (state is FetchProductSuccess && productCubit.productModel.isEmpty) {
          return Center(child: Text("No courses available"));
        }

        if (state is FetchProductSuccess) {
          return BlocBuilder<FavCubit, FavState>(
            builder: (context, favState) {
              return SizedBox(
                height: 225,
                child: Padding(
                  padding: const EdgeInsets.only(left: 4),
                  child: ListView.separated(
                    itemCount: productCubit.productModel.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return CourseWidget(
                        productCubit.productModel[index],
                        onTap: () {
                          if (ProfileCubit.get(context).profileUser != null) {
                            if (FavCubit.get(context).favorite.contains(
                                productCubit.productModel[index].id)) {
                              FavCubit.get(context).removeFromWishList(
                                  productCubit.productModel[index]);
                            } else {
                              FavCubit.get(context).addToWishList(
                                  model: productCubit.productModel[index]);
                            }
                          } else {
                            Fluttertoast.showToast(
                              msg: "You Don't have an account",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              backgroundColor: ColorsManager.primaryColorLight,
                              textColor: Colors.white,
                              fontSize: 16.0,
                            );
                          }
                        },
                        isFavorite: FavCubit.get(context).favorite.contains(
                            productCubit.productModel[index].id),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(width: 20.w);
                    },
                  ),
                ),
              );
            },
          );
        }

        return SizedBox(); // تفادي الأخطاء عند حالة غير متوقعة
      },
    );
  }
}
