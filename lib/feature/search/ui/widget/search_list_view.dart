import 'package:education/feature/cart/ui/widget/cart_widget.dart';
import 'package:education/feature/home/logic/product_cubit.dart';
import 'package:education/feature/home/ui/widget/course_widget.dart';
import 'package:education/feature/search/ui/widget/search_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/colors.dart';
import '../../logic/search_cubit.dart';


class SearchListView extends StatelessWidget {
  const SearchListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        return SizedBox(
          height: 720,
          child: ListView.separated(
            itemCount: SearchCubit.get(context).searchResults.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                child: SearchWidget(SearchCubit.get(context).searchResults[index]),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return Column(children: [
                SizedBox(height: 10.h,),
                const Divider(
                  color: ColorsManager.LigGthGray,
                  indent: 30,
                  endIndent: 30,
                  thickness: 0.3,
                ),
                SizedBox(height: 10.h,),


              ]);
            },
          ),
        );
      },
    );
  }
}
