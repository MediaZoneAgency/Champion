import 'package:education/core/sharedWidgets/search_bar.dart';
import 'package:education/feature/category/ui/widget/choise_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/styles.dart';
import '../../../../generated/l10n.dart';
import '../widget/field_widget.dart';


class TypeFieldsScreen extends StatelessWidget {
  const TypeFieldsScreen({super.key, required this.type});
  final String type ;
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
              Padding(
                padding: const EdgeInsets.only(left: 20, ),
                child: Text(
                  "Popular in $type",
                  style: TextStyles.poppinsMedium20Blue,
                ),
              ),
              verticalSpace(20),
              //ChoiseItem(text: text, isSelected: isSelected, onSelected: onSelected)


            ],
          ),
        ),
      ),
    );
  }
}

