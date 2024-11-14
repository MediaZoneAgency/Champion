
import 'package:education/feature/home/ui/widget/ad_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/theming/styles.dart';

class WishlistBar extends StatelessWidget {
  final String username;


  const WishlistBar({
    Key? key,
    required this.username,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
        Padding(
          padding: const EdgeInsets.only(left: 47,top:30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

 SizedBox(width:110.w),
              Text(
                '$username',
                style: TextStyles.poppinsMedium18contantGray
              ),

              SizedBox(width: 95.w),
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



            ],
          ),
        );


  }
}