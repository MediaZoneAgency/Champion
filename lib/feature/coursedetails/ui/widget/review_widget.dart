import 'package:education/core/theming/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/theming/colors.dart';

class ReviewWidget extends StatelessWidget {
  const ReviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
        children: [

       SizedBox(height: 16.h,),
       Row(children: [
          const CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage('assets/img/Robert Downey Jr.png'), // Profile image URL
          ),
          SizedBox(width: 13.w,),
          Column(
            children: [
              Text(
                  "Tony stark",
                  style: TextStyles.poppinsMedium16DarkGray
              ),
              SizedBox(height: 4.h,),
              SvgPicture.asset(
                'assets/img/Rating (1).svg',
              ),

            ]
          ),
         SizedBox(width: 110.w,),
         Text(
             "1 Month ago",
             style: TextStyles.poppinsRegular12LightGray
         ),

        ],
       ),
          Padding(
            padding: const EdgeInsets.only(left: 50,),
            child: SizedBox(
              width: 275.w,
              height: 63.h,
              child: Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et ",
                  style: TextStyles.poppinsRegular14LightGray
              ),
            ),
          ),

      ],
      ),
    );
  }
}