import 'package:education/feature/home/logic/product_cubit.dart';
import 'package:education/feature/wishlist/ui/widget/wishlist_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/colors.dart';
import '../../logic/cubit/fav_cubit.dart';




class WishListView extends StatelessWidget {
  const WishListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavCubit, FavState>(
      builder: (context, state) {
        return SizedBox(
          height: 250.h,
          child: ListView.separated(
            itemCount: FavCubit.get(context).wishList.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return WishlistWidget( FavCubit.get(context).wishList[index],
                onremove: () {
                  FavCubit.get(context).removeFromWishList(
                      FavCubit.get(context).wishList[index])!;
                },);
            },
            separatorBuilder: (BuildContext context, int index) {
              return Column(children: [
              SizedBox(height: 10.h,),
        Divider(
        color: ColorsManager.LigGthGray,
        indent: 30,
        endIndent: 30,
        thickness: 0.3,
        ),
        SizedBox(height: 10.h,),


        ]);},

          ),
        );
      },
    );
  }
}
