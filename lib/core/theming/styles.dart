import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';
import 'font_weight.dart';

class TextStyles {


  static TextStyle latoRegular15lightBlack =GoogleFonts.lato(
    fontSize: 15.sp, // Responsive font size (assuming screen_util is used)
    fontWeight: FontWeightHelper.regular, // Custom font weight or directly use FontWeight.bold
    color: ColorsManager.lightBlack, // Custom color
  );

    static TextStyle latoRegular14lightBlack = GoogleFonts.lato(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.regular,
    color: ColorsManager.lightBlack,
  );

  static TextStyle latoBold28DarkBlack =GoogleFonts.lato(
    fontSize: 28.sp, // Responsive font size (assuming screen_util is used)
    fontWeight: FontWeightHelper.medium, // Custom font weight or directly use FontWeight.bold
    color: ColorsManager.darkBlack, // Custom color
  );

  static TextStyle latoBold20DarkBlack = GoogleFonts.lato(
    fontSize: 20.sp,
    fontWeight: FontWeightHelper.bold,
    color: ColorsManager.darkColor,
  );

  static TextStyle inter22BoldWhite = GoogleFonts.inter(
  fontSize: 22,
  fontWeight: FontWeight.bold,
  color: Colors.white, // Assuming a dark theme background
  );
  static TextStyle inter7RegularGray = GoogleFonts.inter(
    fontSize: 7.sp,
    fontWeight: FontWeightHelper.regular,
    color: Color(0xffABABAB), // Assuming a dark theme background
  );
  static TextStyle inter9RegularWhite = GoogleFonts.inter(
    fontSize: 9.sp,
    fontWeight: FontWeightHelper.medium,
    color: Colors.white, // Assuming a dark theme background
  );

  static TextStyle inter13SemiBoldLightGray = GoogleFonts.inter(
    fontSize: 13.sp,
    fontWeight: FontWeightHelper.semiBold,
    color: Color(0xff98A0B4), // Assuming a dark theme background
  );
  static TextStyle latoBold22DarkBlack = GoogleFonts.lato(
    fontSize: 22.sp,
    fontWeight: FontWeightHelper.semiBold,
    color: ColorsManager.darkColor,
  );
  static TextStyle latoBold22White = GoogleFonts.lato(
    fontSize: 22.sp,
    fontWeight: FontWeightHelper.semiBold,
    color: Colors.white,
  );
  static TextStyle latoRegular16DarkBlack = GoogleFonts.lato(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.regular,

    color: ColorsManager.darkBlack,
  );



  static TextStyle  latoRegular15DarkBlack=GoogleFonts.lato(
    fontSize: 15.sp, // Responsive font size (assuming screen_util is used)
    fontWeight: FontWeightHelper.regular, // Custom font weight or directly use FontWeight.bold
    color: ColorsManager.darkBlack, // Custom color
  );

  static TextStyle  latoBold36white=GoogleFonts.lato(
    fontSize: 36.sp, // Responsive font size (assuming screen_util is used)
    fontWeight: FontWeightHelper.semiBold, // Custom font weight or directly use FontWeight.bold
    color: Colors.white, // Custom color
  );
  static TextStyle  latoRegular15DarkGray=GoogleFonts.lato(
    fontSize: 15.sp, // Responsive font size (assuming screen_util is used)
    fontWeight: FontWeightHelper.regular, // Custom font weight or directly use FontWeight.bold
    color: Color(0xff2A2A2A), // Custom color
  );
  static TextStyle  urbanistMedium14Light=GoogleFonts.urbanist(
    fontSize: 14.sp, // Responsive font size (assuming screen_util is used)
    fontWeight: FontWeightHelper.medium, // Custom font weight or directly use FontWeight.bold
    color: Color(0xffFFFFFF), // Custom color
  );
  static TextStyle  urbanistregular18Lightgray=GoogleFonts.urbanist(
    fontSize: 18.sp, // Responsive font size (assuming screen_util is used)
    fontWeight: FontWeightHelper.regular, // Custom font weight or directly use FontWeight.bold
    color: Color(0xffCFCFCF), // Custom color
  );
  static TextStyle  urbanistSemiBold8Light=GoogleFonts.urbanist(
    fontSize: 8.sp, // Responsive font size (assuming screen_util is used)
    fontWeight: FontWeightHelper.semiBold, // Custom font weight or directly use FontWeight.bold
    color: Color(0xffFFFFFF), // Custom color
  );
  static TextStyle  urbanistSemiBold18Light=GoogleFonts.urbanist(
    fontSize: 18.sp, // Responsive font size (assuming screen_util is used)
    fontWeight: FontWeightHelper.semiBold, // Custom font weight or directly use FontWeight.bold
    color: Color(0xffFFFFFF), // Custom color
  );
  static TextStyle  urbanistRegular10Lightgray=GoogleFonts.urbanist(
    fontSize: 10.sp, // Responsive font size (assuming screen_util is used)
    fontWeight: FontWeightHelper.regular, // Custom font weight or directly use FontWeight.bold
    color: Color(0xff9E9E9E), // Custom color
  );
  static TextStyle  urbanistSemiBold20Light=GoogleFonts.urbanist(
    fontSize: 20.sp, // Responsive font size (assuming screen_util is used)
    fontWeight: FontWeightHelper.semiBold, // Custom font weight or directly use FontWeight.bold
    color: Color(0xffFFFFFF), // Custom color
  );

