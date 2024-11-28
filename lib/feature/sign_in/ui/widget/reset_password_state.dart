import 'package:education/core/helpers/extensions.dart';
import 'package:education/feature/profile/logic/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../Utils/color_manager.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/sharedWidgets/show_dialog_error.dart';


import '../../../nav_bar/logic/nav_bar_cubit.dart';
import '../../logic/sign_in_cubit.dart';


class ResetPasswordState extends StatelessWidget {
  const ResetPasswordState({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInCubit, SignInState>(
      listener: (context, state) {
        if (state is ResetPasswordLoading) {
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) =>const PopScope(
              canPop: false,
              child:  Center(
                child: CircularProgressIndicator(
                  color: ColorManager.primaryColor,
                ),
              ),
            ),
          );
        } else if (state is ResetPasswordSuccess) {
          Navigator.pop(context);
          NavBarCubit.get(context).changeIndex(0);
          context.pushNamedAndRemoveUntil(
            Routes.navBarScreen,
            predicate: (Route<dynamic> route) => false,
          );
          
        } else if (state is ResetPasswordFailure) {

          Navigator.pop(context);
          print("lllll");

          ShowDialogError.showErrorDialog(context, 'Error', state.error.message!);
        }  else {}
      },
      child: const SizedBox.shrink(),
    );
  }
}
