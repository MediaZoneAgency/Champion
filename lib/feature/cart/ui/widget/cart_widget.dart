import 'package:cached_network_image/cached_network_image.dart';
import 'package:education/core/sharedWidgets/network_image.dart';
import 'package:education/core/theming/styles.dart';
import 'package:education/feature/cart/data/models/cart_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../logic/cart_cubit.dart';

class CartWidget extends StatelessWidget {
  const CartWidget(this.product, {super.key, this.onremove});
  final CartItemModel product;
  final Function()? onremove;

  /// Helper method to remove HTML tags from a string
  String removeHtmlTags(String htmlText) {
    final RegExp exp = RegExp(r'<[^>]*>', multiLine: true, caseSensitive: false);
    return htmlText.replaceAll(exp, '');
  }

  @override
  Widget build(BuildContext context) {
    // Prepare cleaned and trimmed description
    String rawContent = product.productModel.content ?? '';
    String cleanedContent = removeHtmlTags(rawContent);
    String shortDescription =
        cleanedContent.length > 60 ? '${cleanedContent.substring(0, 60)}...' : cleanedContent;

    return Container(
      width: 375.w,
      child: Padding(
        padding: EdgeInsets.only(left: 15.w, right: 15.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: AppCachedNetworkImage(
                image: product.productModel.thumbnailUrl!,
                width: 70.w,
                height: 70.h,
                radius: 5,
              ),
            ),
            SizedBox(width: 13.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.productModel.title.toString(),
                    style: TextStyles.poppinsMedium18contantGray,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4.h),
                  ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 220.w),
                    child: RichText(
                      maxLines: 2,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: shortDescription,
                            style: TextStyles.poppinsRegular20lightGray.copyWith(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Row(
                    children: [
                      Text(
                        product.productModel.salePrice.toString(),
                        style: TextStyles.poppinsMedium20Blue.copyWith(fontSize: 18),
                      ),
                      SizedBox(width: 4.h),
                      Row(
                        children: [
                          SvgPicture.asset('assets/img/star.svg'),
                          Text(
                            product.productModel.salePrice.toString(),
                            style: TextStyles.poppinsRegular14lightGray.copyWith(fontSize: 16),
                          ),
                        ],
                      ),
                      Spacer(),
                      BlocBuilder<CartCubit, CartState>(
                        builder: (context, state) {
                          return GestureDetector(
                            onTap: onremove,
                            child: SvgPicture.asset('assets/img/trash.svg'),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
