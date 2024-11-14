import 'package:education/Utils/color_manager.dart';
import 'package:education/core/sharedWidgets/app_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../generated/l10n.dart';
import '../../../home/ui/widget/courses_list_view.dart';
import '../../logic/search_cubit.dart';
import '../widget/custom_search_bar.dart';
import '../widget/search_list_view.dart';

class SearchResultScreen extends StatefulWidget {
  @override
  _SearchResultScreenState createState() => _SearchResultScreenState();
}

class _SearchResultScreenState extends State<SearchResultScreen> {
  final TextEditingController _searchController = TextEditingController();
  bool _designChecked = false;
  bool _uxChecked = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        return Scaffold(

          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: CustomScrollView(slivers: [
              SliverToBoxAdapter(

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SearchTextFormField(

                      hintText: S.of(context).Searchcourseorcategoty,
                      controller: _searchController,
                      prefixIcon: SvgPicture.asset(
                        "assets/img/search-.svg",
                        fit: BoxFit.scaleDown,
                      ),
                      onSubmit:(value){
                        SearchCubit.get(context).fetchSearchResults( _searchController.text);
                      },

                    ),
                    SizedBox(height: 16.0),
                   SearchListView(),
                  ],

                ),
            )]
              ),
            ),
          ),
        );
      },
    );
  }
}
