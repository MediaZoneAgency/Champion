import 'package:education/core/sharedWidgets/custom_text.dart';
import 'package:education/core/sharedWidgets/search_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../generated/l10n.dart';
import '../widget/field_widget.dart';


class FieldsScreen extends StatelessWidget {
   FieldsScreen({super.key});



  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
   return Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpace(64),
                  AppText(title:"What profession are you learning for ?",description: "",),
                  verticalSpace(16),
               CustomSearchBar(),

              FieldWidget(title: 'Design',),

                        ],
                      ),
                    ),
                  ),
              );
      }
}

