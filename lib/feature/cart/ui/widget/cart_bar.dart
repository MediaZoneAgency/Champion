
import 'package:education/core/helpers/extensions.dart';
import 'package:education/feature/home/ui/widget/ad_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/routes/routes.dart';
import '../../../../core/theming/styles.dart';

class CartBar extends StatelessWidget {
  final String username;


  const CartBar({
    Key? key,
    required this.username,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
        Padding(
          padding: const EdgeInsets.only(left: 47,),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Spacer(),
              Text(
                '$username',
                style: TextStyles.poppinsMedium18contantGray
              ),

            Spacer(),
              IconButton(
                icon: SvgPicture.asset(
                  width: 30,
                  height: 30,
                  'assets/img/search-normal.svg',
                  fit: BoxFit.scaleDown,
                ),
                onPressed: () {
                  context.pushNamed(Routes.searchScreen);
                },
              ),



            ],
          ),
        );


  }
}