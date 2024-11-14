
import 'package:education/core/sharedWidgets/app_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/styles.dart';
import '../../../../generated/l10n.dart';

class SearchAppBar extends StatelessWidget {
  final IconData barIcon;
  final String title;
  final String? sufexIcon;
  final VoidCallback onPressed;
  final VoidCallback onTap;
  const SearchAppBar({super.key, required this.barIcon, required this.onPressed, required this.title, this.sufexIcon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric( vertical: 10),
      child:Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(color: Colors.grey,width: 0.5.w),),
        height: 51.h,
        width:256.w ,
        child: Row(
          children: [
AppTextFormField(hintText: S.of(context).Searchcourseorcategoty,controller: TextEditingController(),),
          ],
        ),
      )
    );
  }
}

//   horizontalSpace(18.w),
//   SvgPicture.asset("assets/img/search-normal.svg",fit: BoxFit.scaleDown,),
//   horizontalSpace(14.5.w),
//   Text(S.of(context).Searchcourseorcategoty,style: TextStyles.poppinsMedium12white.copyWith(color: Colors.grey),),
//