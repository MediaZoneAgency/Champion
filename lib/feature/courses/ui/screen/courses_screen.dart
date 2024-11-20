
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:lottie/lottie.dart';
class CourseScreen extends StatelessWidget {

  const CourseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Lottie.asset('assets/img/Animation - 1732019401672.json'),
      ),
    );
  }
}