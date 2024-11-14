
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/sharedWidgets/show_country_picker.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../generated/l10n.dart';
import '../../logic/profile_cubit.dart';

class CountrylistTile extends StatelessWidget {
  const CountrylistTile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        return ListTile(
          title: Text(S.of(context).Country, style: TextStyles.poppinsMedium16BlackMeduim),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(ProfileCubit.get(context).selectedCountry, style: TextStyles.poppinsRegular14LightGray),
              Icon(
                Icons.arrow_forward_ios,
                size: 20.sp,
                color: ColorsManager.primaryColorLight,
              ),
            ],
          ),
          onTap: () => ShowCountry.openCountryPicker(context),
        );
      },
    );
  }
}
