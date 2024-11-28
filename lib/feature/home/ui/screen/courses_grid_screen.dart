import 'package:education/feature/coursedetails/data/models/product_model.dart';
import 'package:education/feature/home/logic/product_cubit.dart';
import 'package:education/feature/wishlist/logic/cubit/fav_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../../core/theming/colors.dart';
import '../../../home/ui/widget/course_widget.dart';
import '../../../profile/logic/profile_cubit.dart';
import '../../../wishlist/data/models/wish_list_model.dart';
class CoursesGridScreen extends StatelessWidget {
  const CoursesGridScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        if (state is FetchProductLoading ) {
          return Center(
            child: CircularProgressIndicator(), // Replace with a loading widget if needed
          );
        }
        final products = ProductCubit.get(context).productModel; // Replace with your product list
        if (products.isNotEmpty) {
          return GridView.builder(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12.0,
              mainAxisSpacing: 12.0,
              childAspectRatio: 0.65,
            ),
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return CourseWidget(
                product,
                onTap: ()  {
                  if (ProfileCubit.get(context).profileUser != null){
                    if( FavCubit.get(context).favorite.contains(
                        ProductCubit.get(context).productModel[index].id)
                    ){
                      FavCubit.get(context).removeFromWishList(
                          ProductCubit.get(context).productModel[index]
                      );
                    }else{
                      FavCubit.get(context).addToWishList(model: ProductCubit
                          .get(context)
                          .productModel[index]);
                    }}else{
                    Fluttertoast.showToast(
                      msg: "You Don't have account",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      backgroundColor: ColorsManager.primaryColorLight,
                      textColor: Colors.white,
                      fontSize: 16.0,
                    );
                  }
                },
                isFavorite: FavCubit.get(context).favorite.contains(
                    ProductCubit.get(context).productModel[index].id),
              );
            },
          );
        } else {
          return Center(
            child: Text(
              'No courses found!',
              style: TextStyle(fontSize: 18.sp, color: Colors.grey),
            ),
          );
        }
      },
    );
  }
}