   static TextStyle  urbanistMedium14LightGray=GoogleFonts.urbanist(
     fontSize: 14.sp, // Responsive font size (assuming screen_util is used)
  fontWeight: FontWeightHelper.medium, // Custom font weight or directly use FontWeight.bold
    color: Color(0xff999999), // Custom color
   );
  //  static TextStyle  urbanistMedium14Light=GoogleFonts.urbanist(
  //   fontSize: 18.sp, // Responsive font size (assuming screen_util is used)
  //   fontWeight: FontWeightHelper.medium, // Custom font weight or directly use FontWeight.bold
  //    color: Color(0xffFFFFFF), // Custom color
  // );
  static TextStyle  latoLight18DarkGray=GoogleFonts.lato(
    fontSize: 18.sp, // Responsive font size (assuming screen_util is used)
    fontWeight: FontWeightHelper.light, // Custom font weight or directly use FontWeight.bold
    color: Color(0xffFFFFFF), // Custom color
  );
  static TextStyle  latoBold10lightWhite=GoogleFonts.lato(
    fontSize: 10.sp, // Responsive font size (assuming screen_util is used)
    fontWeight: FontWeightHelper.bold, // Custom font weight or directly use FontWeight.bold
    color: Color(0xffFFFFFF), // Custom color
  );
  static TextStyle  latoBold18lightWhite=GoogleFonts.lato(
    fontSize: 18.sp, // Responsive font size (assuming screen_util is used)
    fontWeight: FontWeightHelper.bold, // Custom font weight or directly use FontWeight.bold
    color: Color(0xffFFFFFF), // Custom color
  );

  static TextStyle  rubikRegular15DarkGray=GoogleFonts.rubik(
    fontSize: 15.sp, // Responsive font size (assuming screen_util is used)
    fontWeight: FontWeightHelper.regular, // Custom font weight or directly use FontWeight.bold
    color: Color(0xffA5A8B0), // Custom color
  );
  static TextStyle latoMedium15Darkgray = GoogleFonts.lato(
    fontSize: 15.sp,
    fontWeight: FontWeightHelper.medium,

    color: ColorsManager.darkGray,
  );

  static TextStyle  latoBold15DarkBlack=GoogleFonts.lato(
    fontSize: 15.sp, // Responsive font size (assuming screen_util is used)
    fontWeight:  FontWeightHelper.bold, // Custom font weight or directly use FontWeight.bold
    color: ColorsManager.darkBlack, // Custom color
  );

  static TextStyle latoMedium14DarkBlue = GoogleFonts.lato(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.medium,

    color: ColorsManager.darkBlue,
  );

