
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/theming/styles.dart';


class FieldWidget extends StatelessWidget {
  const FieldWidget({super.key, required this.title});
final String title ;
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Text(
              title,
              style: TextStyles.poppinsMedium16contantGray,
            ),
            const Spacer(),
            SvgPicture.asset(
              'assets/img/arrow-right (1).svg',
              fit: BoxFit.scaleDown,
            ),

          ],
        ),
      ),
    );

  }
}