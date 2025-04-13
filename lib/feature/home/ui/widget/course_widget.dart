import 'package:education/core/helpers/extensions.dart';
import 'package:education/core/sharedWidgets/network_image.dart';
import 'package:education/feature/coursedetails/data/models/product_model.dart';
import 'package:education/feature/coursedetails/ui/screen/details_screen.dart';
import 'package:education/feature/wishlist/data/models/wish_list_model.dart';
import 'package:education/feature/wishlist/logic/cubit/fav_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/theming/theming_change/theme_cubit.dart';

class CourseWidget extends StatelessWidget {
  const CourseWidget(this.product,
      {super.key,
      required this.isFavorite,
      required this.onTap,
      this.addToFavourite});
  final ProductModel product;
  final bool isFavorite;
  final Function() onTap;
  final Function()? addToFavourite;

  @override
  Widget build(BuildContext context) {
    // دالة مساعدة لتحديد نص السعر
    String getPriceDisplayString(String? price) {
      if (price == null || price.isEmpty) {
        return 'السعر غير متاح';
      }
      if (price == '0') {
        return 'مجاني';
      }
      return price + " EGP";
    }

    // رابط صورة افتراضية أو صورة محلية
    const String placeholderImageUrl = 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR7jXQjq1xMEMnB6Pirx0zJOHsi4DhYrhJ4txVuOzRw59k9PUSajaQCdmlGaDcqrarWxko&usqp=CAU'; // <-- استبدل بمسار صورة افتراضية لديك

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, Routes.DetailsScreen, arguments: product);
      },
      child: Container(
          width: 155.w,
          // قد تحتاج لتعديل الارتفاع إذا كان النص أو العناصر النائبة تأخذ مساحة مختلفة
          // height: 235.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(9),
            ),
            // يمكنك إضافة حدود أو ظل إذا أردت تمييز العناصر
            // border: Border.all(color: Colors.grey.shade300),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(children: [
                // استخدام الصورة من الشبكة أو صورة افتراضية
                AppCachedNetworkImage(
                  width: 155.w,
                  height: 94.h,
                  // استخدام ?? للتعامل مع null، والتحقق من أنه ليس فارغًا أيضًا
                  // إذا كانت AppCachedNetworkImage لا تتعامل مع null/empty، استخدم شرطًا
                  image: (product.thumbnailUrl != null && product.thumbnailUrl!.isNotEmpty)
                      ? product.thumbnailUrl!
                      : placeholderImageUrl, // يمكنك وضع رابط URL هنا أيضاً
                  radius: 9,
                  // يمكنك إضافة خيار fit إذا لزم الأمر
                  // fit: BoxFit.cover,
                  // يمكنك إضافة معالج خطأ هنا أيضاً إذا كانت AppCachedNetworkImage تدعمه
                  // errorWidget: (context, url, error) => Icon(Icons.error),
                  // placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                ),
                // زر المفضلة
                Positioned(
                    top: 8,
                    right: 8,
                    child: GestureDetector(
                        onTap: () {
                          onTap();
                        },
                        child: SizedBox(
                          width: 44,
                          height: 44,
                          child: isFavorite
                              ? SvgPicture.asset(
                                  "assets/img/heart-circle (2).svg")
                              : SvgPicture.asset(
                                  "assets/img/heart-circle (1).svg",
                                ),
                        )))
              ]),
              Padding(
                padding: const EdgeInsets.only(left: 3, right: 3, top: 8.0), // إضافة padding علوي ويمين
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      // استخدام ?? للتعامل مع العنوان الـ null
                      product.title ?? 'عنوان غير متوفر',
                      style: ThemeCubit.get(context).themeMode == ThemeMode.light
                          ? TextStyles.poppinsRegular16contantGray
                          : TextStyles.poppinsRegular16contantGray
                              .copyWith(color: Colors.white),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    // --- قسم التقييم والمبيعات (تم تبسيط السعر هنا) ---
                    Row(children: [
                      SvgPicture.asset(
                        'assets/img/star.svg',
                      ),
                      SizedBox(
                        width: 4.w,
                      ),
                      // يمكنك عرض التقييم هنا إذا كان موجوداً في المودل
                      Text(
                        "0.0", // استبدل بقيمة التقييم الفعلية إذا وجدت
                        style: TextStyles.poppinsRegular14lightGray,
                      ),
                      SizedBox(
                        width: 4.w,
                      ),
                      SvgPicture.asset(
                        'assets/img/Line 3.svg',
                      ),
                      SizedBox(
                        width: 14.5.w,
                      ),
                      // يمكنك عرض عدد المبيعات/المشتركين هنا إذا كان موجوداً
                      Text(
                        '0', // استبدل بعدد المبيعات الفعلي إذا وجد
                        style: TextStyles.poppinsRegular14lightGray,
                      ),
                    ]),
                    SizedBox(
                      height: 8.h,
                    ),
                    // --- عرض السعر بشكل آمن ---
                    Text(
                      // استخدام الدالة المساعدة لعرض السعر بشكل صحيح
                      getPriceDisplayString(product.salePrice),
                      style: TextStyles.poppinsRegular16blue,
                      maxLines: 1, // ضمان عدم تجاوز سطر واحد
                      overflow: TextOverflow.ellipsis, // قص النص الطويل
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}