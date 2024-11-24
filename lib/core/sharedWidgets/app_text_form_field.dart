import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../theming/colors.dart';

import '../theming/styles.dart';

// class AppTextFormField extends StatelessWidget {
//   final EdgeInsetsGeometry? contentPadding;
//   final InputBorder? focusedBorder;
//   final InputBorder? enabledBorder;
//   final TextStyle? inputTextStyle;
//   final TextStyle? hintStyle;
//   final String hintText;
//   final bool? isObscureText;
//   final Widget? suffixIcon;
//   final Widget? prefixIcon;
//   final Color? backgroundColor;
//   final TextEditingController? controller;
//   final String? Function(String?)? validator;
//   final String? Function(String?)? onSubmit;
//   const AppTextFormField({
//     super.key,
//     this.contentPadding,
//     this.focusedBorder,
//     this.enabledBorder,
//     this.inputTextStyle,
//     this.hintStyle,
//     required this.hintText,
//     this.isObscureText,
//     this.suffixIcon,
//     this.backgroundColor,
//     this.controller,
//     this.validator, this.onSubmit, this.prefixIcon,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: 326.w,
//       height: 44.h,
//       child: TextFormField(
//         controller: controller,
//         decoration: InputDecoration(
//           isDense: true,
//           contentPadding: contentPadding ??
//               EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
//           focusedBorder: focusedBorder ??
//               OutlineInputBorder(
//                 borderSide: const BorderSide(
//                   color: ColorsManager.mainBlue,
//                   width: 1.3,
//                 ),
//                 borderRadius: BorderRadius.circular(16.0),
//               ),
//           enabledBorder: enabledBorder ??
//               OutlineInputBorder(
//                 borderSide: const BorderSide(
//                   color: ColorsManager.lightGray,
//                   width: 1.3,
//                 ),
//                 borderRadius: BorderRadius.circular(10.0),
//               ),
//           errorBorder: OutlineInputBorder(
//             borderSide: const BorderSide(
//               color: Colors.red,
//               width: 1.3,
//             ),
//             borderRadius: BorderRadius.circular(10.0),
//           ),
//           focusedErrorBorder: OutlineInputBorder(
//             borderSide: const BorderSide(
//               color: Colors.red,
//               width: 1.3,
//             ),
//             borderRadius: BorderRadius.circular(10.0),
//           ),
//           hintStyle: hintStyle ?? TextStyles.latoRegular14lightBlack,
//           hintText: hintText,
//           suffixIcon: suffixIcon,
//           prefixIcon: prefixIcon,
//         ),
//         obscureText: isObscureText ?? false,
//         style: TextStyles.latoMedium14DarkBlue,
//         validator: validator,
//         onFieldSubmitted: onSubmit,
//       ),
//     );
//   }
// }


class AppTextFormField extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final double? borderRadius;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final String hintText;
  final bool? isObscureText;
  final Widget? prefexIcon;
  final Widget? suffixIcon;
  final Color? backgroundColor;
  final bool? readOnly;
  final String?labeltext;
  final VoidCallback? onTap;
  final Function(String)? onFieldSubmitted;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  const AppTextFormField({
    super.key,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.inputTextStyle,
    this.hintStyle,
    required this.hintText,
    this.isObscureText,
    this.suffixIcon,
    this.backgroundColor,
    this.controller,
    this.validator, this.prefexIcon, this.onFieldSubmitted, this.readOnly, this.onTap, this.borderRadius, this.labeltext,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(

      onTap: onTap,
      controller: controller,
      readOnly: readOnly ?? false,
      onFieldSubmitted: onFieldSubmitted,
      decoration: InputDecoration(
        label: Text(labeltext??""),
        labelStyle: TextStyles.poppinsRegular16Gray,
       // labelText: labeltext,
        isDense: true,
        contentPadding: contentPadding ??
            EdgeInsets.only(left: 10.w,right: 10.w,bottom: 32 ),
        focusedBorder: focusedBorder ??
            OutlineInputBorder(
              borderSide: const BorderSide(
                color:  ColorsManager.mainBlue,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(borderRadius?? 10.0),
            ),
        enabledBorder: enabledBorder ??
            OutlineInputBorder(
              borderSide: const BorderSide(
                color: ColorsManager.lightGray,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(borderRadius?? 10.0),
            ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1.3,
          ),
          borderRadius: BorderRadius.circular(borderRadius?? 10.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1.3,
          ),
          borderRadius: BorderRadius.circular(borderRadius?? 10.0),
        ),
        hintStyle: hintStyle ?? TextStyles.poppinsRegular16LightGray,
        hintText: hintText,
        suffixIcon: suffixIcon,
        prefixIcon: prefexIcon,
        fillColor: backgroundColor ?? Colors.transparent,
        filled: true,
      ),
      obscureText: isObscureText ?? false,
      style: TextStyles.poppinsMedium12contantGray.copyWith(fontSize: 16),
      validator: validator ?? (value) {
        if (value == null || value.isEmpty) {
          return "Must not be empty";
        }
        return null;
      },
    );
  }
}