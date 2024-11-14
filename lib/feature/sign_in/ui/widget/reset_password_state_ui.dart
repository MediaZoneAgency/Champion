
import 'package:education/core/helpers/extensions.dart';
import 'package:education/core/theming/colors.dart';
import 'package:education/feature/sign_in/logic/sign_in_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/routes/routes.dart';
import '../../../../core/sharedWidgets/show_dialog_error.dart';
class ResetPasswordStateUi extends StatelessWidget {
  const ResetPasswordStateUi({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInCubit, SignInState>(
      listener: (context, state) {
        if (state is ResetPasswordLoading) {
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) => const Center(
              child: CircularProgressIndicator(
                color: ColorsManager.darkColor,
              ),
            ),
          );
        } else if (state is  ResetPasswordSuccess) {
          Navigator.pop(context);
          context.pushNamedAndRemoveUntil(
            Routes.loginScreen,
            predicate: (Route<dynamic> route) => false,
          );
        } else if (state is ResetPasswordFailure) {
          Navigator.pop(context);
          ShowDialogError.showErrorDialog(context, 'Error', state.error.message!);
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