   static TextStyle latoMedium17White = GoogleFonts.lato(
     fontSize: 17.sp,
     fontWeight: FontWeightHelper.medium,
     color: Colors.white,

   );






static TextStyle font15LightBlackBold = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeightHelper.bold,
    fontFamily: 'Lato-Bold',
    color: ColorsManager.lightBlack,
  );
  static TextStyle font12grayRegular = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeightHelper.regular,
    fontFamily: 'Lato',
    color: ColorsManager.gray,
  );
  static TextStyle latoRegular20gray = GoogleFonts.lato(
    fontSize: 20.sp,
    fontWeight: FontWeightHelper.regular,
    color: ColorsManager.gray,
  );


  static TextStyle latoSemiBold16Black= GoogleFonts.lato(
    fontSize: 16.4.sp,
    fontWeight: FontWeightHelper.semiBold,
    color: Colors.black,
  );
  static TextStyle latoSemiBold16darkGray= GoogleFonts.lato(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.semiBold,
    color: Color(0x99525252),
  );


  static TextStyle  latoRegular21White =GoogleFonts.lato(
    fontSize: 21.sp, // Responsive font size (assuming screen_util is used)
    fontWeight: FontWeightHelper.regular, // Custom font weight or directly use FontWeight.bold
    color: Colors.white, // Custom color
  );



  static TextStyle  latoRegular18White =GoogleFonts.lato(
    fontSize: 18.sp, // Responsive font size (assuming screen_util is used)
    fontWeight: FontWeightHelper.regular, // Custom font weight or directly use FontWeight.bold
    color: Colors.white, // Custom color
  );


  static TextStyle latoMedium8lLightGray= GoogleFonts.lato(
    fontSize: 8.sp,
    fontWeight: FontWeightHelper.medium,
    color: ColorsManager.lightGray,
  );
  static TextStyle latoRegular10lLightGray= GoogleFonts.lato(
    fontSize: 10.sp,
    fontWeight: FontWeightHelper.regular,
    color: ColorsManager.lightGray,
  );
  static TextStyle poppinsSemiBold12White= GoogleFonts.poppins(
    fontSize: 12.sp,
    fontWeight: FontWeightHelper.semiBold,
    color: Colors.white,
  );
  static TextStyle poppinsMedium12ContantGray= GoogleFonts.poppins(
    fontSize: 12.sp,
    fontWeight: FontWeightHelper.medium,
    color: ColorsManager.contantGray,
  );
  static TextStyle poppinsMedium24ContantGray= GoogleFonts.poppins(
    fontSize: 24.sp,
    fontWeight: FontWeightHelper.medium,
    color: ColorsManager.contantGray,
  );
  static TextStyle poppinsRegular12ContantGray= GoogleFonts.poppins(
    fontSize: 12.sp,
    fontWeight: FontWeightHelper.regular,
    color: ColorsManager.contantGray,
  );
  static TextStyle poppinsRegular16ContantGray= GoogleFonts.poppins(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.regular,
    color: ColorsManager.contantGray,
  );


  static TextStyle poppinsRegular12babyGray= GoogleFonts.poppins(
    fontSize: 12.sp,
    fontWeight: FontWeightHelper.regular,
    color: ColorsManager.LigGthGray,
  );
  static TextStyle poppinsLight12PrimaryColor= GoogleFonts.poppins(
    fontSize: 12.sp,
    fontWeight: FontWeightHelper.light,
    color: ColorsManager.primaryColorLight,
  );

  static TextStyle poppinsRegular16Gray= GoogleFonts.poppins(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.regular,
    color: ColorsManager.daGray,
  );

  static TextStyle poppinsRegular14lightGray= GoogleFonts.poppins(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.regular,
    color: ColorsManager.LigGthGray,
  );
  static TextStyle poppinsRegular20lightGray= GoogleFonts.poppins(
    fontSize: 20.sp,
    fontWeight: FontWeightHelper.regular,
    color: ColorsManager.LigGthGray,

  );

  static TextStyle poppinsRegular14babyblue= GoogleFonts.poppins(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.regular,
    color: ColorsManager.primaryColorLight,
  );
  static TextStyle poppinsRegular16Graymeduim= GoogleFonts.poppins(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.regular,
    color: ColorsManager.Graymeduim,
  );
  static TextStyle poppinsRegular12Blue= GoogleFonts.poppins(
    fontSize: 12.sp,
    fontWeight: FontWeightHelper.regular,
    color: ColorsManager.secondBlUE,
  );
  static TextStyle poppinsRegular14Blue= GoogleFonts.poppins(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.regular,
    color: ColorsManager.secondBlUE,
  );
  static TextStyle poppinsRegular16Blue= GoogleFonts.poppins(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.regular,
    color: ColorsManager.secondBlUE,
  );
  static TextStyle poppinsMedium20Blue= GoogleFonts.poppins(
    fontSize: 20.sp,
    fontWeight: FontWeightHelper.medium,
    color: ColorsManager.primaryColorLight,
  );

  static TextStyle poppinsRegular12LightGray= GoogleFonts.poppins(
    fontSize: 12.sp,
    fontWeight: FontWeightHelper.regular,
    color: ColorsManager.LigGthGray,
  );
  static TextStyle poppinsMedium20white= GoogleFonts.poppins(
    fontSize: 20.sp,
    fontWeight: FontWeightHelper.medium,
    color: Colors.white,
  );
  static TextStyle poppinsMedium18white= GoogleFonts.poppins(
    fontSize: 18.sp,
    fontWeight: FontWeightHelper.medium,
    color: Colors.white,
  );
  static TextStyle poppinsMedium20NavyBlue= GoogleFonts.poppins(
    fontSize: 20.sp,
    fontWeight: FontWeightHelper.medium,
    color: ColorsManager.NavyBlue,
  );

  static TextStyle poppinsMedium12white= GoogleFonts.poppins(
    fontSize: 12.sp,
    fontWeight: FontWeightHelper.medium,
    color: Colors.white,
  );
  static TextStyle poppinsRegular12white= GoogleFonts.poppins(
    fontSize: 12.sp,
    fontWeight: FontWeightHelper.regular,
    color: Colors.white,
  );
  static TextStyle poppinsRegular14white= GoogleFonts.poppins(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.regular,
    color: Colors.white,
  );
  static TextStyle poppinsMedium16BlackMeduim= GoogleFonts.poppins(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.regular,
    color: ColorsManager.Blackmeduim,
  );
  static TextStyle poppinsMedium20BlackMeduim= GoogleFonts.poppins(
    fontSize: 20.sp,
    fontWeight: FontWeightHelper.regular,
    color: ColorsManager.Blackmeduim,
  );

  static TextStyle poppinsMedium16BlackDark= GoogleFonts.poppins(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.regular,
    color: ColorsManager.contantGray,
  );
  static TextStyle poppinsRegular16contantGray= GoogleFonts.poppins(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.regular,
    color: ColorsManager.contantGray,
  );
  static TextStyle poppinsMedium16DarkGray= GoogleFonts.poppins(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.regular,
    color: ColorsManager.primaryDarkGray,
  );

  static TextStyle poppinsMedium24contantGray= GoogleFonts.poppins(
    fontSize: 24.sp,
    fontWeight: FontWeightHelper.regular,
    color: ColorsManager.contantGray,
  );
  static TextStyle poppinsMedium18contantGray= GoogleFonts.poppins(
    fontSize: 18.sp,
    fontWeight: FontWeightHelper.medium,
    color: ColorsManager.contantGray,
  );
  static TextStyle poppinsMedium18Blue= GoogleFonts.poppins(
    fontSize: 18.sp,
    fontWeight: FontWeightHelper.medium,
    color: ColorsManager.primaryColorLight,
  );
  static TextStyle poppinsMedium18LightGray= GoogleFonts.poppins(
    fontSize: 18.sp,
    fontWeight: FontWeightHelper.medium,
    color: ColorsManager.LigGthGray,
  );
  static TextStyle poppinsRegular14LightGray= GoogleFonts.poppins(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.regular,
    color: ColorsManager.LigGthGray,
  );
   static TextStyle poppinsRegular16LightGray= GoogleFonts.poppins(
     fontSize: 16.sp,
    fontWeight: FontWeightHelper.regular,
    color: ColorsManager.LigGthGray,
   );

  static TextStyle poppinsMedium12contantGray= GoogleFonts.poppins(
    fontSize: 12.sp,
    fontWeight: FontWeightHelper.regular,
    color: ColorsManager.contantGray,
  );

  static TextStyle poppinsRegular16blue= GoogleFonts.poppins(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.regular,
    color: ColorsManager.primaryColorLight,
  );

  static TextStyle poppinsRegular28blue= GoogleFonts.poppins(
    fontSize: 28.sp,
    fontWeight: FontWeightHelper.medium,
    color: ColorsManager.primaryColorLight,
  );




}
