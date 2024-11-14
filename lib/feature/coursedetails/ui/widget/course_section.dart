import 'package:education/core/theming/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/theming/colors.dart';

class CourseSections extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
decoration: BoxDecoration(color: ColorsManager.primaryBlueLight),

        child: Column(children: [
          ExpansionTile(
            title: Text("Section 1 - Introduction",
            style:  TextStyles.poppinsRegular16blue),

            children: [
              ListTile(
                title: Text("1. Introduction"),
                subtitle: Text("Video - 1:39"),
                trailing: SvgPicture.asset(
                  'assets/img/video-square.svg',
                ),
              ),
              ListTile(
                title: Text("2. Why Python"),
                subtitle: Text("Video - 1:39"),
                trailing: SvgPicture.asset(
                  'assets/img/video-square.svg',
                ),)
            ],
          ),
          ExpansionTile(
            title: Text("Section 2 - Join the community",
                style:  TextStyles.poppinsRegular16blue),
            children: [
              ListTile(
                title: Text("1. Introduction"),
                subtitle: Text("Video - 1:39"),
                trailing: SvgPicture.asset(
                  'assets/img/video-square.svg',
                ),
              ),
              ListTile(
                title: Text("2. Why Python"),
                subtitle: Text("Video - 1:39"),
                trailing: SvgPicture.asset(
                  'assets/img/video-square.svg',
                ),
              ),
            ],
          ),
          ExpansionTile(
            title: Text("Section 3 - Project files",
                style:  TextStyles.poppinsRegular16blue
            ),
            children: [
              ListTile(
                title: Text("1. Introduction"),
                subtitle: Text("Video - 1:39"),
                trailing: SvgPicture.asset(
                  'assets/img/video-square.svg',
                ),
              ),
              ListTile(
                title: Text("2. Why Python"),
                subtitle: Text("Video - 1:39"),
                trailing: SvgPicture.asset(
                  'assets/img/video-square.svg',
                ),
              ),
            ],
          ),
          ExpansionTile(
            title: Text("Section 4 - Download and setup",
                style:  TextStyles.poppinsRegular16blue),
            children: [
              ListTile(
                title: Text("1. Introduction"),
                subtitle: Text("Video - 1:39"),
                trailing: SvgPicture.asset(
                  'assets/img/video-square.svg',
                ),
              ),
              ListTile(
                title: Text("2. Why Python"),
                subtitle: Text("Video - 1:39"),
                trailing: SvgPicture.asset(
                  'assets/img/video-square.svg',
                ),
              ),
            ],
          ),

        ],
        )
    );
  }
}