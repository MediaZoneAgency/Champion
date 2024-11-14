
import 'package:education/core/sharedWidgets/network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/styles.dart';
import '../../../wishlist/data/models/wish_list_model.dart';


class WishListItem extends StatelessWidget {
  const WishListItem({super.key, required this.onTap1, required this.wishListModel});
  final VoidCallback onTap1;
  final WishListModel wishListModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric( vertical: 8),
      child: Stack(children: [
        GestureDetector(
          onTap: onTap1,
          child: SizedBox(
            width: 160.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Align children to start
              children: [
                //if(productModel.images!.isNotEmpty)
                AppCachedNetworkImage(image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR8rHkK301LBCvaTWN5TnJbc4t5h0Cnzxm1tQ&s', width: 165.h, height: 185.h, radius: 10,),
                verticalSpace(5),
                Text(
                  wishListModel.name ?? "Green Tall Coat",
                  style: TextStyles.poppinsMedium16BlackMeduim,
                ),
                verticalSpace(7),
                Text(
                  " EGP ${wishListModel.price ?? "25 EGP"}",
                  style: TextStyles.poppinsMedium16BlackMeduim,
                ),
              ],
            ),
          ),
        ),
        Positioned(
            top: 10,
            left: 115,
            child: GestureDetector(
              child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.7),
                      shape: BoxShape.circle),
                  child: Icon(
                          Icons.favorite,
                          color: Colors.red,
              )),
            ))
      ]),
    );
  }
}