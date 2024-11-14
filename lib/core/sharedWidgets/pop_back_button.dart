import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theming/colors.dart';

class PopBackButton extends StatelessWidget {
  const PopBackButton({
    super.key, this.onTap, this.child,
  });
final Function()? onTap;
final Widget? child;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 44.h,
        width: 44.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
            boxShadow:  [
              BoxShadow(
                  offset: const Offset(5, 10),
                  blurRadius: 20,
                  color: ColorsManager.Blackmeduim)
            ]),
        child:Center(
          child:
            child,

        ),
      ),
    );
  }
}