import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../logic/details_cubit.dart';


class ChoiseItem extends StatefulWidget {
  final String text;
  final bool isSelected;
  final ValueChanged<bool> onSelected;

  const ChoiseItem({
    Key? key,
    required this.text,
    required this.isSelected,
    required this.onSelected,
  }) : super(key: key);

  @override
  State<ChoiseItem> createState() => _ChoiseItemState();
}

class _ChoiseItemState extends State<ChoiseItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: BlocBuilder<DetailsCubit, DetailsState>(
        builder: (context, state) {
          return GestureDetector(
            onTap: () {
              widget.onSelected(!widget.isSelected);
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              width: 330.w,
              height: 55.h,
              decoration: BoxDecoration(
                color: ColorsManager.darkGray,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: widget.isSelected
                      ? ColorsManager.primaryColorLight
                      : Colors.transparent,
                  width: .7,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.text,
                    style: TextStyles.poppinsMedium16contantGray,
                  ),
                  Icon(
                    Icons.circle,
                    color: widget.isSelected
                        ? ColorsManager.primaryColorLight
                        : Colors.grey[800],
                    size: 16,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
