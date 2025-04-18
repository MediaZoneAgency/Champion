import 'package:education/core/helpers/extensions.dart';
import 'package:education/core/sharedWidgets/custom_text.dart';
import 'package:education/core/sharedWidgets/search_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/theming/styles.dart';
import '../../../../generated/l10n.dart';
import '../widget/field_widget.dart';


class FieldsScreen extends StatelessWidget {
   FieldsScreen({super.key});

  @override
  Widget build(BuildContext context) {
   return Scaffold(
          body: Padding(
            padding: EdgeInsets.fromLTRB(24, 24, 24, 0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpace(45),
                  AppText(title:"What profession are you learning for ?",description: "",),
                  //verticalSpace(16),
               CustomSearchBar(),
                  verticalSpace(16),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, ),
                    child: Text(
                      "Popular fields",
                      style: TextStyles.poppinsMedium20Blue,
                    ),
                  ),
                  verticalSpace(20),
                  FieldWidget(title: 'Design', onPressed: () {  context.pushNamed(Routes.navBarScreen);  },),
                  FieldWidget(title: 'Data & Analytics', onPressed: () {   context.pushNamed(Routes.navBarScreen); },),
                  FieldWidget(title: 'Finance & Accounting', onPressed: () {   context.pushNamed(Routes.navBarScreen); },),
                  FieldWidget(title: 'Information Technology', onPressed: () {    context.pushNamed(Routes.navBarScreen);},),
                  FieldWidget(title: 'Software Development', onPressed: () {   context.pushNamed(Routes.navBarScreen); },),
                  FieldWidget(title: 'Marketing', onPressed: () {   context.pushNamed(Routes.navBarScreen); },),

                        ],
                      ),
                    ),
                  ),
              );
      }
}

