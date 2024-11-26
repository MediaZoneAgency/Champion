import 'package:education/feature/profile/logic/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/sharedWidgets/app_text_button.dart';
import '../../../../core/sharedWidgets/app_text_form_field.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../generated/l10n.dart';
import '../../data/models/profile_model.dart';


class EditAccountInfoScreen extends StatefulWidget {
  EditAccountInfoScreen({super.key});

  @override
  State<EditAccountInfoScreen> createState() => _EditAccountInfoScreenState();
}

class _EditAccountInfoScreenState extends State<EditAccountInfoScreen> {
  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title:  Text(S.of(context).accountprofile,style: TextStyles.poppinsMedium18contantGray,),),
      backgroundColor: Colors.white,
      body: Column(
        children: [

          verticalSpace(15.h),
          CircleAvatar(
            radius: 40,
            backgroundColor: Colors.grey.shade300,
            child: Image.asset('assets/img/Ellipse 10.png'),
          ),
          SizedBox(height: 16.h,),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  S.of(context).Name,
                  style: TextStyles.poppinsRegular16Gray,
                ),
                SizedBox(height: 8.h,),
                AppTextFormField(hintText: S.of(context).Name,controller: _nameController,),
                SizedBox(height: 16.h,),
                Text(
                  S.of(context).Email,
                  style: TextStyles.poppinsRegular16Gray,
                ),
                SizedBox(height: 8.h,),
                AppTextFormField(hintText: S.of(context).Email,controller: _emailController,),
                SizedBox(height: 34,),
                BlocBuilder<ProfileCubit,ProfileState>(
  builder: (context, state) {
    return AppTextButton(
                  borderRadius: 10,
                  buttonHeight: 58.h,
                  buttonWidth: 327.w,
                  buttonText: S.of(context).Done,
                  textStyle: TextStyles.poppinsMedium20white,
                  onPressed: ()  {
                   ProfileCubit.get(context).editProfile(
                       ProfileModel(name:  _nameController.text,email:  _emailController.text,));

                  },
                );
  },
),
              ],
            ),
          ),verticalSpace(51.h),

        ],
      ),

    );
  }
}
