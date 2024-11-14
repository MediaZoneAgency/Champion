import 'package:education/feature/coursedetails/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widget/details_widget.dart';

class AfterBuyingCourse extends StatefulWidget {
  const AfterBuyingCourse(this.product,{super.key, });
  final ProductModel product;
  @override
  State<AfterBuyingCourse> createState() => _AfterBuyingCourseState();
}

class _AfterBuyingCourseState extends State<AfterBuyingCourse> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50.h),
                DetailsWidget(widget.product),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
