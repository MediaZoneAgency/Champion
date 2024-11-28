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
import '../../../home/logic/home_cubit.dart';
import '../../../home/logic/product_cubit.dart';
import '../widget/field_widget.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(16),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  "Popular fields",
                  style: TextStyles.poppinsMedium20Blue,
                ),
              ),
              verticalSpace(20),
              // Dynamically display categories using Column and map
              Column(
                children: HomeCubit.get(context).categoryModel
                    .map(
                      (category) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: FieldWidget(
                      title: category.name!,
                      onPressed: () {
                        ProductCubit.get(context).getCategoryProducts( category.id!);
                        context.pushNamed(Routes.girdviewScreen,
                            arguments: category.name!
                        );
                      },
                    ),
                  ),
                )
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
