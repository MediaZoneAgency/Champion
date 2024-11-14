import 'package:education/core/helpers/extensions.dart';
import 'package:education/core/sharedWidgets/app_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/routes/routes.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../generated/l10n.dart';
import '../../logic/search_cubit.dart';
import '../widget/custom_search_bar.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  bool _designChecked = false;
  bool _uxChecked = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
  builder: (context, state) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).Search),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
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
                    context.pushNamed(Routes.resultScreen);

              SearchCubit.get(context).fetchSearchResults( _searchController.text);
              },
              
              ),
              SizedBox(height: 16.0),
              Text(S.of(context).Lastestsearch,
                style: TextStyles.poppinsRegular16ContantGray.copyWith(color: ColorsManager.primaryDarkGray),),

              SizedBox(height: 20.0),
              Row(
                children: [
                  SvgPicture.asset(
                    "assets/img/clock.svg",
                    fit: BoxFit.scaleDown,
                  ),
                  SizedBox(width: 10.w,),

                  Text('Design',
                    style: TextStyles.poppinsRegular14lightGray.copyWith(color: ColorsManager.primaryDarkGray),),
                  SizedBox(width: 10.w,),
                  SvgPicture.asset(
                    "assets/img/x.svg",
                    fit: BoxFit.scaleDown,
                  ),

                ],
              ),
              SizedBox(height: 25.h,),
              Row(
                children: [
                  SvgPicture.asset(
                    "assets/img/clock.svg",
                    fit: BoxFit.scaleDown,
                  ),
                  SizedBox(width: 10.w,),

                  Text('Design',
                    style: TextStyles.poppinsRegular14lightGray.copyWith(color: ColorsManager.primaryDarkGray),),
                  SizedBox(width: 10.w,),
                  SvgPicture.asset(
                    "assets/img/x.svg",
                    fit: BoxFit.scaleDown,
                  ),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  },
);
  }
}
