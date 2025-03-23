import 'package:education/core/helpers/extensions.dart';
import 'package:education/core/theming/theming_change/theme_cubit.dart';
import 'package:education/core/theming/theming_change/theme_cubit.dart';
import 'package:education/feature/coursedetails/data/models/product_model.dart';
import 'package:education/feature/profile/logic/profile_cubit.dart';
import 'package:education/feature/profile/logic/profile_cubit.dart';
import 'package:education/feature/wishlist/logic/cubit/fav_cubit.dart';
import 'package:education/feature/wishlist/logic/cubit/fav_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../home/logic/product_cubit.dart';
import 'package:html/parser.dart' as html_parser;

class DetailsWidget extends StatelessWidget {
  const DetailsWidget(this.product, {super.key});

  final ProductModel product;

  @override
  String _removeHtmlTags(String htmlString) {
    var document = html_parser.parse(htmlString);
    return document.body?.text ?? "";
  }

  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top:10.h,left: 18.w,right: 15.w),
      child: BlocBuilder<ThemeCubit ,ThemeState>(
  builder: (context, state) {
    return Container(

          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Add your content here
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 330.w,
                        height: 220.h,
                        foregroundDecoration: BoxDecoration(
                        //  color: Colors.black.withOpacity(.3),
                          borderRadius: BorderRadius.all(Radius.circular(10.r)),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(.3),
                          image: DecorationImage(

                            image: NetworkImage(
                                product.thumbnailUrl!
                            ),
                         //   fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10.r)),
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                                top: 10,
                                left: 10,
                                child:GestureDetector(
                                  onTap: () {
                                    context.pushNamed(Routes.cartScreen);
                                  },
                                  child: SvgPicture.asset(
                                    'assets/img/arrow-left (1).svg',
                                  ),
                                ),),
                            Positioned(
                            top:90.h,
                             right: 110.w,
                              child:GestureDetector(
                                onTap: () {
                                  context.pushNamed(Routes.cartScreen);
                                },
                                child: SvgPicture.asset(
                                  'assets/img/play.svg',
                                ),
                              ),),
                            Positioned(top: 10,
                              right: 60,
                              child: GestureDetector(
                                onTap: () {
                                  context.pushNamed(Routes.cartScreen);
                                },
                                child: SvgPicture.asset(
                                  ThemeCubit.get(context).themeMode== ThemeMode.light ?
                                  'assets/img/cart-circle.svg':'assets/img/darkcarrt.svg',
                                ),
                              ),),
                            BlocBuilder<ProfileCubit, ProfileState >(
                              builder: (context, state) {
                                return BlocBuilder<FavCubit, FavState>(
                                  builder: (context, state) {
                                    return Positioned(
                                      top: 10,
                                      right: 10,
                                      child: GestureDetector(
                                        onTap: () {
                                          if (ProfileCubit.get(context).profileUser != null){
                                            if( FavCubit.get(context).favorite.contains(
                                                product.id)
                                            ){
                                              FavCubit.get(context).removeFromWishList(
                                                  product
                                              );
                                            }else{
                                              FavCubit.get(context).addToWishList(model: product);
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
                                        child:    FavCubit.get(context).favorite.contains(
                                          product.id)
                                            ? SvgPicture.asset(
                                            ThemeCubit.get(context).themeMode== ThemeMode.light ?
                                            "assets/img/heart-circle (2).svg":"assets/img/heart-circle (2).svg")
                                            : SvgPicture.asset(

                                          "assets/img/lastheartligh.svg",
                                        ),
                                      ),

                                    );
                                  },
                                );
                              },
                            ),

                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 8.h,),
                    Text(product.title ?? " not valid",
                      style:   ThemeCubit.get(context).themeMode== ThemeMode.light ? TextStyles.poppinsMedium24contantGray:TextStyles.poppinsMedium24ContantGray.copyWith(color:Colors.white),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,),
                    SizedBox(
                      width: 327.w,
                      height: 120.h,
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: _removeHtmlTags(product.content ?? "nnnn"),
                              style: ThemeCubit.get(context).themeMode == ThemeMode.light
                                  ? TextStyles.poppinsRegular20lightGray.copyWith(
                                overflow: TextOverflow.ellipsis,
                                fontSize: 18.sp,
                              )
                                  : TextStyles.poppinsRegular20lightGray.copyWith(
                                color: Colors.white,
                                overflow: TextOverflow.ellipsis,
                                fontSize: 18.sp,
                              ),
                            ),
                            WidgetSpan(
                              child: GestureDetector(
                                onTap: () {
                                  // Handle "See More" tap
                                },
                                child: Text(
                                  ' See More',
                                  style: ThemeCubit.get(context).themeMode == ThemeMode.light
                                      ? TextStyles.poppinsRegular14babyblue.copyWith(
                                    decoration: TextDecoration.underline,
                                  )
                                      : TextStyles.poppinsRegular14babyblue.copyWith(
                                    color: Colors.white,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    Row(
                        children: [
                          Text(product.salePrice.toString(),
                            style:
                            ThemeCubit.get(context).themeMode== ThemeMode.light?
                            TextStyles.poppinsRegular14lightGray:TextStyles.poppinsRegular14lightGray.copyWith(color: Colors.white),),
                          SizedBox(width: 4.w,),
                          SvgPicture.asset(
                            'assets/img/star2.svg',
                          ),
                          SvgPicture.asset(
                            'assets/img/star2.svg',
                          ),
                          SvgPicture.asset(
                            'assets/img/star2.svg',
                          ),
                          SvgPicture.asset(
                            'assets/img/star2.svg',
                          ),

                          SizedBox(width: 16.w,),
                          Text(product.salePrice.toString(),
                            style:
                            ThemeCubit.get(context).themeMode== ThemeMode.light?
                            TextStyles.poppinsRegular14lightGray:TextStyles.poppinsRegular14lightGray.copyWith(color: Colors.white),),
                          SizedBox(width: 14.w,),

                        ]
                    ),
                    Row(
                      children: [
                        Text('Created by',
                          style:
                          ThemeCubit.get(context).themeMode== ThemeMode.light?
                          TextStyles.poppinsMedium18contantGray:TextStyles.poppinsMedium18contantGray.copyWith(color: Colors.white),),
                        SizedBox(width: 4.w,),
                        Text('Mark Krov',
                          style:
                          TextStyles.poppinsMedium18Blue.copyWith(
                              decoration: TextDecoration.underline
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h,),
                    Row(
                      children: [
                        SvgPicture.asset(
                          ThemeCubit.get(context).themeMode== ThemeMode.light?
                          'assets/img/calendar-2.svg':'assets/img/calendar-2dark.svg'
                          ,
                        ),
                        SizedBox(width: 4.w,),
                        Text('Last Update ${product.salePrice}',
                            style:  ThemeCubit.get(context).themeMode== ThemeMode.light?
                            TextStyles.poppinsMedium16BlackDark:TextStyles.poppinsMedium16BlackDark.copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                    SizedBox(height: 12.h,),
                    Row(
                      children: [
                        SvgPicture.asset(
                          ThemeCubit.get(context).themeMode== ThemeMode.light?
                          'assets/img/Group (2).svg':'assets/img/langudark.svg',
                        ),
                        SizedBox(width: 4.w,),
                        Text('English',
                            style:
                            ThemeCubit.get(context).themeMode== ThemeMode.light?
                            TextStyles.poppinsMedium16BlackDark:TextStyles.poppinsMedium16BlackDark.copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                    SizedBox(height: 12.h,),
                    Row(
                      children: [
                        SvgPicture.asset(
                          ThemeCubit.get(context).themeMode== ThemeMode.light?
                          'assets/img/cc.svg':'assets/img/dark33.svg',
                        ),
                        SizedBox(width: 4.w,),
                        Text('English , Arabic ,Spanish',
                            style:
                            ThemeCubit.get(context).themeMode== ThemeMode.light?
                            TextStyles.poppinsMedium16BlackDark:TextStyles.poppinsMedium16BlackDark.copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: [

                        Text(product.salePrice.toString(),
                          style: TextStyles.poppinsRegular28blue,),
                        SizedBox(width: 16.w,),
                        Text(product.salePrice.toString(),

                          style:
                          ThemeCubit.get(context).themeMode== ThemeMode.light?
                          TextStyles.poppinsMedium18contantGray.copyWith(
                              decoration: TextDecoration.lineThrough
                          ):TextStyles.poppinsMedium18contantGray.copyWith(color: Colors.white,decoration: TextDecoration.lineThrough),
                        ),
                      ],
                    ),
                    SizedBox(height: 30.h,),
                    Text('Course Details',
                      style:
                      ThemeCubit.get(context).themeMode== ThemeMode.light?
                      TextStyles.poppinsMedium18contantGray:TextStyles.poppinsMedium18contantGray.copyWith(color: Colors.white),),
                    SizedBox(height: 8.h,),
                    Row(
                      children: [

                        SizedBox(width: 4.w,),
                        SizedBox(
                          width: 320.w,
                          height: 60.h,
                          child: Text(
                              '4 sections . 55 lectures.6h 56m total length',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style:
                              ThemeCubit.get(context).themeMode== ThemeMode.light?
                              TextStyles.poppinsMedium16BlackDark:TextStyles.poppinsMedium16BlackDark.copyWith(color: Colors.white)
                          ),
                        ),
                      ],
                    ),

                  ],
                )
              ])
      );
  },
),
    );
  }
}

