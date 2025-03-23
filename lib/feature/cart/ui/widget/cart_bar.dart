
import 'package:education/core/helpers/extensions.dart';
import 'package:education/feature/home/ui/widget/ad_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/routes/routes.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/theming/theming_change/theme_cubit.dart';

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
                style: ThemeCubit.get(context).themeMode== ThemeMode.light ?
                TextStyles.poppinsMedium18contantGray: TextStyles.poppinsMedium18contantGray.copyWith(color:Colors.white),

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

class profileBar extends StatelessWidget {
  final String username;


  const profileBar({
    Key? key,
    required this.username,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(),
            Text(
                '$username',
                style: ThemeCubit.get(context).themeMode== ThemeMode.light ?
                 TextStyles.poppinsMedium18contantGray: TextStyles.poppinsMedium18contantGray.copyWith(color:Colors.white),

            ),

            Spacer(),
            // IconButton(
            //   icon: SvgPicture.asset(
            //     width: 30,
            //     height: 30,
            //     'assets/img/search-normal.svg',
            //     fit: BoxFit.scaleDown,
            //   ),
            //   onPressed: () {
            //     context.pushNamed(Routes.searchScreen);
            //   },
            // ),



          ],
        ),
      );


  }
}