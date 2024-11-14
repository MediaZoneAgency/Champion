
import 'package:education/core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/routes/routes.dart';
import '../../../../core/sharedWidgets/show_dialog_error.dart';
import '../../../../core/theming/colors.dart';
import '../../logic/profile_cubit.dart';

class EditProfileStateUi extends StatelessWidget {
  const EditProfileStateUi({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileCubit, ProfileState>(
      listener: (context, state) async{
        if (state is EditProfileLoading) {
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) => const Center(
              child: CircularProgressIndicator(
                color: ColorsManager.primaryColorLight,
              ),
            ),
          );
        } else if (state is EditProfileSuccess ) {
          Navigator.pop(context);
          ProfileCubit.get(context).getProfile();
          context.pushReplacementNamed(
            Routes.accountInfoScreen,
         
          );
        } else if (state is EditProfileFailure) {
          Navigator.pop(context); // Close loading dialog
          ShowDialogError.showErrorDialog(context, 'Error', state.error.message!);
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
