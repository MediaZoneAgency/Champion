
import 'package:education/feature/home/ui/widget/ad_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/theming/styles.dart';

class HomeBar extends StatelessWidget {
  final String username;


  const HomeBar({
    Key? key,
    required this.username,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 60.h,),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [

              const CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage('assets/img/740712ae-9eae-4b47-b8cf-bee8736f3b46.jpg'), // Profile image URL
              ),

              const SizedBox(width: 8),
              Column(
                children: [
                  Text(
                    '$username',
                    style: TextStyles.poppinsRegular12ContantGray
                  ),
                  Text(
                      'UX Designer',
                      style: TextStyles.poppinsRegular12babyGray
                  ),
                ],
              ),

              SizedBox(width: 120.w),
              IconButton(
                icon: SvgPicture.asset(
                  width: 30,
                  height: 30,
                  'assets/img/search-normal.svg',
                  fit: BoxFit.scaleDown,
                ),
                onPressed: () {
                  // Notification button tapped
                },
              ),
              IconButton(
                icon: SvgPicture.asset(
                  width: 30,
                  height: 30,
                  'assets/img/notification.svg',
                  fit: BoxFit.scaleDown,
                ),
                onPressed: () {
                  // Notification button tapped
                },
              ),


            ],),
           SizedBox(height: 8.h,),

        ],
      ),

    );
  }
}