import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/font_weight.dart';
import '../../../../core/theming/styles.dart';
import '../../../../generated/l10n.dart';

class AdCarousel extends StatefulWidget {
  const AdCarousel({super.key});

  @override
  _AdCarouselState createState() => _AdCarouselState();
}

class _AdCarouselState extends State<AdCarousel> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<String> _timeLeft = [
    "5h 51m 16s",
    "3h 45m 10s",
    "1h 20m 05s",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 370.w,
      height: 135.h,
      child: Stack(
        children: [
          SizedBox(
            height: 135.h,
            width: 370.w,
            child: PageView.builder(
              controller: _pageController,
              itemCount: _timeLeft.length,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return AdContainer(timeLeft: _timeLeft[index]);
              },
            ),
          ),
          Positioned(
            bottom: 8.h,
            left: 0,
            right: 0,
            child: Center(
              child: SmoothPageIndicator(
                controller: _pageController,
                count: _timeLeft.length,
                effect: ExpandingDotsEffect(
                  dotHeight: 5.0,
                  dotWidth: 8.0,
                  activeDotColor: Colors.white,
                  dotColor: Colors.grey,
                  expansionFactor: 2.5,
                  spacing: 4.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AdContainer extends StatelessWidget {
  final String timeLeft;

  const AdContainer({super.key, required this.timeLeft});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 370.w,
      height: 135.h,
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: ColorsManager.BlueLIght,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Expanded( // Use Expanded to ensure the Row can layout properly
            child: Padding(
              padding: EdgeInsets.only(left: 17.w, right: 17.w, top: 20.h, bottom: 4.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    S.of(context).Todaysspecial,
                    style: TextStyles.poppinsMedium20white,
                    maxLines: 1,
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    S.of(context).bestfeatures,
                    style: TextStyles.poppinsRegular12white,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,

                  ),
                  Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: 3, // Replace with actual list length
                      itemBuilder: (context, index) {

                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only( top: 30.h, right: 10.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  S.of(context).Endsin,
                  style: TextStyles.poppinsRegular14white,
                ),
                SizedBox(height: 4.h),
                Text(
                  timeLeft,
                  style: TextStyles.poppinsMedium20white,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  softWrap: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}